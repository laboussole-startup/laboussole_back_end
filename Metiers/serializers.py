from .models import Metiers

from rest_framework import serializers


class MetiersCreationSerializer(serializers.ModelSerializer):
    
    nom = serializers.CharField(max_length=255)
    description = serializers.CharField()
    entreprisesrecrutent = serializers.CharField()
    salairemoyen = serializers.CharField()
    competencescles = serializers.CharField()
    images = serializers.ImageField()

    class Meta:

        model = Metiers
        fields = ['id_metiers','nom','description','entreprisesrecrutent','salairemoyen','competencescles','images']
