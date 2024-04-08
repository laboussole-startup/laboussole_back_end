from django.shortcuts import render, get_object_or_404
from .models import Universite
from . import serializers
from rest_framework import generics,status
from rest_framework.response import Response
from rest_framework.permissions import IsAuthenticated,IsAuthenticatedOrReadOnly

# Create your views here.

class UniversiteListView(generics.GenericAPIView):

    serializer_class = serializers.UniversiteCreationSerializer

    queryset = Universite.objects.all()

    permission_classes = [IsAuthenticatedOrReadOnly]

    def get(self,request):

        universites = Universite.objects.all()

        serializer = self.serializer_class(instance=universites,many=True)

        return Response(data=serializer.data,status=status.HTTP_200_OK)
        

    def post(self,request):

        data = request.data

        serializer = self.serializer_class(data=data)

        user = request.user

        if serializer.is_valid():

            serializer.save()

            return Response(data=serializer.data,status=status.HTTP_201_CREATED)

        return Response(data=serializer.errors,status=status.HTTP_400_BAD_REQUEST)


class UniversiteDetailView(generics.GenericAPIView):

    permission_classes = [IsAuthenticatedOrReadOnly]

    serializer_class = serializers.UniversiteCreationSerializer

    def get(self,request,universite_id):
        
        universites = get_object_or_404(Universite,pk=universite_id)

        serializer = self.serializer_class(instance=universites)

        return Response(data=serializer.data,status=status.HTTP_200_OK)

    def put(self,request,universite_id):

        data = request.data

        universites = get_object_or_404(Universite,pk=universite_id)

        serializer = self.serializer_class(data=data,instance=universites)

        if serializer.is_valid():

            serializer.save()

            return Response(data=serializer.data,status=status.HTTP_200_OK)

        return Response(data=serializer.errors,status=status.HTTP_400_BAD_REQUEST)


    def delete(self,request,universite_id):
        
        universites = get_object_or_404(Universite,pk=universite_id)

        universites.delete()

        return Response(status=status.HTTP_204_NO_CONTENT)