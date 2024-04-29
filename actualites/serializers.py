from .models import Actualit
from rest_framework import serializers

class ActualitCreationSerializer(serializers.ModelSerializer):
    
    titre = serializers.CharField(max_length=255)
    date = serializers.DateField()
    nom = serializers.CharField(max_length=255)
    contenu = serializers.CharField()
    domaine = serializers.CharField()
    image_pc = serializers.CharField()
    image_tablette = serializers.CharField()
    image_telephone = serializers. CharField()

    class Meta:

        model = Actualit
        fields = ['id_actualite','titre','date','nom','contenu','domaine','image_pc','image_telephone','image_tablette']

    