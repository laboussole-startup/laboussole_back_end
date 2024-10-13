# views.py
from rest_framework import status
from rest_framework.response import Response
from rest_framework.views import APIView
from django.core.files.storage import default_storage
from .serializers import FileUploadSerializer

class FileUploadView(APIView):
    def post(self, request):

        
        user = request.user

        # Check if the authenticated user is an admin
        if not user.is_staff:
            return Response({"error": "Only admin users can perform this action"}, status=status.HTTP_403_FORBIDDEN)

        serializer = FileUploadSerializer(data=request.data)
        if serializer.is_valid():
            file = serializer.validated_data['file']
            # Save the file
            file_name = default_storage.save(file.name, file)
            # Generate the file URL
            file_url = default_storage.url(file_name)
            return Response({'url': file_url}, status=status.HTTP_201_CREATED)
        return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)
