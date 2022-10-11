import uuid
from django.db import models


class ProductCategory(models.Model):
    name = models.CharField(max_length=255)

    def __str__(self):
        return self.name

    class Meta:
        verbose_name_plural = 'Product Categories'
        ordering = ['name']


class Currency(models.Model):
    code = models.CharField(max_length=255)
    name = models.CharField(max_length=255)
    symbol = models.CharField(max_length=255, null=True)
    used = models.BooleanField(default=False, editable=False)

    def __str__(self):
        return self.name

    class Meta:
        verbose_name_plural = 'Currencies'
        ordering = ['name']


class Country(models.Model):
    name = models.CharField(max_length=255)
    code = models.CharField(max_length=255)

    def __str__(self):
        return self.code

    class Meta:
        verbose_name_plural = 'Countries'


class Product(models.Model):
    product_name = models.CharField(max_length=255)
    product_info = models.TextField()
    available_amount = models.IntegerField()
    currency = models.ForeignKey(to=Currency, on_delete=models.SET_NULL, null=True)
    price = models.DecimalField(max_digits=9, decimal_places=2, null=True)
    product_category = models.ForeignKey(to=ProductCategory, on_delete=models.SET_DEFAULT, default=1)
    product_image = models.ImageField(default='default.jpg', upload_to='product_images')
    is_visible = models.BooleanField(default=True)

    def __str__(self):
        return self.product_name

    class Meta:
        ordering = ['product_name']


class OrderStatus(models.Model):
    name = models.CharField(max_length=255)

    def __str__(self):
        return self.name

    class Meta:
        verbose_name_plural = 'Order Status'


class PaymentMethod(models.Model):
    name = models.CharField(max_length=255)
    price = models.IntegerField()

    def __str__(self):
        return self.name

    class Meta:
        ordering = ['name']


class Shipping(models.Model):
    name = models.CharField(max_length=255)
    price = models.IntegerField()
    duration = models.IntegerField()
    company = models.CharField(max_length=255, null=True)

    def __str__(self):
        return self.name

    class Meta:
        verbose_name_plural = 'Shipping'
        ordering = ['name']


class ShopCart(models.Model):
    owner = models.EmailField(null=True, blank=True)
    cart_id = models.UUIDField(default=uuid.uuid4, primary_key=True)
    product_id = models.ForeignKey(to=Product, on_delete=models.CASCADE)
    amount = models.IntegerField()
    currency = models.CharField(max_length=255)
    total_price = models.DecimalField(max_digits=9, decimal_places=2, null=True)
    user_id = models.UUIDField(max_length=255, null=True)

    def __str__(self):
        return self.owner


class Order(models.Model):
    order_id = models.UUIDField(default=uuid.uuid4)
    email = models.EmailField()
    first_name = models.CharField(max_length=255, null=True)
    last_name = models.CharField(max_length=255, null=True)
    country = models.CharField(max_length=255, null=True)
    city = models.CharField(max_length=255, null=True)
    street = models.CharField(max_length=255, null=True)
    house_no = models.CharField(max_length=255, null=True)
    zipcode = models.CharField(max_length=255, null=True)
    status = models.ForeignKey(to=OrderStatus, on_delete=models.SET_NULL, null=True)
    timestamp = models.DateTimeField()
    payment = models.CharField(max_length=255, null=True, blank=True)
    shipping = models.CharField(max_length=255, null=True, blank=True)
    payment_price = models.IntegerField(null=True, blank=True)
    shipping_price = models.IntegerField(null=True, blank=True)
    total_price = models.DecimalField(max_digits=9, decimal_places=2, null=True, blank=True)

    def __str__(self):
        return str(self.order_id)


class OrderItem(models.Model):
    order_id = models.ForeignKey(to=Order, on_delete=models.CASCADE)
    product_name = models.CharField(max_length=255, editable=False)
    price = models.DecimalField(max_digits=9, decimal_places=2, editable=False)
    amount = models.IntegerField(editable=False)
    currency = models.CharField(max_length=255, editable=False)
    total_price = models.DecimalField(max_digits=9, decimal_places=2, editable=False, null=True)

    def __str__(self):
        return self.product_name

