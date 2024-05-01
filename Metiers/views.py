from django.shortcuts import render, get_object_or_404
from .models import Metiers
from . import serializers
from rest_framework import generics,status
from rest_framework.response import Response
from rest_framework.permissions import IsAuthenticated,IsAuthenticatedOrReadOnly
from rest_framework.pagination import PageNumberPagination
from django.db.models import Q, Value
from django.db.models.functions import Length
from django.db.models import F,  Q, Sum, Case, When, Value, IntegerField
from unidecode import unidecode



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
            search_query = search_query.strip()
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


class MetierRecommendationsView(generics.GenericAPIView):

    permission_classes = [IsAuthenticatedOrReadOnly]

    serializer_class = serializers.MetiersCreationSerializer

    queryset = Metiers.objects.all()

    pagination_class = PageNumberPagination

    def get_queryset(self):
        queryset = Metiers.objects.all()
        search_query = self.request.query_params.get('search', None)
        if search_query:
            search_query = search_query.strip()
            conditions = Q()
            for word in search_query.split():
                conditions |= (
                    Q(nom__unaccent__icontains=word) |
                    Q(description__unaccent__icontains=word) |
                    Q(competencescles__unaccent__icontains=word) |
                    Q(principales_missions__unaccent__icontains=word)
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
                        When(description__unaccent__icontains=word, then=Value(1)),
                        default=Value(0),
                        output_field=IntegerField(),
                    )
                ),
                competencescles_word_count=Sum(
                    Case(
                        When(competencescles__unaccent__icontains=word, then=Value(1)),
                        default=Value(0),
                        output_field=IntegerField(),
                    )
                ),
                principales_missions_word_count=Sum(
                    Case(
                        When(principales_missions__unaccent__icontains=word, then=Value(1)),
                        default=Value(0),
                        output_field=IntegerField(),
                    )
                )
            )
            queryset = queryset.annotate(
                total_word_count=F('nom_word_count') + F('description_word_count') + F('competencescles_word_count') + F('principales_missions_word_count')
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



class DebouchesView(generics.GenericAPIView):

    permission_classes = [IsAuthenticatedOrReadOnly]

    serializer_class = serializers.MetiersCreationSerializer

    queryset = Metiers.objects.all()

    pagination_class = PageNumberPagination

    def get_queryset(self):

        faculte_id = self.kwargs.get('faculte_id')
        # Split faculte_id into individual words
        faculte_words = faculte_id.split()

        # Create a Q object to combine queries for each word using OR operator
        query = Q()
        for word in faculte_words:
            query |= Q(faculte__icontains=', ' + word + ',') | Q(faculte__startswith=word + ',') | Q(faculte_startswith='{' + word + ',') | Q(faculte__endswith=', ' + word) | Q(faculte__endswith=', '+word+'}') | Q(faculte__icontains='{' + word + '}')

        # Filter Metiers objects where any word in faculte_id is contained in the faculte field
        return Metiers.objects.filter(query)

    def get(self, request, *args, **kwargs):
        queryset = self.get_queryset()
        page = self.paginate_queryset(queryset)

        if page is not None:
            serializer = self.get_serializer(page, many=True)
            return self.get_paginated_response(serializer.data)

        serializer = self.get_serializer(queryset, many=True)

        return Response(serializer.data, status=status.HTTP_200_OK)
        

