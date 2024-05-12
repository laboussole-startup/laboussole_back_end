from django.shortcuts import render, get_object_or_404
from .models import Temoignage
from . import serializers
from rest_framework import generics,status
from rest_framework.response import Response
from rest_framework.permissions import IsAuthenticated,IsAuthenticatedOrReadOnly

# Create your views here.

class TemoignageListView(generics.GenericAPIView):

    serializer_class = serializers.TemoignageCreationSerializer

    queryset = Temoignage.objects.all()

    permission_classes = [IsAuthenticatedOrReadOnly]


    def get(self,request):

        temoignages = Temoignage.objects.all()

        serializer = self.serializer_class(instance=temoignages,many=True)

        return Response(data=serializer.data,status=status.HTTP_200_OK)
        

    def post(self,request):

        data = request.data

        # Replace the 'nom' field with the authenticated user's email
        data['nom'] = request.user.email

        serializer = self.serializer_class(data=data)

        user = request.user

        if serializer.is_valid():

            serializer.save()

            return Response(data=serializer.data,status=status.HTTP_201_CREATED)

        return Response(data=serializer.errors,status=status.HTTP_400_BAD_REQUEST)


class TemoignageDetailView(generics.GenericAPIView):

    permission_classes = [IsAuthenticatedOrReadOnly]

    serializer_class = serializers.TemoignageCreationSerializer

    def get(self,request,temoignage_id):
        
        temoignages = get_object_or_404(Temoignage,pk=temoignage_id)

        serializer = self.serializer_class(instance=temoignages)

        return Response(data=serializer.data,status=status.HTTP_200_OK)

    def put(self, request, temoignage_id):
        if not request.user.is_staff:
            return Response({"error": "Unauthorized access"}, status=status.HTTP_401_UNAUTHORIZED)
        
        data = request.data
        temoignage = get_object_or_404(Temoignage, pk=temoignage_id)
        serializer = self.serializer_class(data=data, instance=temoignage)
        
        if serializer.is_valid():
            serializer.save()
            return Response(data=serializer.data, status=status.HTTP_200_OK)
        return Response(data=serializer.errors, status=status.HTTP_400_BAD_REQUEST)

    def delete(self, request, temoignage_id):
        if not request.user.is_staff:
            return Response({"error": "Unauthorized access"}, status=status.HTTP_401_UNAUTHORIZED)
        
        temoignage = get_object_or_404(Temoignage, pk=temoignage_id)
        temoignage.delete()
        
        return Response(status=status.HTTP_204_NO_CONTENT)