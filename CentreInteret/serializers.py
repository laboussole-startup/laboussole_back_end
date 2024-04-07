
from .models import CentreInteret

from rest_framework import serializers

class CentreInteretCreationSerializer(serializers.ModelSerializer):

    nom = serializers.CharField(max_length=255)
    filieres = serializers.IntegerField(source='filieres_id')

    class Meta:
        model = CentreInteret
        fields = ['id','nom','filieres']