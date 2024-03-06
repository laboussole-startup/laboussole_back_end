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
    faculte = models.ForeignKey(Faculte, models.DO_NOTHING)

    class Meta:
        managed = False
        db_table = 'filieres'