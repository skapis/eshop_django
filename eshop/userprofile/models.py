import uuid
from django.db import models
from django.contrib.auth.models import User
from shop.models import Country


class Gender(models.Model):
    name = models.CharField(max_length=255, null=True)

    def __str__(self):
        return self.name

    class Meta:
        verbose_name_plural = 'Gender'


class UserAddress(models.Model):
    owner = models.ForeignKey(to=User, on_delete=models.CASCADE)
    country = models.ForeignKey(to=Country, on_delete=models.SET_NULL, null=True)
    city = models.CharField(max_length=255)
    street = models.CharField(max_length=255, null=True)
    house_no = models.CharField(max_length=255)
    zipcode = models.CharField(max_length=255)
    is_primary = models.BooleanField(default=True)
    address_id = models.UUIDField(default=uuid.uuid4)

    def __str__(self):
        return f"{self.owner} address"

    class Meta:
        verbose_name_plural = 'User Addresses'


class UserPreference(models.Model):
    owner = models.ForeignKey(to=User, on_delete=models.CASCADE)
    first_login = models.BooleanField(default=False)
    first_name = models.CharField(max_length=255)
    last_name = models.CharField(max_length=255)
    gender = models.ForeignKey(to=Gender, on_delete=models.SET_NULL, null=True)
    date_of_birth = models.DateField(null=True)

    def __str__(self):
        return self.owner.username


class Consent(models.Model):
    name = models.CharField(max_length=255)
    email = models.EmailField(max_length=255)
    consent_date = models.CharField(max_length=255, editable=False)

    def __str__(self):
        return self.name
