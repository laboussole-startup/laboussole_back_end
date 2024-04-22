from django.shortcuts import render, get_object_or_404
from .models import Faculte
from . import serializers
from rest_framework import generics,status
from rest_framework.response import Response
from rest_framework.permissions import IsAuthenticated,IsAuthenticatedOrReadOnly
from django.db.models import F, Q, Sum, Case, When, Value, IntegerField
from django.db.models.functions import Length
from rest_framework.pagination import PageNumberPagination

# Create your views here.

class FaculteListView(generics.GenericAPIView):

    serializer_class = serializers.FaculteCreationSerializer

    queryset = Faculte.objects.all()

    permission_classes = [IsAuthenticatedOrReadOnly]

    def get_queryset(self):
        queryset = Faculte.objects.all()
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

class EcoleRecommendationsView(generics.GenericAPIView):

    permission_classes = [IsAuthenticatedOrReadOnly]

    serializer_class = serializers.FaculteCreationSerializer

    queryset = Faculte.objects.all()

    pagination_class = PageNumberPagination

    def get_queryset(self):
        queryset = Faculte.objects.all()
        search_query = self.request.query_params.get('search', None)
        if search_query:
            search_query = search_query.strip()
            conditions = Q()
            for word in search_query.split():
                conditions |= (
                    Q(nom__unaccent__icontains=word) |
                    Q(descriptif__unaccent__icontains=word)
                )
            queryset = queryset.filter(conditions)
            queryset = queryset.annotate(
                nom_word_count=Sum(
                    Case(
                        When(nom__unaccent__icontains=word, then=Value(1)),
                        default=Value(0),
                        output_field=IntegerField(),
                    )
                ),
                description_word_count=Sum(
                    Case(
                        When(descriptif__unaccent__icontains=word, then=Value(1)),
                        default=Value(0),
                        output_field=IntegerField(),
                    )
                )
            )
            queryset = queryset.annotate(
                total_word_count=F('nom_word_count') + F('description_word_count')
            )
            queryset = queryset.order_by(
                '-total_word_count',  # Sort by the total aggregated word count in descending order
                'nom'  # Secondary sorting by another field, e.g., 'nom'
            )
        else:
            queryset = queryset.order_by('nom')  # If search parameter is None, order by ascending order of nom field
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
        
