from django.shortcuts import render, get_object_or_404
from .models import Universite
from . import serializers
from rest_framework import generics,status
from rest_framework.response import Response
from rest_framework.permissions import IsAuthenticated,IsAuthenticatedOrReadOnly
from django.db.models import Q, Sum, Case, When, Value, IntegerField
from django.db.models.functions import Length

# Create your views here.

class UniversiteListView(generics.GenericAPIView):

    serializer_class = serializers.UniversiteCreationSerializer

    queryset = Universite.objects.all()

    permission_classes = [IsAuthenticatedOrReadOnly]


    def get_queryset(self):
        queryset = Universite.objects.all()
        search_query = self.request.query_params.get('search', None)
        if search_query:
            # Create a Q object to combine multiple OR conditions
            conditions = Q()
            for word in search_query.split():
                # Add OR condition for each word in the search query
                conditions |= Q(nom__unaccent__icontains=word)
            # Apply the filter
            queryset = queryset.filter(conditions)
            # Annotate queryset with count of words from search query found in nom field
            queryset = queryset.annotate(
                word_count=Sum(
                    Case(
                        *[When(nom__unaccent__icontains=word, then=Value(1)) for word in search_query.split()],
                        default=Value(0),
                        output_field=IntegerField(),
                    )
                )
            )
            # Sort the queryset by the number of words found in descending order
            queryset = queryset.order_by('-word_count', 'nom')
        else:
            # If search parameter is None, order by ascending order of nom field
            queryset = queryset.order_by('nom')
        return queryset

    def get(self,request):

        queryset = self.get_queryset()
        queryset = self.filter_queryset(self.get_queryset())
        universites = Universite.objects.all()

        serializer = self.serializer_class(instance=queryset,many=True)

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
