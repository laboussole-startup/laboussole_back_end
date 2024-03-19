from django.db import models

# Create your models here.

class Universite(models.Model):
    universite_id = models.AutoField(primary_key=True)
    nom = models.CharField(unique=True, max_length=255)
    ville = models.CharField(max_length=255)
    descriptif = models.TextField()
    email = models.CharField(max_length=255)
    telephone = models.CharField(max_length=255)
    site_web = models.CharField(max_length=255, blank=True, null=True)
    image_url = models.ImageField(upload_to="images/universites/", blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'universite'