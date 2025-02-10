from django.db import models

# Create your models here.
class Notification(models.Model):
    id_notification = models.AutoField(primary_key=True)
    titre = models.CharField(max_length=255, blank=True, null=True)
    contenu = models.TextField(blank=True, null=True)
    statut = models.CharField(max_length=255, blank=True, null=True)
    nationalité = models.CharField(max_length=255, blank=True, null=True)
    date = models.DateTimeField(blank=True, null=True)
    image_pc = models.TextField(blank=True, null=True)
    image_tablette = models.TextField(blank=True, null=True)
    image_telephone = models.TextField(blank=True, null=True)
    # expiration_date = models.DateTimeField(null=True, blank=True)
    # Hello = models.TextField()
    
    
    # def is_expired(self):
    #     return self.expiration_date < timezone.now()

    class Meta:
        managed = False
        db_table = 'notification'

    def __str__(self) -> str:
        return f"<Notif {self.titre}"