from django.db import models

from Universite.models import Universite

# Create your models here.

class Faculte(models.Model):
    faculte_id = models.AutoField(primary_key=True)
    nom = models.CharField(max_length=255)
    descriptif = models.TextField(blank=True, null=True)
    condition_admission = models.TextField(blank=True, null=True)
    email = models.CharField(max_length=255, blank=True, null=True)
    telephone = models.CharField(max_length=255, blank=True, null=True)
    universite = models.ForeignKey(Universite, models.DO_NOTHING)

    class Meta:
        managed = False
        db_table = 'faculte'