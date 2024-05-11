import random
from django.shortcuts import render,get_object_or_404
from .models import Utilisateur
from . import serializers
from rest_framework.views import APIView
from rest_framework import generics,status
from rest_framework.response import Response
from rest_framework.parsers import MultiPartParser,FormParser
from django.contrib.auth.hashers import make_password,check_password
from rest_framework.permissions import IsAuthenticated,IsAuthenticatedOrReadOnly

from django.core.mail import send_mail,EmailMessage

from laboussolebackendrest.settings import EMAIL_HOST_USER

# Create your views here.


class UserCreateView(APIView):

    serializer_class = serializers.UserCreationSerializer
    parser_classes = [FormParser,MultiPartParser]
    

    def post(self,request,format=None):

        data = request.data

        serializer = self.serializer_class(data=data)

        if serializer.is_valid():

            serializer.save()

            return Response(data={"data":serializer.data,"status":201},status=status.HTTP_201_CREATED)

        return Response(data=serializer.errors ,status=status.HTTP_400_BAD_REQUEST)

class UserGetDetailView(generics.GenericAPIView):

    permission_classes = [IsAuthenticated]
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

class RecoverPasswordView(generics.GenericAPIView):

    serializer_class = serializers.PasswordRecoverySerializer  # Update to appropriate serializer

    def get(self, request, user_email):
        user = get_object_or_404(Utilisateur, email=user_email)
        serializer = self.serializer_class(instance=user, context={'request': request})
        subject = "RECUPERATION DE COMPTE"
        random_number = str(random.randint(10000, 99999))

        user.account_verification = make_password(random_number)
        user.save()

        # Concatenate the message with the random number
        message = "CODE DE RECUPERATION --> " + random_number
        send_mail(subject,message,EMAIL_HOST_USER,[user_email],fail_silently=True)
        return Response({"status":"CODE_SENT"}, status=status.HTTP_200_OK)

    def post(self, request,user_email):
        user_email = request.data.get('user_email')
        typed_code = request.data.get('code')
        new_password = request.data.get('new_password')

        # Fetch the user based on the provided email
        user = get_object_or_404(Utilisateur, email=user_email)

        # Retrieve the saved verification code for the user
        saved_code = user.account_verification

        # Check if the typed code matches the saved code
        if check_password(typed_code, saved_code):
            # Code matches, update the user's password
            user.set_password(new_password)
            user.save()
            return Response({"status": "PASSWORD_UPDATED"}, status=status.HTTP_200_OK)
        else:
            # Code doesn't match
            return Response({"status": "CODE_MISMATCH"}, status=status.HTTP_400_BAD_REQUEST)


class ContactUsView(generics.GenericAPIView):

    permission_classes = [IsAuthenticated]
    
    serializer_class = serializers.ContactUsSerializer  # Update to appropriate serializer

    def post(self, request,user_email):
        user_email = request.data.get('user_email')
        message = request.data.get('message')

        # Fetch the user based on the provided email
        user = get_object_or_404(Utilisateur, email=user_email)

        subject = "MESSAGE UTILISATEUR LABOUSSOLE"

        # Concatenate the message with the random number
        message = user_email + "  --> " + message
        send_mail(subject,message,EMAIL_HOST_USER,[EMAIL_HOST_USER],fail_silently=True)
        return Response({"status":"MESSAGE_SENT"}, status=status.HTTP_200_OK)


        



       

