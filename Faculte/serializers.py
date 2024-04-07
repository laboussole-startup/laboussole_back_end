from .models import Faculte

from rest_framework import serializers


class FaculteCreationSerializer(serializers.ModelSerializer):
    
    nom = serializers.CharField(max_length=255)
    descriptif = serializers.CharField()
    condition_admission = serializers.CharField()
    email = serializers.CharField()
    telephone = serializers.CharField()
    images_pc = serializers.CharField()
    images_telephone = serializers.CharField()
    images_tablettes = serializers.CharField()
    universite = serializers.IntegerField(source='universite_id')


    class Meta:

        model = Faculte
        fields = ['faculte_id','nom','descriptif','condition_admission','email','telephone','universite','images_pc','images_telephone','images_tablettes']


   