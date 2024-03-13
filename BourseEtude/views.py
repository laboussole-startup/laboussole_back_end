from django.shortcuts import render, get_object_or_404
from .models import BourseEtude
from . import serializers
from rest_framework import generics,status
from rest_framework.response import Response
from rest_framework.permissions import IsAuthenticated,IsAuthenticatedOrReadOnly

# Create your views here.

class BourseEtudeListView(generics.GenericAPIView):

    serializer_class = serializers.BourseEtudeCreationSerializer

    queryset = BourseEtude.objects.all()

    #permission_classes = [IsAuthenticated]

    def get(self,request):

        bourses = BourseEtude.objects.all()

        serializer = self.serializer_class(instance=bourses,many=True)

        return Response(data=serializer.data,status=status.HTTP_200_OK)
        

    def post(self,request):

        data = request.data

        serializer = self.serializer_class(data=data)

        user = request.user

        if serializer.is_valid():

            serializer.save()

            return Response(data=serializer.data,status=status.HTTP_201_CREATED)

        return Response(data=serializer.errors,status=status.HTTP_400_BAD_REQUEST)


class BourseEtudeDetailView(generics.GenericAPIView):

    #permission_classes = [IsAuthenticatedOrReadOnly]

    serializer_class = serializers.BourseEtudeCreationSerializer

    def get(self,request,bourse_id):
        
        bourse = get_object_or_404(BourseEtude,pk=bourse_id)

        serializer = self.serializer_class(instance=bourse)

        return Response(data=serializer.data,status=status.HTTP_200_OK)

    def put(self,request,bourse_id):

        data = request.data

        Bourse = get_object_or_404(BourseEtude,pk=bourse_id)

        serializer = self.serializer_class(data=data,instance=Bourse)

        if serializer.is_valid():

            serializer.save()

            return Response(data=serializer.data,status=status.HTTP_200_OK)

        return Response(data=serializer.errors,status=status.HTTP_400_BAD_REQUEST)


    def delete(self,request,bourse_id):
        
        Bourse = get_object_or_404(BourseEtude,pk=bourse_id)

        Bourse.delete()

        return Response(status=status.HTTP_204_NO_CONTENT)