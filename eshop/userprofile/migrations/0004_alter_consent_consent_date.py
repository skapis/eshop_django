# Generated by Django 4.0.5 on 2022-09-13 17:17

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('userprofile', '0003_consent_useraddress_is_primary'),
    ]

    operations = [
        migrations.AlterField(
            model_name='consent',
            name='consent_date',
            field=models.CharField(editable=False, max_length=255),
        ),
    ]
