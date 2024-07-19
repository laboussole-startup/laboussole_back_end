from django.shortcuts import render

# Create your views here.
from django.shortcuts import render, get_object_or_404
from .models import Notification
from . import serializers
from rest_framework import generics,status
from rest_framework.response import Response
from rest_framework.permissions import IsAuthenticated,IsAuthenticatedOrReadOnly
from django.db.models import Q, Sum, Case, When, Value, IntegerField
from django.db.models.functions import Length

# Create your views here.

class NotificationListView(generics.GenericAPIView):

    serializer_class = serializers.NotificationCreationSerializer

    queryset = Notification.objects.all()

    permission_classes = [IsAuthenticatedOrReadOnly]

    def get_queryset(self):
        queryset = Notification.objects.all()
        search_query = self.request.query_params.get('search', None)
        if search_query:
            # Split the search query into individual words
            search_words = search_query.split()
            # Create a Q object to combine multiple OR conditions
            conditions = Q()
            for word in search_words:
                # Add OR condition for each word in the search query
                conditions |= Q(titre__unaccent__icontains=word)
            # Apply the filter
            queryset = queryset.filter(conditions)
            # Annotate queryset with count of words from search query found in nom field
            queryset = queryset.annotate(
                word_count=Sum(
                    Case(
                        *[When(titre__unaccent__icontains=word, then=Value(1)) for word in search_words],
                        default=Value(0),
                        output_field=IntegerField(),
                    )
                )
            )
            # Sort the queryset by the number of words found in descending order
            queryset = queryset.order_by('-word_count', 'titre')
        else:
            # If search parameter is None, order by ascending order of nom field
            queryset = queryset.order_by('date')
        return queryset

    def get(self,request):

        queryset = self.get_queryset()
        queryset = self.filter_queryset(self.get_queryset())

        serializer = self.serializer_class(instance=queryset,many=True)

        return Response(data=serializer.data,status=status.HTTP_200_OK)


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


class NotificationDetailView(generics.GenericAPIView):

    permission_classes = [IsAuthenticatedOrReadOnly]

    serializer_class = serializers.NotificationCreationSerializer

    def get(self,request,Notification_id):

        notification = get_object_or_404(Notification,pk=Notification_id)

        serializer = self.serializer_class(instance=notification)

        return Response(data=serializer.data,status=status.HTTP_200_OK)

    def put(self,request,Notification_id):

        data = request.data

        user = request.user

        # Check if the authenticated user is an admin
        if not user.is_staff:
            return Response({"error": "Only admin users can perform this action"}, status=status.HTTP_403_FORBIDDEN)

        notification = get_object_or_404(Notification,pk=Notification_id)

        serializer = self.serializer_class(data=data,instance=notification)

        if serializer.is_valid():

            serializer.save()

            return Response(data=serializer.data,status=status.HTTP_200_OK)

        return Response(data=serializer.errors,status=status.HTTP_400_BAD_REQUEST)


    def delete(self,request,Notification_id):

        user = request.user

        # Check if the authenticated user is an admin
        if not user.is_staff:
            return Response({"error": "Only admin users can perform this action"}, status=status.HTTP_403_FORBIDDEN)

        notification = get_object_or_404(Notification,pk=Notification_id)

        notification.delete()

        return Response(status=status.HTTP_204_NO_CONTENT)

