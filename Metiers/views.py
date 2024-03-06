from django.shortcuts import render, get_object_or_404
from .models import Metiers
from . import serializers
from rest_framework import generics,status
from rest_framework.response import Response
from rest_framework.permissions import IsAuthenticated,IsAuthenticatedOrReadOnly

# Create your views here.

class MetiersListView(generics.GenericAPIView):

    serializer_class = serializers.MetiersCreationSerializer

    queryset = Metiers.objects.all()

    permission_classes = [IsAuthenticated]

    def get(self,request):

        metiers = Metiers.objects.all()

        serializer = self.serializer_class(instance=metiers,many=True)

        return Response(data=serializer.data,status=status.HTTP_200_OK)
        

    def post(self,request):

        data = request.data

        serializer = self.serializer_class(data=data)

        user = request.user

        if serializer.is_valid():

            serializer.save()

            return Response(data=serializer.data,status=status.HTTP_201_CREATED)

        return Response(data=serializer.errors,status=status.HTTP_400_BAD_REQUEST)


class MetiersDetailView(generics.GenericAPIView):

    permission_classes = [IsAuthenticatedOrReadOnly]

    serializer_class = serializers.MetiersCreationSerializer

    def get(self,request,metier_id):
        
        metiers = get_object_or_404(Metiers,pk=metier_id)

        serializer = self.serializer_class(instance=metiers)

        return Response(data=serializer.data,status=status.HTTP_200_OK)

    def put(self,request,metier_id):

        data = request.data

        metiers = get_object_or_404(Metiers,pk=metier_id)

        serializer = self.serializer_class(data=data,instance=metiers)

        if serializer.is_valid():

            serializer.save()

            return Response(data=serializer.data,status=status.HTTP_200_OK)

        return Response(data=serializer.errors,status=status.HTTP_400_BAD_REQUEST)


    def delete(self,request,metier_id):
        
        metiers = get_object_or_404(Metiers,pk=metier_id)

        metiers.delete()

        return Response(status=status.HTTP_204_NO_CONTENT)