import datetime
from django.shortcuts import render, redirect
from django.contrib.auth.models import User
from django.views import View
import json
from validate_email import validate_email
from django.http import JsonResponse, HttpResponse
from django.contrib import messages
from django.urls import reverse
from django.utils.encoding import force_bytes, force_str, DjangoUnicodeDecodeError
from django.utils.http import urlsafe_base64_encode, urlsafe_base64_decode
from django.contrib.sites.shortcuts import get_current_site
from .utils import token_generator
from django.core.mail import EmailMessage
from django.contrib import auth
import threading
from django.contrib.auth.tokens import PasswordResetTokenGenerator
from userprofile.models import Gender, UserAddress, UserPreference, Consent
from shop.models import ProductCategory, Country


class EmailThread(threading.Thread):
    def __init__(self, email):
        self.email = email
        threading.Thread.__init__(self)

    def run(self):
        self.email.send(fail_silently=False)


# check if username of new user does not exist already
class UsernameValidation(View):
    def post(self, request):
        data = json.loads(request.body)
        username = data['username']
        if not str(username).isalnum():  # check if username contains only alphanumeric characters
            return JsonResponse({'username_error': 'username should contain only alphanumeric characters'}, status=400)
        if User.objects.filter(username=username).exists():
            return JsonResponse({'username_error': 'Username is already taken'}, status=409)
        return JsonResponse({'username_valid': True})


class EmailValidation(View):
    def post(self, request):
        data = json.loads(request.body)
        email = data['email']
        if not validate_email(email):
            return JsonResponse({'email_error': 'Email is invalid'}, status=400)
        if User.objects.filter(email=email).exists():
            return JsonResponse({'email_error': 'Email is already taken'}, status=409)
        return JsonResponse({'email_valid': True})


class Registration(View):
    def get(self, request):
        categories = ProductCategory.objects.all()
        context = {
            'categories': categories
        }
        return render(request, 'authentication/register.html', context)

    def post(self, request):
        username = request.POST['username']
        email = request.POST['email']
        password = request.POST['psw']
        password_confirm = request.POST['psw_c']

        context = {
            'values': request.POST,
        }

        # check if the password has at least 8 characters
        if len(password) < 8:
            messages.error(request, 'Password is too short. Password must have at least 8 characters')
            return render(request, 'authentication/register.html', context)

        # check if password and confirm password fields contain same value
        if password != password_confirm:
            messages.error(request, 'Passwords are not same')
            return render(request, 'authentication/register.html', context)

        # check if consent is approved
        try:
            gtc = request.POST['gtc']
        except:
            messages.error(request, "You must accept Terms of Use")
            return render(request, 'authentication/register.html', context)

        # create user from form
        user = User.objects.create_user(username, email=email)
        user.set_password(password)
        user.is_staff = False  # set if user will be staff of eshop
        user.is_active = False  # set if user has an active account
        user.save()

        # create record to consent table
        Consent.objects.create(name="General Terms and Conditions", email=email,
                               consent_date=str(datetime.datetime.now().timestamp()))

        # send an activation email to user to activate account
        uidb64 = urlsafe_base64_encode(force_bytes(user.pk))
        domain = get_current_site(request).domain
        link = reverse('activate', kwargs={'uidb64': uidb64, 'token': token_generator.make_token(user)})

        activate_url = f"http://{domain}{link}"
        email_subject = 'Activate your account'
        email_body = f"Hello {user.username},\nPlease use this link to activate your account\n{activate_url}"
        email = EmailMessage(
            email_subject,
            email_body,
            'noreply@expenses.com',
            [email]
        )
        EmailThread(email).start()

        messages.success(request, "Account was created, please check your email to activate your account")
        return redirect('login')


