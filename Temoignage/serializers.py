from rest_framework import serializers

from .models import Temoignage

class TemoignageCreationSerializer(serializers.ModelSerializer):

    nom = serializers.CharField(max_length=255)
    telephone = serializers.CharField(max_length=20)
    contenu = serializers.CharField()
    photo = serializers.ImageField()
    profession = serializers.CharField(max_length=255)
    Score = serializers.IntegerField()

    class Meta:

        model = Temoignage
        fields = ['id_temoignage','nom','telephone','contenu','profession','photo','Score']