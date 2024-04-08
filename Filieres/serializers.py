from .models import Filieres

from rest_framework import serializers


class FilieresCreationSerializer(serializers.ModelSerializer):
    
    nom = serializers.CharField(max_length=255)
    descriptif = serializers.CharField()
    duree = serializers.IntegerField()
    cout = serializers.DecimalField(max_digits=10, decimal_places=2)
    langue_enseignement = serializers.CharField(max_length=50)
    diplome_delivre = serializers.CharField(max_length=255)
    faculte = serializers.IntegerField(source="faculte_id")
    images_pc = serializers.CharField()
    images_telephone = serializers.CharField()
    images_tablettes = serializers.CharField()
    centre_interet = serializers.CharField()

    class Meta:

        model = Filieres
        fields = ['nom','descriptif','duree','cout','langue_enseignement','diplome_delivre','faculte','images_pc','images_telephone','images_tablettes','centre_interet']
