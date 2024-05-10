from django.db import models
from authentication.models import Utilisateur

# Create your models here.

class Recherches(models.Model):
    id_utilisateur = models.IntegerField(blank=True, null=True)
    date_heure = models.DateTimeField(blank=True, null=True)
    mots_cles = models.CharField(max_length=255, blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'recherches'
