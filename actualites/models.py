from django.db import models

# Create your models here.

class Actualit(models.Model):
    id_actualite = models.AutoField(primary_key=True)
    titre = models.CharField(max_length=255, blank=True, null=True)
    date = models.DateField(blank=True, null=True)
    nom = models.CharField(max_length=255, blank=True, null=True)
    contenu = models.TextField(blank=True, null=True)
    domaine = models.CharField(max_length=255, blank=True, null=True)
    image_pc = models.TextField(blank=True, null=True)
    image_tablette = models.TextField(blank=True, null=True)
    image_telephone = models.TextField(blank=True, null=True)

    def __str__(self) -> str:
        return f"<Actualite {self.nom}"

    class Meta:
        managed = False
        db_table = 'actualité'