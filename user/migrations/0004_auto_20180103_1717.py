# Generated by Django 2.0 on 2018-01-03 17:17

import datetime
from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('user', '0003_auto_20180103_1222'),
    ]

    operations = [
        migrations.AlterField(
            model_name='usercomment',
            name='UBcomment_date',
            field=models.DateTimeField(default=datetime.datetime(2018, 1, 3, 17, 17, 25, 743121)),
        ),
    ]