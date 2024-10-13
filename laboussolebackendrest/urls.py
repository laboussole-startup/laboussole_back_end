
from django.contrib import admin
from django.urls import path,include
from django.urls import path
from rest_framework import permissions
from drf_yasg.views import get_schema_view
from drf_yasg import openapi
from django.conf import settings
from django.conf.urls.static import static

schema_view = get_schema_view(
   openapi.Info(
      title="LABOUSSOLE BACKEND REST API",
      default_version='v1',
      description="This is the api used for implementing backend in LABOUSSOLE Web App",
      terms_of_service="https://www.google.com/policies/terms/",
      contact=openapi.Contact(email="abengaristide@gmail.com"),
      license=openapi.License(name="BSD License"),
   ),
   public=True,
   permission_classes=(permissions.AllowAny,),
)

urlpatterns = [
    path('admin/', admin.site.urls),
    path('auth/',include('authentication.urls')),
    path('auth/',include('djoser.urls.jwt')),
    path('bourses/',include('BourseEtude.urls')),
    path('centres_interet/',include('CentreInteret.urls')),
    path('facultes/',include('Faculte.urls')),
    path('actualites/',include('actualites.urls')),
    path('notifications/',include('notification.urls')),
    path('filieres/',include('Filieres.urls')),
    path('historique_recherches/',include('historiqueRecherches.urls')),
    path('metiers/',include('Metiers.urls')),
    path('temoignages/',include('Temoignage.urls')),
    path('universites/',include('Universite.urls')),
    path('expert/',include('experts.urls')),
    path('consultation/',include('consultations.urls')),
    path('files/',include('file_upload.urls')),
    path('swagger<format>/', schema_view.without_ui(cache_timeout=0), name='schema-json'),
    path('docs/', schema_view.with_ui('swagger', cache_timeout=0), name='schema-swagger-ui'),
    path('redoc/', schema_view.with_ui('redoc', cache_timeout=0), name='schema-redoc'),
]+static(settings.MEDIA_URL,
                          document_root=settings.MEDIA_ROOT)
