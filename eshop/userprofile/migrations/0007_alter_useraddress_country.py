# Generated by Django 4.0.5 on 2022-09-25 19:09

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('shop', '0018_country'),
        ('userprofile', '0006_useraddress_address_id'),
    ]

    operations = [
        migrations.AlterField(
            model_name='useraddress',
            name='country',
            field=models.ForeignKey(null=True, on_delete=django.db.models.deletion.SET_NULL, to='shop.country'),
        ),
    ]
