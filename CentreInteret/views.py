from django.shortcuts import render, get_object_or_404
from .models import CentreInteret
from . import serializers
from rest_framework import generics,status
from rest_framework.response import Response
from rest_framework.permissions import IsAuthenticated,IsAuthenticatedOrReadOnly

# Create your views here.

class CentreInteretListView(generics.GenericAPIView):

    serializer_class = serializers.CentreInteretCreationSerializer

    queryset = CentreInteret.objects.all()

    permission_classes = [IsAuthenticatedOrReadOnly]

    def get(self,request):

        centre_interets = CentreInteret.objects.all()

        serializer = self.serializer_class(instance=centre_interets,many=True)

        return Response(data=serializer.data,status=status.HTTP_200_OK)
        

    def post(self, request):
        data = request.data
        serializer = self.serializer_class(data=data)
        user = request.user

        # Check if the authenticated user is an admin
        if not user.is_staff:
            return Response({"error": "Only admin users can perform this action"}, status=status.HTTP_403_FORBIDDEN)

        if serializer.is_valid():
            serializer.save()
            return Response(data=serializer.data, status=status.HTTP_201_CREATED)
        return Response(data=serializer.errors, status=status.HTTP_400_BAD_REQUEST)


class CentreInteretDetailView(generics.GenericAPIView):

    permission_classes = [IsAuthenticatedOrReadOnly]

    serializer_class = serializers.CentreInteretCreationSerializer

    def get(self,request,interet_id):
        
        Centre_Interet = get_object_or_404(CentreInteret,pk=interet_id)

        serializer = self.serializer_class(instance=Centre_Interet)

        return Response(data=serializer.data,status=status.HTTP_200_OK)

    def put(self,request,interet_id):

        data = request.data

        user = request.user

        # Check if the authenticated user is an admin
        if not user.is_staff:
            return Response({"error": "Only admin users can perform this action"}, status=status.HTTP_403_FORBIDDEN)

        Centre_Interet = get_object_or_404(CentreInteret,pk=interet_id)

        serializer = self.serializer_class(data=data,instance=Centre_Interet)

        if serializer.is_valid():

            serializer.save()

            return Response(data=serializer.data,status=status.HTTP_200_OK)

        return Response(data=serializer.errors,status=status.HTTP_400_BAD_REQUEST)


    def delete(self,request,interet_id):

        user = request.user

        # Check if the authenticated user is an admin
        if not user.is_staff:
            return Response({"error": "Only admin users can perform this action"}, status=status.HTTP_403_FORBIDDEN)
        
        Centre_Interet = get_object_or_404(CentreInteret,pk=interet_id)

        Centre_Interet.delete()

        return Response(status=status.HTTP_204_NO_CONTENT)