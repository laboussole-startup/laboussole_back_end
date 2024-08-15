from django.db import models
from django.contrib.auth.models import User
from experts.models import Experts
from authentication.models import Utilisateur

class Consultation(models.Model):
    consultation_id = models.AutoField(primary_key=True)
    objet = models.CharField(max_length=255)
    expert_id = models.IntegerField()
    utilisateur_id = models.IntegerField()
    montant = models.IntegerField()
    date = models.DateTimeField()

    class Meta:
        managed = False
        db_table = 'consultation'
        indexes = [
            models.Index(fields=['consultation_id']),
        ]

    def __str__(self):
        return f'Consultation {self.consultation_id}: {self.objet}'
