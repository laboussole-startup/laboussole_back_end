from django.db import models

# Create your models here.
# models.py
from django.db import models

class FileUpload(models.Model):
    file = models.FileField(upload_to='notifications/files/')
    uploaded_at = models.DateTimeField(auto_now_add=True)

    def __str__(self):
        return self.file.name
