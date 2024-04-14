from .models import Notification
from rest_framework import serializers

class NotificationCreationSerializer(serializers.ModelSerializer):
   
    titre = serializers.CharField(max_length=255)
    contenu = serializers.CharField()
    statut = serializers.CharField(max_length=255)
    nationalité = serializers.CharField()
    image_pc = serializers.CharField()
    image_tablette = serializers.CharField()
    image_desktop = serializers.CharField()

    class Meta:

        model = Notification
        fields = ['id_notification','titre','contenu','statut','nationalité','image_pc','image_desktop','image_tablette']

