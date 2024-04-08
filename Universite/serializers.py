from .models import Universite

from rest_framework import serializers


class UniversiteCreationSerializer(serializers.ModelSerializer):
 
    nom = serializers.CharField(max_length=255)
    pays = serializers.CharField(max_length=255)
    ville = serializers.CharField(max_length=255)
    descriptif = serializers.CharField()
    email = serializers.CharField(max_length=255)
    telephone = serializers.CharField(max_length=255)
    site_web = serializers.CharField(max_length=255)
    logo = serializers.CharField()
    images_pc = serializers.CharField()
    images_telephone = serializers.CharField()
    images_tablettes = serializers.CharField()

    class Meta:

        model = Universite
        fields = ['universite_id','nom','ville','pays','descriptif','email','telephone','site_web','logo','images_pc','images_telephone','images_tablettes']
