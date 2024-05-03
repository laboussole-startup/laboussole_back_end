from django.db import models

# Create your models here.

class BourseEtude(models.Model):
    id_bourse = models.AutoField(primary_key=True)
    nom = models.CharField(max_length=255, blank=True, null=True)
    date_limite = models.DateField(blank=True, null=True)
    niveau = models.CharField(max_length=255, blank=True, null=True)
    finance = models.CharField(max_length=255, blank=True, null=True)
    ouvert_pour = models.CharField(max_length=255, blank=True, null=True)
    pays = models.CharField(max_length=255, blank=True, null=True)
    statut = models.CharField(max_length=255, blank=True, null=True)
    description = models.TextField(blank=True, null=True)
    etablissements_hotes = models.TextField(blank=True, null=True)
    programme_eligible = models.TextField(blank=True, null=True)
    nombre_bourse = models.CharField(max_length=255, blank=True, null=True)
    duree = models.CharField(max_length=255, blank=True, null=True)
    groupe_cible = models.CharField(max_length=255, blank=True, null=True)
    avantages_bourse = models.TextField(blank=True, null=True)
    critères_eligibilite = models.TextField(blank=True, null=True)
    comment_postuler = models.TextField(blank=True, null=True)
    page_officielle = models.CharField(max_length=255, blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'bourse_etude'

    def __str__(self) -> str:
        return f"<Bourse {self.nom}"