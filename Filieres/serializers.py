from .models import Filieres

from rest_framework import serializers


class FilieresCreationSerializer(serializers.ModelSerializer):
    
    nom = serializers.CharField(max_length=255)
    descriptif = serializers.CharField()
    duree = serializers.IntegerField()
    cout = serializers.DecimalField(max_digits=10, decimal_places=2)
    langue_enseignement = serializers.CharField(max_length=50)
    diplome_delivre = serializers.CharField(max_length=255)
    faculte_id = serializers.IntegerField()

    class Meta:

        model = Filieres
        fields = ['nom','descriptif','duree','cout','langue_enseignement','diplome_delivre','faculte_id']