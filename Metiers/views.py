from django.shortcuts import render, get_object_or_404
from .models import Metiers
from . import serializers
from rest_framework import generics,status
from rest_framework.response import Response
from rest_framework.permissions import IsAuthenticated,IsAuthenticatedOrReadOnly
from rest_framework.pagination import PageNumberPagination
from django.db.models import Q, Value
from django.db.models.functions import Length
from django.db.models import Sum, Case, When, Value


# Create your views here.

class MetiersListView(generics.GenericAPIView):

    serializer_class = serializers.MetiersCreationSerializer

    queryset = Metiers.objects.all()

    permission_classes = [IsAuthenticatedOrReadOnly]

    pagination_class = PageNumberPagination

    def get_queryset(self):
        queryset = Metiers.objects.all()
        search_query = self.request.query_params.get('search', None)
        if search_query:
            # Split the search query into individual words
            search_words = search_query.split()
            # Create a Q object to combine multiple OR conditions
            conditions = Q()
            for word in search_words:
                # Add OR condition for each word in the search query
                conditions |= Q(nom__icontains=word)
            # Apply the filter
            queryset = queryset.filter(conditions)
            # Annotate queryset with count of words from search query found in nom field
            queryset = queryset.annotate(
                word_count=Sum(
                    Case(
                        When(
                            *[Q(nom__icontains=word) for word in search_words],
                            then=Value(1),
                        ),
                        default=Value(0),
                        output_field=models.IntegerField(),
                    )
                )
            )
            # Sort the queryset by the number of words found in descending order
            queryset = queryset.order_by('-word_count', 'nom')
        else:
            # If search parameter is None, order by ascending order of nom field
            queryset = queryset.order_by('nom')
        return queryset

    def get(self,request,*args,**kwargs):
        queryset = self.get_queryset()
        queryset = self.filter_queryset(self.get_queryset())
        page = self.paginate_queryset(queryset)  # Paginate the queryset
        if page is not None:
            serializer = self.get_serializer(page, many=True)
            return self.get_paginated_response(serializer.data)
        
        serializer = self.get_serializer(queryset, many=True)
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
