from .models import Recherches

from rest_framework import serializers


class RecherchesCreationSerializer(serializers.ModelSerializer):
    id_utilisateur = serializers.IntegerField(source="id_utilisateur")
    date_heure = serializers.DateTimeField()
    mots_cles = serializers.CharField()

    class Meta:
        model = Recherches
        fields = ['id_utilisateur','date_heure','mots_cles']
