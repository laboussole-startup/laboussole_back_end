from django.shortcuts import render, get_object_or_404
from .models import Filieres
from . import serializers
from rest_framework import generics,status
from rest_framework.response import Response
from rest_framework.permissions import IsAuthenticated,IsAuthenticatedOrReadOnly

# Create your views here.

class FilieresListView(generics.GenericAPIView):

    serializer_class = serializers.FilieresCreationSerializer

    queryset = Filieres.objects.all()

    permission_classes = [IsAuthenticatedOrReadOnly]

    def get(self,request):

        name = request.query_params.get('name', None)

        if name:
            filieres = Filieres.objects.filter(nom=name)
        else:
            filieres = Filieres.objects.all()

        serializer = self.serializer_class(instance=filieres, many=True)
        
        return Response(data=serializer.data, status=status.HTTP_200_OK)


    def post(self,request):

        data = request.data

        user = request.user

        # Check if the authenticated user is an admin
        if not user.is_staff:
            return Response({"error": "Only admin users can perform this action"}, status=status.HTTP_403_FORBIDDEN)

        serializer = self.serializer_class(data=data)

        user = request.user

        if serializer.is_valid():

            serializer.save()

            return Response(data=serializer.data,status=status.HTTP_201_CREATED)

        return Response(data=serializer.errors,status=status.HTTP_400_BAD_REQUEST)


class FilieresDetailView(generics.GenericAPIView):

    permission_classes = [IsAuthenticatedOrReadOnly]

    serializer_class = serializers.FilieresCreationSerializer

    def get(self,request,filiere_id):

        filieres = get_object_or_404(Filieres,pk=filiere_id)

        serializer = self.serializer_class(instance=filieres)

        return Response(data=serializer.data,status=status.HTTP_200_OK)

    def put(self,request,filiere_id):

        data = request.data

        user = request.user

        # Check if the authenticated user is an admin
        if not user.is_staff:
            return Response({"error": "Only admin users can perform this action"}, status=status.HTTP_403_FORBIDDEN)

        filieres = get_object_or_404(Filieres,pk=filiere_id)

        serializer = self.serializer_class(data=data,instance=filieres)

        if serializer.is_valid():

            serializer.save()

            return Response(data=serializer.data,status=status.HTTP_200_OK)

        return Response(data=serializer.errors,status=status.HTTP_400_BAD_REQUEST)


    def delete(self,request,filiere_id):

        user = request.user

        # Check if the authenticated user is an admin
        if not user.is_staff:
            return Response({"error": "Only admin users can perform this action"}, status=status.HTTP_403_FORBIDDEN)

        filieres = get_object_or_404(Filieres,pk=filiere_id)

        filieres.delete()

        return Response(status=status.HTTP_204_NO_CONTENT)

class FacultesFilieresView(generics.GenericAPIView):

    permission_classes = [IsAuthenticatedOrReadOnly]

    serializer_class = serializers.FilieresCreationSerializer

    def get(self,request,faculte_id):

        faculties = Filieres.objects.filter(faculte=faculte_id)

        serializer = self.serializer_class(instance=faculties,many=True)

        return Response(data=serializer.data,status=status.HTTP_200_OK)

class FilieresPerCycleView(generics.GenericAPIView):

    permission_classes = [IsAuthenticatedOrReadOnly]

    serializer_class = serializers.FilieresCreationSerializer

    def get(self,request,faculte_id,duree_cycle):

        filieres = Filieres.objects.filter(faculte_id=faculte_id, duree=duree_cycle)

        serializer = self.serializer_class(instance=filieres,many=True)

        return Response(data=serializer.data,status=status.HTTP_200_OK)
