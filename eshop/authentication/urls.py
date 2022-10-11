from django.urls import path
from .views import *
from django.views.decorators.csrf import csrf_exempt

urlpatterns = [
    path('email-validation', csrf_exempt(EmailValidation.as_view()), name='email_validation'),
    path('user-validation', csrf_exempt(UsernameValidation.as_view()), name='username-validation'),
    path('register', csrf_exempt(Registration.as_view()), name='register'),
    path('activate/<uidb64>/<token>', VerificationAccount.as_view(), name='activate'),
    path('login', Login.as_view(), name='login'),
    path('logout', csrf_exempt(LogoutView.as_view()), name='logout'),
    path('set-new-password/<uidb64>/<token>', CompletePasswordReset.as_view(), name='reset-user-password'),
    path('request-reset-link', RequestPasswordResetEmail.as_view(), name='request-password')
]