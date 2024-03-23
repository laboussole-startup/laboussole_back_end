from django.db import models

from Filieres.models import Filieres

# Create your models here.

class CentreInteret(models.Model):
    nom = models.CharField(max_length=255, blank=True, null=True)
    filieres = models.ForeignKey(Filieres, models.DO_NOTHING, blank=True, null=True)
    imageurl = models.ImageField(upload_to="images/interets/", blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'centre_interet'