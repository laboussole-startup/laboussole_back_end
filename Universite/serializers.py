from .models import Universite

from rest_framework import serializers


class UniversiteCreationSerializer(serializers.ModelSerializer):
 
    nom = serializers.CharField(max_length=255)
    ville = serializers.CharField(max_length=255)
    descriptif = serializers.CharField()
    email = serializers.CharField(max_length=255)
    telephone = serializers.CharField(max_length=255)
    site_web = serializers.CharField(max_length=255)
    imageurl = serializers.ImageField()

    class Meta:

        model = Universite
        fields = ['universite_id','nom','ville','descriptif','email','telephone','site_web','imageurl']