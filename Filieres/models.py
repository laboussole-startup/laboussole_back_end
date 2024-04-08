from django.db import models

from Faculte.models import Faculte

# Create your models here.

class Filieres(models.Model):
    filieres_id = models.AutoField(primary_key=True)
    nom = models.CharField(max_length=255)
    descriptif = models.TextField()
    duree = models.IntegerField()
    cout = models.DecimalField(max_digits=10, decimal_places=2)
    langue_enseignement = models.CharField(max_length=50)
    diplome_delivre = models.CharField(max_length=255)
    images_pc = models.CharField(max_length=255, blank=True, null=True)
    images_telephone = models.CharField(max_length=255, blank=True, null=True)
    images_tablettes = models.CharField(max_length=255, blank=True, null=True)
    faculte = models.ForeignKey(Faculte, models.DO_NOTHING)
    centre_interet = models.TextField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'filieres'