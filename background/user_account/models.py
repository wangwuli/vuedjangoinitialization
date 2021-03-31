#-*- coding: UTF-8 -*-
from __future__ import unicode_literals

from django.contrib.auth.base_user import AbstractBaseUser
from django.db import models

# Create your models here.
from user_account.views import CustomUserManager


class UserInfo(AbstractBaseUser):
    user_name = models.CharField(max_length=20, verbose_name='用户名', unique=True)
    gender = models.CharField(max_length=2,  verbose_name='性别')
    job_number = models.CharField(max_length=50,default=0,verbose_name='工号')
    mail = models.CharField(max_length=50,verbose_name='邮箱')
    user_post = models.CharField(max_length=50,verbose_name='岗位')
    user_department = models.CharField(max_length=50,verbose_name='部门')
    nick = models.CharField(max_length=50,verbose_name='姓名')
    status = models.CharField(max_length=50,verbose_name='状态')

    USERNAME_FIELD = 'user_name'

    objects = CustomUserManager()