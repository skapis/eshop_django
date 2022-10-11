from datetime import datetime as d
from django.shortcuts import render, redirect
from django.contrib.admin.views.decorators import staff_member_required
from django.contrib import messages
from django.core.files.storage import FileSystemStorage
from django.contrib.auth.models import User
from django.db.models import Sum, Count
from django.http import JsonResponse
import os
import json
import pandas as pd
from django.conf import settings
from shop.models import Product, ProductCategory, Currency, OrderStatus, ShopCart, Shipping, PaymentMethod, Order, Country, OrderItem
from userprofile.models import UserPreference, UserAddress, Consent


# view for user, who is not staff try to access staff page
def access_denied(request):
    return render(request, 'staffsite/not_staff.html')


@staff_member_required(login_url='/staff/access-denied')
def index(request):
    categories = ProductCategory.objects.all()
    used_currency = Currency.objects.get(used=True)
    context = {
        'categories': categories,
        'currency': used_currency,
    }
    return render(request, 'staffsite/index.html', context)


@staff_member_required(login_url='/staff/access-denied')
def product_dashboard(request):
    products = Product.objects.all()
    categories = ProductCategory.objects.all().order_by('pk')
    context = {
        'products': products,
        'categories': categories
    }
    return render(request, 'staffsite/product_dashboard.html', context)


@staff_member_required(login_url='/staff/access-denied')
def user_dashboard(request):
    categories = ProductCategory.objects.all()
    users = User.objects.all()
    total_users = Order.objects.values_list('email', flat=True).distinct().count()
    context = {
        'categories': categories,
        'users': users,
        'user_count': users.count(),
        'userWithOrder': total_users,
        'userWithoutOrder': users.count() - total_users
    }
    return render(request, 'staffsite/user_dashboard.html', context)


@staff_member_required(login_url='/staff/access-denied')
def user_detail(request, user_id):
    categories = ProductCategory.objects.all()
    user = User.objects.get(pk=user_id)
    user_profile = UserPreference.objects.get(owner=user_id)
    user_address = UserAddress.objects.filter(owner=user).order_by('-is_primary')
    user_cart = ShopCart.objects.filter(owner=user.email)
    orders = Order.objects.filter(email=user.email)
    consents = Consent.objects.filter(email=user.email)
    currency = Currency.objects.get(used=True)
    context = {
        'categories': categories,
        'user': user,
        'profile': user_profile,
        'addresses': user_address,
        'cart': user_cart,
        'orders': orders,
        'currency': currency,
        'consents': consents
    }
    return render(request, 'staffsite/user_detail.html', context)


@staff_member_required(login_url='/staff/access-denied')
def settings_view(request):
    categories = ProductCategory.objects.all()
    currencies = Currency.objects.all()
    countries = Country.objects.all()
    payments = PaymentMethod.objects.all()
    shippings = Shipping.objects.all()
    used_currency = Currency.objects.get(used=True)

    file_path = os.path.join(settings.BASE_DIR, 'countries.json')
    country_list = []
    with open(file_path, 'r') as json_file:
        data = json.load(json_file)
        for k, v in data.items():
            country_list.append({'code': k, 'name': v})

    context = {
        'categories': categories,
        'currencies': currencies,
        'countries': countries,
        'payments': payments,
        'shippings': shippings,
        'currency': used_currency,
        'country_list': country_list

    }
    messages.warning(request,
                     'Be careful, changes could have negative impact on orders and items in cart')
    return render(request, 'staffsite/settings.html', context)


@staff_member_required(login_url='/staff/access-denied')
def add_category(request):
    if request.method == 'POST':
        new_category = request.POST['category']
        # duplicity check
        if ProductCategory.objects.filter(name=new_category).exists():
            messages.error(request, 'This category already exists')
            return redirect('product_dashboard')

        ProductCategory.objects.create(name=new_category)
        messages.success(request, f'Category {new_category} was added')
        return redirect('product_dashboard')


@staff_member_required(login_url='/staff/access-denied')
def delete_category(request, category_name):
    category = ProductCategory.objects.get(name=category_name)
    category.delete()
    messages.success(request, f'Category {category_name} was removed')
    return redirect('product_dashboard')


@staff_member_required(login_url='/staff/access-denied')
def edit_category(request, category_name):
    if request.method == 'POST':
        new_name = request.POST['newName']
        category = ProductCategory.objects.get(name=category_name)
        category.name = new_name
        category.save()
        messages.success(request, f'Category {category_name} was renamed to {new_name}')
        return redirect('product_dashboard')


