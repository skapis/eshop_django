# Generated by Django 4.0.5 on 2022-09-17 10:16

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('shop', '0007_remove_shopcart_id_shopcart_cart_id_and_more'),
    ]

    operations = [
        migrations.AddField(
            model_name='shopcart',
            name='total_price',
            field=models.DecimalField(decimal_places=2, max_digits=9, null=True),
        ),
    ]
