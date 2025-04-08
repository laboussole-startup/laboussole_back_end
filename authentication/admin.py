from django.contrib import admin
from .models import Utilisateur
from django.contrib.auth.admin import UserAdmin


# Register your models here.
class CustomUserAdmin(UserAdmin):
    search_fields = ['email']
admin.site.register(Utilisateur, CustomUserAdmin)