from django.shortcuts import render,get_object_or_404
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

class UserGetDetailView(generics.GenericAPIView):
    serializer_class = serializers.UserDetailSerializer  # Update to appropriate serializer

    def get(self, request, user_email):
        user = get_object_or_404(Utilisateur, email=user_email)
        serializer = self.serializer_class(instance=user, context={'request': request})
        return Response(serializer.data, status=status.HTTP_200_OK)

    def put(self, request, user_email):
        user = get_object_or_404(Utilisateur, email=user_email)
        # Update only the email field
        serializer = self.serializer_class(instance=user, data=request.data, partial=True)
        if serializer.is_valid():
            serializer.save()
            return Response(data=serializer.data, status=status.HTTP_200_OK)
        return Response(data=serializer.errors, status=status.HTTP_400_BAD_REQUEST)

