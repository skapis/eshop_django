from django.shortcuts import render, redirect
from .models import Product, ProductCategory, Currency, OrderStatus, ShopCart, Shipping, PaymentMethod, Order, \
    OrderItem, Country
from django.contrib import messages
from django.http import HttpResponseRedirect, JsonResponse
from datetime import datetime
from django.views import View
from userprofile.models import UserPreference, UserAddress
from django.core.mail import EmailMultiAlternatives
from django.template.loader import get_template
from django.utils.safestring import mark_safe


# main page of eshop, site with all products and etc.
class ProductPage(View):
    def get(self, request):
        products = Product.objects.filter(is_visible=True)
        sort_by = request.GET.get("sort")
        if sort_by == 'l2h':
            products = products.order_by('price')
        elif sort_by == 'h2l':
            products = products.order_by('-price')
        categories = ProductCategory.objects.all()
        context = {
            'products': products,
            'categories': categories
        }
        return render(request, 'shop/index.html', context)


# view with products in shopcart
class Cart(View):
    def get(self, request):
        currency = Currency.objects.get(used=True)
        categories = ProductCategory.objects.all()
        if request.user.is_authenticated:
            cart = ShopCart.objects.filter(owner=request.user.email)
            total = 0
            for item in cart:
                item.total_price = item.product_id.price * item.amount
                item.save()
                total += item.total_price
            context = {
                'categories': categories,
                'cart': cart,
                'total': total,
                'currency': currency.symbol
            }
            return render(request, 'shop/cart.html', context)

        if request.COOKIES.get('user'):
            user_id = request.COOKIES.get('user')
            cart = ShopCart.objects.filter(user_id=user_id)
            total = 0
            for item in cart:
                item.total_price = item.product_id.price * item.amount
                item.save()
                total += item.total_price
            context = {
                'categories': categories,
                'cart': cart,
                'total': total,
                'currency': currency.symbol
            }
            return render(request, 'shop/cart.html', context)
        messages.error(request, 'Sorry for now, you must be signed in to add products in cart')
        return redirect('login')


def search_products(request):
    categories = ProductCategory.objects.all()
    if request.method == 'POST':
        search_str = request.POST['searchText']
        products = Product.objects.filter(product_name__icontains=search_str)
        context = {
            'products': products,
            'categories': categories
        }
        return render(request, 'shop/index.html', context)


def product_detail(request, product_id):
    product = Product.objects.get(pk=product_id)
    categories = ProductCategory.objects.all()
    context = {
        'product': product,
        'categories': categories
    }
    return render(request, 'shop/product_detail.html', context)


class CategoryPage(View):
    def get(self, request, category_name):
        categories = ProductCategory.objects.all()
        products = Product.objects.filter(product_category=ProductCategory.objects.get(name=category_name).pk,
                                          is_visible=True)
        sort_by = request.GET.get("sort")
        if sort_by == 'l2h':
            products = products.order_by('price')
        elif sort_by == 'h2l':
            products = products.order_by('-price')
        context = {
            'categories': categories,
            'products': products
        }
        return render(request, 'shop/category.html', context)


def add_to_cart(request, product_id):
    if request.method == 'POST':
        if request.user.is_authenticated:
            product = Product.objects.get(pk=product_id)
            # check if user has already this product in cart
            try:
                cart_product = ShopCart.objects.filter(owner=request.user.email).get(product_id=product_id)
                cart_product.amount = cart_product.amount + 1
                cart_product.total_price = cart_product.amount * cart_product.total_price
                cart_product.save()
            except:
                ShopCart.objects.create(owner=request.user.email, product_id=product, amount=1,
                                        currency=product.currency.code, total_price=product.price)
            messages.success(request, mark_safe(f'{product.product_name} was added to <a href=/cart>cart</a>'))
            return HttpResponseRedirect(request.META.get('HTTP_REFERER'))

        if request.COOKIES.get('user'):
            user_id = request.COOKIES.get('user')
            product = Product.objects.get(pk=product_id)
            # check if user has already this product in cart
            try:
                cart_product = ShopCart.objects.filter(owner=request.user.email).get(product_id=product_id)
                cart_product.amount = cart_product.amount + 1
                cart_product.total_price = cart_product.amount * cart_product.total_price
                cart_product.save()
            except:
                ShopCart.objects.create(user_id=user_id, product_id=product, amount=1,
                                        currency=product.currency.code, total_price=product.price)
            messages.success(request, mark_safe(f'{product.product_name} was added to <a href=/cart>cart</a>'))
            return HttpResponseRedirect(request.META.get('HTTP_REFERER'))

        messages.error(request, 'Something is wrong, please try again')
        return HttpResponseRedirect(request.META.get('HTTP_REFERER'))


