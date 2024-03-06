
from .models import CentreInteret

from rest_framework import serializers

class CentreInteretCreationSerializer(serializers.ModelSerializer):

    nom = serializers.CharField(max_length=255)
    filieres_id = serializers.IntegerField()

    class Meta:
        model = CentreInteret
        fields = ['id','nom','filieres_id']