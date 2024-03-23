from .models import Faculte

from rest_framework import serializers


class FaculteCreationSerializer(serializers.ModelSerializer):
    
    nom = serializers.CharField(max_length=255)
    descriptif = serializers.CharField()
    condition_admission = serializers.CharField()
    email = serializers.CharField()
    telephone = serializers.CharField()
    universite_id = serializers.IntegerField()
    imageurl = serializers.ImageField()

    class Meta:

        model = Faculte
        fields = ['faculte_id','nom','descriptif','condition_admission','email','telephone','universite_id','imageurl']


   