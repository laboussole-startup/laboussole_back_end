from .models import Consultation

from rest_framework import serializers


class ConsultationCreationSerializer(serializers.ModelSerializer):
    
    objet = serializers.CharField()
    expert = serializers.IntegerField()
    utilisateur = serializers.IntegerField()
    montant = serializers.IntegerField()
    date = serializers.DateTimeField()


    class Meta:

        model = Consultation
        fields = ['objet','expert','utilisateur','montant','date']


   