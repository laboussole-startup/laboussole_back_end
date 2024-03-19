from django.db import models

# Create your models here.


class Temoignage(models.Model):
    id_temoignage = models.AutoField(primary_key=True)
    nom = models.CharField(max_length=255, blank=True, null=True)
    telephone = models.CharField(max_length=20, blank=True, null=True)
    contenu = models.TextField(blank=True, null=True)
    photo = models.ImageField(upload_to="images/temoignages/", null=True)
    profession = models.CharField(max_length=255, blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'temoignage'