# to delete one item from cart
def delete_from_cart(request, cart_id):
    if request.method == 'POST':
        cart = ShopCart.objects.get(cart_id=cart_id)
        cart.delete()
        messages.success(request, f'{cart.product_id.product_name} was removed from the cart')
        return redirect('cart')


# to delete all items from cart
def delete_cart_all(request):
    if request.method == 'POST':
        try:
            cart = ShopCart.objects.filter(owner=request.user.email)
        except:
            user_id = request.COOKIES.get('user')
            cart = ShopCart.objects.filter(user_id=user_id)
        cart.delete()
        messages.success(request, 'All items from cart were removed')
        return redirect('cart')


# to increase or decrease amount of product in shop cart
def update_cart(request, cart_id, qty):
    cart_item = ShopCart.objects.get(cart_id=cart_id)
    cart_item.amount = qty
    cart_item.total_price = qty * cart_item.product_id.price
    cart_item.save()
    return JsonResponse({
        'qty': qty,
        'total': cart_item.total_price,
        'available_amount': cart_item.product_id.available_amount - qty
    })


# count total price of all product in cart
def cart_sub_total(request):
    try:
        cart = ShopCart.objects.filter(owner=request.user.email)
    except:
        user_id = request.COOKIES.get('user')
        cart = ShopCart.objects.filter(user_id=user_id)
    total = 0
    for item in cart:
        total += item.total_price
    return JsonResponse({'total': total})


def create_order(request):
    categories = ProductCategory.objects.all()
    payment = PaymentMethod.objects.all().order_by('price')
    shipping = Shipping.objects.all().order_by('price')
    currency = Currency.objects.get(used=True)
    country = Country.objects.all()
    try:
        cart = ShopCart.objects.filter(owner=request.user.email)
        profile = UserPreference.objects.get(owner=request.user)
        address = UserAddress.objects.filter(owner=request.user)
        context = {
            'categories': categories,
            'cart': cart,
            'profile': profile,
            'shippings': shipping,
            'addresses': address,
            'payments': payment,
            'currency': currency.symbol
        }
    except:
        user_id = request.COOKIES.get('user')
        cart = ShopCart.objects.filter(user_id=user_id)
        context = {
            'categories': categories,
            'cart': cart,
            'shippings': shipping,
            'payments': payment,
            'currency': currency.symbol,
            'countries': country
        }

    # check if all items in cart are still available
    err = 0
    for cart_item in cart:
        available_amount = cart_item.product_id.available_amount
        if available_amount < cart_item.amount:
            messages.error(request,
                           f'Sorry available amount of product {cart_item.product_id.product_name} '
                           f'is very low. You can order only {available_amount} now. Thank you.')
            err += 1
    if err != 0:
        return redirect('cart')
    cart_total = 0
    for item in cart:
        item.total_price = item.product_id.price * item.amount
        item.save()
        cart_total += item.total_price
    context.update({'total': cart_total})
    if request.method == 'GET':
        return render(request, 'shop/order.html', context)

    if request.method == 'POST':

        # user information
        email = request.POST['email']
        first_name = request.POST['first_name']
        last_name = request.POST['last_name']

        # get payment method and shipping
        payment = request.POST.getlist('payment')[0]
        shipping = request.POST.getlist('shipping')[0]

        payment_price = PaymentMethod.objects.get(name=payment).price
        shipping_price = Shipping.objects.get(name=shipping).price

        # add price of payment and shipping to cart_total
        total_price = cart_total + payment_price + shipping_price

        if not request.user.is_authenticated:
            country = Country.objects.get(code=request.POST['country'])
            city = request.POST['city']
            street = request.POST['street']
            house_no = request.POST['house_no']
            zipcode = request.POST['zipcode']

            order = Order.objects.create(email=email, first_name=first_name, last_name=last_name, country=country,
                                         city=city, street=street, house_no=house_no, zipcode=zipcode,
                                         timestamp=datetime.now().isoformat(), payment=payment, shipping=shipping,
                                         payment_price=payment_price, shipping_price=shipping_price,
                                         total_price=total_price, status=OrderStatus.objects.get(name='Draft'))
        else:
            address_id = request.POST['addressOptions']
            order_address = UserAddress.objects.get(address_id=address_id)

            order = Order.objects.create(email=email, first_name=first_name, last_name=last_name,
                                         country=order_address.country.code, city=order_address.city,
                                         street=order_address.street, house_no=order_address.house_no,
                                         zipcode=order_address.zipcode, timestamp=datetime.now().isoformat(),
                                         payment=payment, shipping=shipping, payment_price=payment_price,
                                         shipping_price=shipping_price, total_price=total_price,
                                         status=OrderStatus.objects.get(name='Draft'))

        # move items from cart to order items
        for i in cart:
            OrderItem.objects.create(order_id=order, product_name=i.product_id.product_name, price=i.product_id.price,
                                     amount=i.amount, currency=i.currency, total_price=i.amount * i.product_id.price)
            i.delete()
        return redirect('order_confirm', order.order_id)