class VerificationAccount(View):
    def get(self, request, uidb64, token):
        id = force_str(urlsafe_base64_decode(uidb64))
        user = User.objects.get(pk=id)
        gender = Gender.objects.all()
        categories = ProductCategory.objects.all()
        countries = Country.objects.all()
        if not token_generator.check_token(user, token):
            messages.info(request, 'Account is already activated, please login')
            return redirect('login')

        if user.is_active:
            messages.info(request, 'Account is already activated, please login')
            return redirect('login')

        context = {
            'gender': gender,
            'token': token,
            'uidb64': uidb64,
            'categories': categories,
            'countries': countries
        }
        messages.success(request, 'To activate your account please fill the form')
        return render(request, 'authentication/complete_activation.html', context)

    def post(self, request, uidb64, token):
        id = force_str(urlsafe_base64_decode(uidb64))
        user = User.objects.get(pk=id)
        categories = ProductCategory.objects.all()
        context = {
            'categories': categories,
            'values': request.POST,
            'uidb64': uidb64,
            'token': token
        }
        first_name = request.POST['first_name']
        last_name = request.POST['last_name']
        gender = request.POST['gender']
        date_of_birth = request.POST['dob']

        # read address
        country = request.POST['country']
        city = request.POST['city']
        street = request.POST['street']
        if not street:
            street = city
        house_no = request.POST['house_no']
        zipcode = request.POST['zipcode']

        if not first_name or not last_name or not date_of_birth or not country or not city or not house_no or \
                not zipcode:
            messages.error(request, 'Please fill the required fields')
            return render(request, 'authentication/complete_activation.html', context)

        user.is_active = True
        user.save()

        # create user profile
        UserPreference.objects.create(owner=user, first_name=first_name, last_name=last_name,
                                      gender=Gender.objects.get(name=gender), date_of_birth=date_of_birth)

        # create user address
        UserAddress.objects.create(owner=user, country=Country.objects.get(code=country), city=city, street=street,
                                   house_no=house_no, zipcode=zipcode)
        messages.success(request, 'Your registration is complete, please login to your account')
        return redirect('login')


class Login(View):
    def get(self, request):
        categories = ProductCategory.objects.all()
        context = {
            'categories': categories
        }
        return render(request, 'authentication/login.html', context)

    def post(self, request):
        username = request.POST['username']
        password = request.POST['psw']

        if username and password:
            user = auth.authenticate(username=username, password=password)

            if user:
                if user.is_staff:
                    auth.login(request, user)
                    return redirect('staff')
                if user.is_active:
                    auth.login(request, user)
                    profile = UserPreference.objects.get(owner=user)
                    # check if the user has been already logged in
                    if not profile.first_login:
                        profile.first_login = True
                        profile.save()
                    messages.success(request, f"Welcome {user.username} you are now logged in")
                    return redirect('home')

                messages.error(request, 'Account is not active, please check your email')
                return render(request, 'authentication/login.html')

            messages.error(request, 'Username or password is wrong, please check your credentials')
            return render(request, 'authentication/login.html')

        messages.error(request, 'Please fill username and password')
        return render(request, 'authentication/login.html')


class LogoutView(View):
    def post(self, request):
        auth.logout(request)
        messages.success(request, 'You have been sucessfully logout')
        return redirect('login')


class RequestPasswordResetEmail(View):
    def get(self, request):
        return render(request, 'authentication/psw_reset.html')

    def post(self, request):
        email = request.POST['email']
        context = {
            'values': request.POST
        }
        if not validate_email(email):
            messages.error(request, 'Please enter a valid email')
            return render(request, 'authentication/psw_reset.html', context)

        current_site = get_current_site(request)
        user = User.objects.filter(email=email)

        if user.exists():
            email_contents = {
                'user': user[0],
                'domain': current_site.domain,
                'uid': urlsafe_base64_encode(force_bytes(user[0].pk)),
                'token': PasswordResetTokenGenerator().make_token(user[0])
            }
            link = reverse('reset-user-password', kwargs={
                'uidb64': email_contents['uid'], 'token': email_contents['token']})

            email_subject = 'Password reset Instructions'
            reset_url = f"http://{current_site.domain}{link}"

            email = EmailMessage(
                email_subject,
                f'Hi there, Please click the link below to reset your password {reset_url}',
                'noreply@expenses.com',
                [email]
            )
            EmailThread(email).start()
            messages.success(request, 'We have sent you an email to reset your password')

        return render(request, 'authentication/psw_reset.html')


class CompletePasswordReset(View):
    def get(self, request, uidb64, token):

        context = {
            'uidb64': uidb64,
            'token': token
        }

        return render(request, 'authentication/set-new-password.html', context)

    def post(self, request, uidb64, token):

        context = {
            'uidb64': uidb64,
            'token': token
        }
        password = request.POST['password']
        password2 = request.POST['password2']

        if password != password2:
            messages.error(request, 'Passwords do not match')
            return render(request, 'authentication/set-new-password.html', context)

        if len(password) < 6:
            messages.error(request, 'Password is too short')
            return render(request, 'authentication/set-new-password.html', context)

        try:
            user_id = force_str(urlsafe_base64_decode(uidb64))
            user = User.objects.get(pk=user_id)
            if not PasswordResetTokenGenerator().check_token(user, token):
                messages.info(request, "Password link is invalid, please request a new one")
                return render(request, 'authentication/set-new-password.html', context)

            user.set_password(password)
            user.save()
            messages.success(request, 'Password reset succesfully')

            return redirect('login')

        except Exception as identifier:
            messages.info(request, 'Something went wrong')
            return render(request, 'authentication/set-new-password.html', context)
