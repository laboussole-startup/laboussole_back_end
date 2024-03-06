from django.db import models

# Create your models here.


class Metiers(models.Model):
    id_metiers = models.AutoField(primary_key=True)
    nom = models.CharField(max_length=255, blank=True, null=True)
    description = models.TextField(blank=True, null=True)
    entreprisesrecrutent = models.TextField(blank=True, null=True)
    salairemoyen = models.TextField(blank=True, null=True)
    competencescles = models.TextField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'metiers'