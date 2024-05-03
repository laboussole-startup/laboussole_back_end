from django.db import models
from Filieres.models import Filieres

# Create your models here.


class Metiers(models.Model):
    id_metiers = models.AutoField(primary_key=True)
    nom = models.CharField(max_length=255, blank=True, null=True)
    description = models.TextField(blank=True, null=True)
    entreprisesrecrutent = models.TextField(blank=True, null=True)
    salairemoyen = models.TextField(blank=True, null=True)
    competencescles = models.TextField(blank=True, null=True)
    logo = models.TextField(blank=True, null=True)
    images_pc = models.CharField(max_length=255, blank=True, null=True)
    principales_missions = models.TextField(blank=True, null=True)
    images_telephone = models.CharField(max_length=255, blank=True, null=True)
    images_tablettes = models.CharField(max_length=255, blank=True, null=True)
    faculte = models.TextField(blank=True, null=True)
    ecole = models.TextField(blank=True, null=True)
    filiere = models.TextField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'metiers'

    def __str__(self) -> str:
        return f"<Metier {self.nom}"