from django.contrib import admin
from .models import UserPreference, Gender, UserAddress, Consent

admin.site.register(UserPreference)
admin.site.register(Gender)
admin.site.register(UserAddress)
admin.site.register(Consent)
