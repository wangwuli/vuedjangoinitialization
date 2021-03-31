# models.py

from django.db import models
from django.contrib.auth.models import (
    BaseUserManager, AbstractBaseUser
)


class CustomUserManager(BaseUserManager):
    def create_user(self,  data):
        """
        Creates and saves a User with the given email, date of
        birth and password.
        """

        user = self.model(
            user_name=data['username'],
        )

        user.set_password(data['password'])
        user.save(using=self._db)
        return user

    # def create_superuser(self, email, date_of_birth, password):
    #     """
    #     Creates and saves a superuser with the given email, date of
    #     birth and password.
    #     """
    #     user = self.create_user(email,
    #         password=password,
    #         date_of_birth=date_of_birth
    #     )
    #     user.is_admin = True
    #     user.save(using=self._db)
    #     return user