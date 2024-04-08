from django.db import models


class Administrateur(models.Model):
    id_admin = models.AutoField(primary_key=True)
    nom = models.CharField(max_length=255, blank=True, null=True)
    prenom = models.CharField(max_length=255, blank=True, null=True)
    mail = models.CharField(max_length=255, blank=True, null=True)
    mot_de_passe = models.CharField(max_length=255, blank=True, null=True)
    telephone = models.CharField(max_length=20, blank=True, null=True)
    derniere_connexion = models.DateTimeField(blank=True, null=True)
    photo_de_profil = models.CharField(max_length=255, blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'administrateur'