from .models import Consultation

from rest_framework import serializers


class ConsultationCreationSerializer(serializers.ModelSerializer):
    
    objet = serializers.CharField()
    expert_id = serializers.IntegerField()
    utilisateur_id = serializers.IntegerField()
    montant = serializers.IntegerField()
    date = serializers.DateTimeField()


    class Meta:

        model = Consultation
        fields = ['objet','expert_id','utilisateur_id','montant','date']


   