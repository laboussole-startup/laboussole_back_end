
from django.shortcuts import render, get_object_or_404
from .models import Consultation
from . import serializers
from rest_framework import generics, status
from rest_framework.response import Response
from rest_framework.permissions import IsAuthenticated, IsAuthenticatedOrReadOnly

class ConsultationListView(generics.GenericAPIView):
    serializer_class = serializers.ConsultationCreationSerializer
    permission_classes = [IsAuthenticatedOrReadOnly]

    def get_queryset(self):
        return Consultation.objects.all()

    def get(self, request):
        queryset = self.get_queryset()
        queryset = self.filter_queryset(queryset)
        serializer = self.serializer_class(instance=queryset, many=True)
        return Response(data=serializer.data, status=status.HTTP_200_OK)

    def post(self, request):
        data = request.data
        user = request.user

        # Check if the authenticated user is an admin
        if not user.is_staff:
            return Response({"error": "Only admin users can perform this action"}, status=status.HTTP_403_FORBIDDEN)

        serializer = self.serializer_class(data=data)
        if serializer.is_valid():
            serializer.save()
            return Response(data=serializer.data, status=status.HTTP_201_CREATED)

        return Response(data=serializer.errors, status=status.HTTP_400_BAD_REQUEST)


class ConsultationDetailView(generics.GenericAPIView):
    permission_classes = [IsAuthenticatedOrReadOnly]
    serializer_class = serializers.ConsultationCreationSerializer

    def get(self, request, Consultation_id):
        consultation = get_object_or_404(Consultation, pk=Consultation_id)
        serializer = self.serializer_class(instance=consultation)
        return Response(data=serializer.data, status=status.HTTP_200_OK)

    def put(self, request, Consultation_id):
        data = request.data
        user = request.user

        # Check if the authenticated user is an admin
        if not user.is_staff:
            return Response({"error": "Only admin users can perform this action"}, status=status.HTTP_403_FORBIDDEN)

        consultation = get_object_or_404(Consultation, pk=Consultation_id)
        serializer = self.serializer_class(data=data, instance=consultation,partial=True)

        if serializer.is_valid():
            serializer.save()
            return Response(data=serializer.data, status=status.HTTP_200_OK)

        return Response(data=serializer.errors, status=status.HTTP_400_BAD_REQUEST)

    def delete(self, request, Consultation_id):
        user = request.user

        # Check if the authenticated user is an admin
        if not user.is_staff:
            return Response({"error": "Only admin users can perform this action"}, status=status.HTTP_403_FORBIDDEN)

        consultation = get_object_or_404(Consultation, pk=Consultation_id)
        consultation.delete()
        return Response(status=status.HTTP_204_NO_CONTENT)
