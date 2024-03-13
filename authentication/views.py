from django.shortcuts import render
from .models import Utilisateur
from . import serializers
from rest_framework.views import APIView
from rest_framework import generics,status
from rest_framework.response import Response
from rest_framework.parsers import MultiPartParser,FormParser

# Create your views here.


class UserCreateView(APIView):

    serializer_class = serializers.UserCreationSerializer
    parser_classes = [FormParser,MultiPartParser]

    def post(self,request,format=None):

        data = request.data

        serializer = self.serializer_class(data=data)

        if serializer.is_valid():

            serializer.save()

            return Response(data=serializer.data,status=status.HTTP_201_CREATED)

        return Response(data=serializer.errors ,status=status.HTTP_400_BAD_REQUEST)

