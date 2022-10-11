from django.shortcuts import render, redirect
from django.contrib.auth.decorators import login_required
from .models import *
from django.contrib.auth.models import User
from shop.models import Product, ProductCategory, Currency, OrderStatus, ShopCart, Shipping, PaymentMethod, Order, \
    Country
from django.contrib import messages


@login_required(login_url='/authentication/login')
def account(request):
    user = User.objects.get(username=request.user)
    profile = UserPreference.objects.get(owner=user)
    addresses = UserAddress.objects.filter(owner=user).order_by('-is_primary')
    categories = ProductCategory.objects.all()
    order = Order.objects.filter(email=request.user.email).order_by('-timestamp')
    currency = Currency.objects.get(used=True)
    countries = Country.objects.all()
    context = {
        'profile': profile,
        'addresses': addresses,
        'categories': categories,
        'orders': order,
        'currency': currency,
        'countries': countries
    }
    return render(request, 'profile/account.html', context)


@login_required(login_url='/authentication/login')
def edit_account(request):
    user = User.objects.get(username=request.user.username)
    profile = UserPreference.objects.get(owner=request.user)
    if request.method == 'POST':
        username = request.POST['username']
        first_name = request.POST['first_name']
        last_name = request.POST['last_name']
        dob = request.POST['dob']

        if not username or not first_name or not last_name or not dob:
            messages.error(request, 'Please fill all required fields')
            return redirect('account')

        # change information in profile or in user model
        user.username = username
        user.save()

        profile.first_name = first_name
        profile.last_name = last_name
        profile.date_of_birth = dob
        profile.save()

        messages.success(request, 'Your information was changed')
        return redirect('account')


@login_required(login_url='/authentication/login')
def edit_address(request, address_id):
    address = UserAddress.objects.get(address_id=address_id)
    if request.method == 'POST':
        country = request.POST['country']
        city = request.POST['city']
        street = request.POST['street']
        if not street:
            street = city
        house_no = request.POST['house_no']
        zipcode = request.POST['zipcode']

        if not country or not city or not house_no or not zipcode:
            messages.error(request, 'Please fill all required fields')
            return redirect('account')

        address.country = Country.objects.get(code=country)
        address.city = city
        address.street = street
        address.house_no = house_no
        address.zipcode = zipcode
        address.save()

        full_address = f"{address.street} {address.house_no}, {address.zipcode} {address.city}, {address.country.name}"
        messages.success(request, f'Address {full_address} was edited')
        return redirect('account')


@login_required(login_url='/authentication/login')
def add_address(request):
    if request.method == 'GET':
        categories = ProductCategory.objects.all()
        countries = Country.objects.all()
        context = {
            'categories': categories,
            'countries': countries
        }
        return render(request, 'profile/add_address.html', context)

    if request.method == 'POST':
        owner = request.user
        country = request.POST['country']
        city = request.POST['city']
        street = request.POST['street']
        if not street:
            street = city
        house_no = request.POST['house_no']
        zipcode = request.POST['zipcode']

        UserAddress.objects.create(owner=owner, country=Country.objects.get(code=country), city=city, street=street,
                                   house_no=house_no, zipcode=zipcode, is_primary=False)
        full_address = f"{street} {house_no}, {zipcode} {city}, {Country.objects.get(code=country).name}"
        messages.success(request, f'New address {full_address} was added')
        return redirect('account')


def change_to_primary(request, address_id):
    if request.method == 'POST':
        # find current primary address and set it as secondary address
        primary_address = UserAddress.objects.get(owner=request.user, is_primary=True)
        primary_address.is_primary = False
        primary_address.save()

        # set requested address as primary
        address = UserAddress.objects.get(address_id=address_id)
        address.is_primary = True
        address.save()

        full_address = f"{address.street} {address.house_no}, {address.zipcode} {address.city}, {address.country.name}"

        messages.success(request, f'Address {full_address} was set as primary')
        return redirect('account')


def delete_address(request, address_id):
    address = UserAddress.objects.get(address_id=address_id)
    if request.method == 'POST':
        address.delete()
        full_address = f"{address.street} {address.house_no}, {address.zipcode} {address.city}, {address.country.name}"
        messages.success(request, f"Address {full_address} was removed")
        return redirect('account')
