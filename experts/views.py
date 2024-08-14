
from django.shortcuts import render, get_object_or_404
from .models import Experts
from . import serializers
from rest_framework import generics, status
from rest_framework.response import Response
from rest_framework.permissions import IsAuthenticated, IsAuthenticatedOrReadOnly

class ExpertListView(generics.GenericAPIView):
    serializer_class = serializers.ExpertCreationSerializer
    queryset = Experts.objects.all()
    permission_classes = [IsAuthenticatedOrReadOnly]

    def get(self, request):
        queryset = self.filter_queryset(self.queryset)
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


class ExpertDetailView(generics.GenericAPIView):
    permission_classes = [IsAuthenticatedOrReadOnly]
    serializer_class = serializers.ExpertCreationSerializer

    def get(self, request, expert_id):
        expert = get_object_or_404(Experts, pk=expert_id)
        serializer = self.serializer_class(instance=expert)
        return Response(data=serializer.data, status=status.HTTP_200_OK)

    def put(self, request, expert_id):
        data = request.data
        user = request.user

        # Check if the authenticated user is an admin
        if not user.is_staff:
            return Response({"error": "Only admin users can perform this action"}, status=status.HTTP_403_FORBIDDEN)

        expert = get_object_or_404(Experts, pk=expert_id)
        serializer = self.serializer_class(data=data, instance=expert)

        if serializer.is_valid():
            serializer.save()
            return Response(data=serializer.data, status=status.HTTP_200_OK)

        return Response(data=serializer.errors, status=status.HTTP_400_BAD_REQUEST)

    def delete(self, request, expert_id):
        user = request.user

        # Check if the authenticated user is an admin
        if not user.is_staff:
            return Response({"error": "Only admin users can perform this action"}, status=status.HTTP_403_FORBIDDEN)

        expert = get_object_or_404(Experts, pk=expert_id)
        expert.delete()
        return Response(status=status.HTTP_204_NO_CONTENT)