def order_confirm(request, order_id):
    order = Order.objects.get(order_id=order_id)
    order_items = OrderItem.objects.filter(order_id=order)
    categories = ProductCategory.objects.all()
    currency = Currency.objects.get(used=True)
    country = Country.objects.get(code=order.country)
    products_price = order.total_price - order.payment_price - order.shipping_price
    context = {
        'categories': categories,
        'order': order,
        'order_items': order_items,
        'currency': currency,
        'products_price': products_price,
        'country': country
    }
    if request.user.is_authenticated:
        profile = UserPreference.objects.get(owner=request.user)
        context.update({'profile': profile})
    if request.method == 'GET':
        if order.status.name != 'Draft':
            messages.info(request, f'This order is {order.status.name}')
        return render(request, 'shop/order_confirm.html', context)
    if request.method == 'POST':
        order.status = OrderStatus.objects.get(name='Completed')
        order.save()
        for item in order_items:
            product = Product.objects.get(product_name=item.product_name)
            product.available_amount -= item.amount
            product.save()

        # send an email to user as a confirmation of order
        from_email = 'jakub.skapik@gmail.com'
        to_mail = order.email
        subject = f'Confirmation of order {order_id}'

        plaintext = get_template('emails/confirm_order_email.txt')
        htmly = get_template('emails/confirm_order_email.html')
        d = {
            'user': request.user,
            'order': order,
            'order_items': order_items,
            'products_price': products_price,
            'currency': currency
        }
        text_content = plaintext.render(d)
        html_content = htmly.render(d)
        msg = EmailMultiAlternatives(subject, text_content, from_email, [to_mail])
        msg.attach_alternative(html_content, 'text/html')
        msg.send()
        return redirect('order_success', order_id)


def order_success(request, order_id):
    categories = ProductCategory.objects.all()
    context = {
        'categories': categories
    }
    return render(request, 'shop/success_order.html', context)


def cancel_order(request, order_id):
    order = Order.objects.get(order_id=order_id)
    order_items = OrderItem.objects.filter(order_id=order.pk)
    order.status = OrderStatus.objects.get(name='Cancelled')
    order.save()

    # return back items to shop cart
    for item in order_items:
        email = request.user.email
        product_id = Product.objects.get(product_name=item.product_name)
        ShopCart.objects.create(owner=email, product_id=product_id, amount=item.amount, currency=item.currency,
                                total_price=item.total_price)

    messages.success(request, f'Order {order_id} was cancelled.')
    return redirect('cart')


def order_detail(request, order_id):
    categories = ProductCategory.objects.all()
    order = Order.objects.get(order_id=order_id)
    order_items = OrderItem.objects.filter(order_id=order.pk).order_by('product_name')
    currency = Currency.objects.get(used=True)
    country = Country.objects.get(code=order.country)
    products_price = order.total_price - order.payment_price - order.shipping_price
    context = {
        'categories': categories,
        'order': order,
        'order_items': order_items,
        'currency': currency,
        'products_price': products_price,
        'country': country
    }
    if order.status.name == 'Draft' and not request.user.is_staff:
        messages.info(request,
                      mark_safe(f'This order is not completed, if you want to complete the order click '
                                f'<a href=/order/{order_id}>here</a>'))
    return render(request, 'shop/order_detail.html', context)
