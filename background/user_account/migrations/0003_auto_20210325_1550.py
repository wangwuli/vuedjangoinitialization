# -*- coding: utf-8 -*-
# Generated by Django 1.10.6 on 2021-03-25 07:50
from __future__ import unicode_literals

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('user_account', '0002_auto_20210325_1538'),
    ]

    operations = [
        migrations.AlterModelOptions(
            name='userinfo',
            options={},
        ),
        migrations.RemoveField(
            model_name='userinfo',
            name='date_joined',
        ),
        migrations.RemoveField(
            model_name='userinfo',
            name='email',
        ),
        migrations.RemoveField(
            model_name='userinfo',
            name='first_name',
        ),
        migrations.RemoveField(
            model_name='userinfo',
            name='groups',
        ),
        migrations.RemoveField(
            model_name='userinfo',
            name='is_active',
        ),
        migrations.RemoveField(
            model_name='userinfo',
            name='is_staff',
        ),
        migrations.RemoveField(
            model_name='userinfo',
            name='is_superuser',
        ),
        migrations.RemoveField(
            model_name='userinfo',
            name='last_name',
        ),
        migrations.RemoveField(
            model_name='userinfo',
            name='user_permissions',
        ),
        migrations.RemoveField(
            model_name='userinfo',
            name='username',
        ),
    ]