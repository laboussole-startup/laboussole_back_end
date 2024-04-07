from .models import Metiers

from rest_framework import serializers


class MetiersCreationSerializer(serializers.ModelSerializer):
    
    nom = serializers.CharField(max_length=255)
    description = serializers.CharField()
    entreprisesrecrutent = serializers.CharField()
    salairemoyen = serializers.CharField()
    competencescles = serializers.CharField()
    logo = serializers.CharField()
    filieres = serializers.IntegerField(source='filieres_id')
    images_pc = serializers.CharField()
    principales_missions = serializers.CharField()
    images_telephone = serializers.CharField()
    images_tablettes = serializers.CharField()

    class Meta:

        model = Metiers
        fields = ['id_metiers','nom','description','entreprisesrecrutent','salairemoyen','competencescles','logo','filieres','images_pc','principales_missions','images_telephone','images_tablettes']
