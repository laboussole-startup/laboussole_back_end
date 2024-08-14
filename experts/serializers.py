from .models import Experts

from rest_framework import serializers


class ExpertCreationSerializer(serializers.ModelSerializer):
    
    nom = serializers.CharField()
    prenom = serializers.CharField()
    role = serializers.CharField()
    domaine = serializers.CharField()
    telephone = serializers.CharField()
    adresse_mail = serializers.CharField()
    pays = serializers.CharField()
    ville = serializers.CharField()
    annee_experience = serializers.IntegerField()
    nombre_personne_a_noter = serializers.IntegerField()
    note_moyenne = serializers.FloatField()
    montant_commission = serializers.FloatField()


    class Meta:

        model = Experts
        fields = ['expert_id','nom','prenom','role','domaine','adresse_mail','telephone','pays','ville','annee_experience','nombre_personne_a_noter','note_moyenne','montant_commission']


   