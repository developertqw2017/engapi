# Generated by Django 2.0 on 2018-01-03 11:05

import datetime
from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('user', '0001_initial'),
    ]

    operations = [
        migrations.AlterField(
            model_name='usercomment',
            name='UBcomment_date',
            field=models.DateTimeField(default=datetime.datetime(2018, 1, 3, 11, 5, 3, 838292)),
        ),
    ]