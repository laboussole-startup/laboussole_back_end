from .models import BourseEtude
from rest_framework import serializers


class BourseEtudeCreationSerializer(serializers.ModelSerializer):

    nom = serializers.CharField(max_length=255,)
    date_limite = serializers.DateField()
    niveau = serializers.CharField(max_length=255)
    finance = serializers.CharField(max_length=255)
    ouvert_pour = serializers.CharField(max_length=255)
    pays = serializers.CharField(max_length=255)
    statut = serializers.CharField(max_length=255)
    description = serializers.CharField()
    etablissements_hotes = serializers.CharField()
    programme_eligible = serializers.CharField()
    nombre_bourse = serializers.CharField(max_length=255)
    duree = serializers.CharField(max_length=255)
    groupe_cible = serializers.CharField(max_length=255)
    avantages_bourse = serializers.CharField()
    critères_eligibilite = serializers.CharField()
    comment_postuler = serializers.CharField()
    page_officielle = serializers.CharField(max_length=255)
    image_url = serializers.ImageField()

    class Meta:
        model = BourseEtude
        fields = ['nom','date_limite','niveau','finance','ouvert_pour','pays','statut','description','etablissements_hotes','programme_eligible','nombre_bourse','duree','groupe_cible','avantages_bourse','critères_eligibilite','comment_postuler','page_officielle','image_url']
    
