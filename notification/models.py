from django.db import models
from django.utils import timezone
from dateutil.relativedelta import relativedelta

def two_months_from_now():
    return timezone.now() + relativedelta(weeks=2)
# Create your models here.
class Notification(models.Model):
    id_notification = models.AutoField(primary_key=True)
    titre = models.CharField(max_length=255, blank=True, null=True)
    contenu = models.TextField(blank=True, null=True)
    statut = models.CharField(max_length=255, blank=True, null=True)
    nationalité = models.CharField(max_length=255, blank=True, null=True)
    date = models.DateTimeField(blank=True, null=True)
    expiration_date = models.DateTimeField(default=two_months_from_now)
    image_pc = models.TextField(blank=True, null=True)
    image_tablette = models.TextField(blank=True, null=True)
    image_telephone = models.TextField(blank=True, null=True)

    class Meta:
        db_table = 'notification'

    def __str__(self) -> str:
        return f"<Notif {self.titre}"