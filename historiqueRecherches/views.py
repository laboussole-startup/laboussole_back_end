from django.shortcuts import render, get_object_or_404
from .models import Recherches
from . import serializers
from rest_framework import generics,status
from rest_framework.response import Response
from rest_framework.permissions import IsAuthenticated,IsAuthenticatedOrReadOnly

# Create your views here.

class RecherchesListView(generics.GenericAPIView):

    serializer_class = serializers.RecherchesCreationSerializer

    queryset = Recherches.objects.all()


    def get(self,request):

        all_recherches = Recherches.objects.all()

        serializer = self.serializer_class(instance=all_recherches,many=True)

        return Response(data=serializer.data,status=status.HTTP_200_OK)
        

    def post(self,request):

        data = request.data

        serializer = self.serializer_class(data=data)

        user = request.user

        if serializer.is_valid():

            serializer.save()

            return Response(data=serializer.data,status=status.HTTP_201_CREATED)

        return Response(data=serializer.errors,status=status.HTTP_400_BAD_REQUEST)


class RecherchesDetailView(generics.GenericAPIView):

    permission_classes = [IsAuthenticatedOrReadOnly]

    serializer_class = serializers.RecherchesCreationSerializer

    def get(self,request,recherche_id):
        
        recherche = get_object_or_404(Recherches,pk=recherche_id)

        serializer = self.serializer_class(instance=recherche)

        return Response(data=serializer.data,status=status.HTTP_200_OK)

    def put(self,request,recherche_id):

        data = request.data

        recherche = get_object_or_404(Recherches,pk=recherche_id)

        serializer = self.serializer_class(data=data,instance=recherche)

        if serializer.is_valid():

            serializer.save()

            return Response(data=serializer.data,status=status.HTTP_200_OK)

        return Response(data=serializer.errors,status=status.HTTP_400_BAD_REQUEST)


    def delete(self,request,recherche_id):
        
        recherche = get_object_or_404(Recherches,pk=recherche_id)

        recherche.delete()

        return Response(status=status.HTTP_204_NO_CONTENT)