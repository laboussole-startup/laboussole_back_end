from django.db import models


# Create your models here.

class Experts(models.Model):
    expert_id = models.AutoField(primary_key=True)
    nom = models.CharField(max_length=255)
    prenom = models.CharField(max_length=255)
    role = models.CharField(max_length=255)
    domaine = models.TextField(blank=True, null=True)
    telephone = models.CharField(max_length=255)
    adresse_mail = models.CharField(max_length=255)
    pays = models.CharField(max_length=255)
    ville = models.CharField(max_length=255)
    annee_experience = models.IntegerField()
    nombre_personne_a_noter = models.IntegerField(blank=True, null=True)
    note_moyenne = models.FloatField(blank=True, null=True)
    montant_commission = models.FloatField(blank=True, null=True)

    description = models.TextField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'experts'

    def __str__(self) -> str:
        return f"<Expert {self.expert_id}-->{self.nom}"