@staff_member_required(login_url='/staff/access-denied')
def add_product(request):
    categories = ProductCategory.objects.all()
    currency = Currency.objects.get(used=True)
    context = {
        'categories': categories,
        'currency': currency,
        'values': request.POST
    }
    if request.method == 'GET':

        return render(request, 'staffsite/add_product.html', context)

    if request.method == 'POST':
        product_name = request.POST['productName']
        product_info = request.POST['productInfo']
        available_amount = request.POST['availableAmount']
        price = request.POST['price']
        category = ProductCategory.objects.get(pk=request.POST['category'])

        # form values check
        if not product_name or not product_info or not available_amount or not price:
            messages.error(request, 'You must fill all fields')
            return render(request, 'staffsite/add_product.html', context)

        if len(request.FILES) == 0:
            messages.error(request, 'Image is required')
            return render(request, 'staffsite/add_product.html', context)

        # duplicity check
        products = Product.objects.filter(product_name=product_name)
        if products.exists():
            messages.error(request, 'This product is already in eshop')
            return render(request, 'staffsite/add_product.html', context)

        product_image = request.FILES['productImage']
        fss = FileSystemStorage(base_url='product_images', location='media/product_images')
        file_name = f"{product_name.replace(' ','_')}_{d.now().timestamp()}.{product_image.content_type.split('/')[1]}"
        file = fss.save(file_name, product_image)
        file_url = fss.url(file)

        Product.objects.create(product_name=product_name, product_info=product_info, available_amount=available_amount,
                               currency=currency, price=price, product_category=category, product_image=file_url)

        messages.success(request, f'Product {product_name} was added')
        return redirect('product_dashboard')


@staff_member_required(login_url='/staff/access-denied')
def delete_product(request, product_id):
    product = Product.objects.get(pk=id)
    product.delete()
    messages.success(request, f'Product {product.product_name} was removed')
    return redirect('product_dashboard')


@staff_member_required(login_url='/staff/access-denied')
def edit_product(request, product_id):
    product = Product.objects.get(pk=product_id)
    categories = ProductCategory.objects.all()
    context = {
        'product': product,
        'categories': categories
    }
    if request.method == 'GET':
        return render(request, 'staffsite/edit_product.html', context)

    if request.method == 'POST':
        product_name = request.POST['productName']
        product_info = request.POST['productInfo']
        available_amount = request.POST['availableAmount']
        price = request.POST['price']
        category = ProductCategory.objects.get(pk=request.POST['category'])

        product.product_name = product_name
        product.product_info = product_info
        product.available_amount = available_amount
        product.price = price
        product.product_category = category
        product.save()

        if not len(request.FILES) == 0:
            product_image = request.FILES['productImage']
            fss = FileSystemStorage(base_url='product_images', location='media/product_images')
            file_name = f"{product_name.replace(' ','_')}_{d.now().timestamp()}.{product_image.content_type.split('/')[1]}"
            file = fss.save(file_name, product_image)
            file_url = fss.url(file)
            product.product_image = file_url
            product.save()

        messages.success(request, f'Product {product.product_name} was edited')
        return redirect('product_dashboard')


# if product is hidden, then user cannot see in the category view and eshop view
@staff_member_required(login_url='/staff/access-denied')
def hide_product(request, product_id):
    if request.method == 'POST':
        product = Product.objects.get(pk=product_id)
        if product.is_visible:
            product.is_visible = False
            product.save()
            messages.success(request, f'Product {product.product_name} is now hidden')
        else:
            product.is_visible = True
            product.save()
            messages.success(request, f'Product {product.product_name} is now visible')

        return redirect('product_dashboard')


@staff_member_required(login_url='/staff/access-denied')
def add_payment_method(request):
    if request.method == 'POST':
        new_payment = request.POST['payment']
        price = request.POST['paymentPrice']
        # duplicity check
        if PaymentMethod.objects.filter(name=new_payment).exists():
            messages.error(request, 'This payment method already exists')
            return redirect('settings')

        PaymentMethod.objects.create(name=new_payment, price=price)
        messages.success(request, f'Payment Method {new_payment} was added')
        return redirect('settings')


@staff_member_required(login_url='/staff/access-denied')
def edit_payment(request, payment_id):
    payment = PaymentMethod.objects.get(pk=payment_id)
    if request.method == 'POST':
        name = request.POST['payment']
        price = request.POST['paymentPrice']

        payment.name = name
        payment.price = price
        payment.save()

        messages.success(request, f'Payment method {name} was edited')
        return redirect('settings')


@staff_member_required(login_url='/staff/access-denied')
def delete_payment(request, payment_id):
    payment = PaymentMethod.objects.get(pk=payment_id)
    payment.delete()

    messages.success(request, f'Payment method {payment.name} was removed')
    return redirect('settings')


