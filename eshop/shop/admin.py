from django.contrib import admin
from .models import *

admin.site.register(ProductCategory)
admin.site.register(Currency)
admin.site.register(Product)
admin.site.register(OrderStatus)
admin.site.register(Order)
admin.site.register(OrderItem)
admin.site.register(ShopCart)
admin.site.register(Shipping)
admin.site.register(PaymentMethod)
admin.site.register(Country)
