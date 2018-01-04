# Generated by Django 2.0 on 2018-01-03 12:22

from django.conf import settings
from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    initial = True

    dependencies = [
        ('contenttypes', '0002_remove_content_type_name'),
        migrations.swappable_dependency(settings.AUTH_USER_MODEL),
    ]

    operations = [
        migrations.CreateModel(
            name='Action',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('verb', models.CharField(max_length=255, verbose_name='动态描述')),
                ('created', models.DateTimeField(auto_now_add=True, db_index=True, verbose_name='创建时间')),
                ('target_id', models.PositiveIntegerField(blank=True, db_index=True, null=True)),
                ('target_ct', models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.CASCADE, related_name='target_obj', to='contenttypes.ContentType')),
                ('user', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, related_name='actions', to=settings.AUTH_USER_MODEL, verbose_name='用户')),
            ],
            options={
                'verbose_name_plural': '动态',
                'verbose_name': '动态',
                'ordering': ('-created',),
            },
        ),
    ]