@staff_member_required(login_url='/staff/access-denied')
def add_shipping(request):
    if request.method == 'POST':
        new_shipping = request.POST['shipping']
        price = request.POST['shipPrice']
        duration = request.POST['duration']
        company = request.POST['company']
        # duplicity check
        if Shipping.objects.filter(name=new_shipping).exists():
            messages.error(request, 'This shipping method already exists')
            return redirect('settings')

        Shipping.objects.create(name=new_shipping, price=price, duration=duration, company=company)
        messages.success(request, f'Shipping Method {new_shipping} was added')
        return redirect('settings')


@staff_member_required(login_url='/staff/access-denied')
def edit_shipping(request, shipping_id):
    shipping = Shipping.objects.get(pk=shipping_id)
    if request.method == 'POST':
        name = request.POST['shippingName']
        price = request.POST['shippingPrice']
        duration = request.POST['duration']
        company = request.POST['company']

        shipping.name = name
        shipping.price = price
        shipping.duration = duration
        shipping.company = company
        shipping.save()

        messages.success(request, f'Shipping {name} was edited')
        return redirect('settings')


@staff_member_required(login_url='/staff/access-denied')
def delete_shipping(request, shipping_id):
    shipping = Shipping.objects.get(pk=shipping_id)
    shipping.delete()

    messages.success(request, f'Shipping {shipping.name} was removed')
    return redirect('settings')


@staff_member_required(login_url='/staff/access-denied')
def add_country(request):
    if request.method == 'POST':
        new_country = request.POST['newCountry']
        file_path = os.path.join(settings.BASE_DIR, 'countries.json')
        with open(file_path, 'r') as json_file:
            data = json.load(json_file)

        # duplicity check
        if Country.objects.filter(code=new_country).exists():
            messages.error(request, 'This country is already added')
            redirect('settings')

        Country.objects.create(code=new_country, name=data[new_country])
        messages.success(request, f'Country {data[new_country]} was added')
        return redirect('settings')


@staff_member_required(login_url='/staff/access-denied')
def delete_country(request, code):
    country = Country.objects.get(code=code)
    country.delete()

    messages.success(request, f'Country {country.name} was removed')
    return redirect('settings')


@staff_member_required(login_url='/staff/access-denied')
def change_currency(request, code):
    currency = Currency.objects.get(code=code)
    used_currency = Currency.objects.get(used=True)

    # set current used currency in eshop to non-used
    used_currency.used = False
    used_currency.save()
    # set new used currency
    currency.used = True
    currency.save()

    messages.success(request, f'{currency.name} was is now primary in eshop')
    return redirect('settings')


@staff_member_required(login_url='/staff/access-denied')
def order_dashboard(request):
    orders = Order.objects.all()
    completed = Order.objects.filter(status=OrderStatus.objects.get(name='Completed'))
    cancelled = Order.objects.filter(status=OrderStatus.objects.get(name='Cancelled'))
    categories = ProductCategory.objects.all()

    context = {
        'orders': orders,
        'categories': categories,
        'total_orders': orders.count(),
        'completed': completed.count(),
        'cancelled': cancelled.count(),
        'not_complete': orders.count() - completed.count() - cancelled.count()
    }

    return render(request, 'staffsite/order_dashboard.html', context)


def sales(request):
    orders = Order.objects.filter(status=OrderStatus.objects.get(name='Completed'))
    order_list = orders.values_list('timestamp', 'total_price')
    total_sales = 0
    date = []
    total_price = []
    for order in orders:
        total_sales += order.total_price

    for item in order_list:
        order_date = d.date(item[0])
        date.append(f'{order_date.year}-{order_date.month}')
        total_price.append(item[1])

    data = {'date': date, 'total': total_price}
    df = pd.DataFrame(data=data)
    by_date = df.groupby('date')['total'].sum().sort_values(ascending=False).to_dict()

    context = {
        'total': total_sales,
        'by_date': by_date
    }

    categories = ProductCategory.objects.all()
    cat, prod, item = [], [], []
    for category in categories:
        products = Product.objects.filter(product_category=category)
        for product in products:
            order_items = OrderItem.objects.filter(product_name=product.product_name)
            cat.append(category.name)
            prod.append(product.product_name)
            order_total = order_items.aggregate(total=Sum('total_price'))
            item.append(order_total['total'])

    data = {'category': cat, 'product': prod, 'total': item}
    df = pd.DataFrame(data=data)
    if request.GET.get('by') == 'product':
        by_product = df.groupby('product')['total'].sum().to_dict()
        return JsonResponse({'data': by_product})
    if request.GET.get('by') == 'category':
        by_category = df.groupby('category')['total'].sum().to_dict()
        return JsonResponse({'data': by_category})

    return JsonResponse(context)






