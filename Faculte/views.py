from django.shortcuts import render, get_object_or_404
from .models import Faculte
from . import serializers
from rest_framework import generics,status
from rest_framework.response import Response
from rest_framework.permissions import IsAuthenticated,IsAuthenticatedOrReadOnly

# Create your views here.

class FaculteListView(generics.GenericAPIView):

    serializer_class = serializers.FaculteCreationSerializer

    queryset = Faculte.objects.all()

    permission_classes = [IsAuthenticated]

    def get(self,request):

        facultes = Faculte.objects.all()

        serializer = self.serializer_class(instance=facultes,many=True)

        return Response(data=serializer.data,status=status.HTTP_200_OK)
        

    def post(self,request):

        data = request.data

        serializer = self.serializer_class(data=data)

        user = request.user

        if serializer.is_valid():

            serializer.save()

            return Response(data=serializer.data,status=status.HTTP_201_CREATED)

        return Response(data=serializer.errors,status=status.HTTP_400_BAD_REQUEST)


class FaculteDetailView(generics.GenericAPIView):

    permission_classes = [IsAuthenticatedOrReadOnly]

    serializer_class = serializers.FaculteCreationSerializer

    def get(self,request,faculte_id):
        
        faculte = get_object_or_404(Faculte,pk=faculte_id)

        serializer = self.serializer_class(instance=faculte)

        return Response(data=serializer.data,status=status.HTTP_200_OK)

    def put(self,request,faculte_id):

        data = request.data

        faculte = get_object_or_404(Faculte,pk=faculte_id)

        serializer = self.serializer_class(data=data,instance=faculte)

        if serializer.is_valid():

            serializer.save()

            return Response(data=serializer.data,status=status.HTTP_200_OK)

        return Response(data=serializer.errors,status=status.HTTP_400_BAD_REQUEST)


    def delete(self,request,faculte_id):
        
        faculte = get_object_or_404(Faculte,pk=faculte_id)

        faculte.delete()

        return Response(status=status.HTTP_204_NO_CONTENT)

class UniversityFacultiesView(generics.GenericAPIView):

    permission_classes = [IsAuthenticatedOrReadOnly]

    serializer_class = serializers.FaculteCreationSerializer

    def get(self,request,universite_id):

        faculties = Faculte.objects.filter(universite=universite_id)

        serializer = self.serializer_class(instance=faculties,many=True)

        return Response(data=serializer.data,status=status.HTTP_200_OK)