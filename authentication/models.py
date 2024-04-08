import os
from django.db import models
from django.contrib.auth.models import AbstractUser, AbstractBaseUser
from django.contrib.auth.base_user import BaseUserManager
from django.utils.translation import gettext_lazy as _


# Create your models here.


class CustomManagerUser(BaseUserManager):
    
    def create_user(self,email,password=None,**extra_fields):

        extra_fields.setdefault("is_active",True)
        
        if not email:
            raise ValueError(_('The Email field must be set'))
        email = self.normalize_email(email)
        user = self.model(email=email, **extra_fields)
        user.set_password(password)
        user.save(using=self._db)
        return user

    def create_superuser(self,email,password=None,**extra_fields):

        extra_fields.setdefault("is_staff",True)
        extra_fields.setdefault("is_superuser",True)
        extra_fields.setdefault("is_active",True)

        if extra_fields.get("is_staff") is not True:
            raise ValueError(_("Superuser must be staff"))

        if extra_fields.get("is_superuser") is not True:
            raise ValueError(_("Superuser must be superuser"))

        if extra_fields.get("is_active") is not True:
            raise ValueError(_("Superuser must be active"))

        return self.create_user(email,password,**extra_fields)


def get_upload_path(filename):
    return os.path.join('images','profiles',filename)


class Utilisateur(AbstractUser):

    id = models.AutoField(primary_key=True)
    username = models.CharField(max_length=255, blank=True, null=True)
    first_name = models.CharField(max_length=255, blank=True, null=True)
    last_name = models.CharField(max_length=255, blank=True, null=True)
    niveau = models.CharField(max_length=50, blank=True, null=True)
    genre = models.CharField(max_length=10, blank=True, null=True)
    date_de_naissance = models.DateField(blank=True, null=True)
    email = models.CharField(unique=True, max_length=255, blank=True, null=True)
    centres_interet = models.CharField(max_length=255)
    telephone = models.CharField(max_length=20, blank=True, null=True)
    photo_de_profil = models.ImageField(upload_to='profiles/', blank=True, null=True)
    dernier_diplome = models.CharField(max_length=255, blank=True, null=True)
    serie = models.CharField(max_length=50, blank=True, null=True)
    is_staff = models.BooleanField(blank=True, null=True)
    is_superuser = models.BooleanField(blank=True, null=True)
    is_active = models.BooleanField(blank=True, null=False)
    last_login = models.DateTimeField(auto_now=True, null=True)
    date_joined = models.DateTimeField(auto_now_add=True, null=True)
    date_inscription = models.DateTimeField(auto_now_add=True, null=True)

    class Meta:
        managed = True
        db_table = 'utilisateur'

    USERNAME_FIELD = 'email'

    REQUIRED_FIELDS = ['username']

    objects = CustomManagerUser()

    def __str__(self):
        return f"<User  {self.email}"




