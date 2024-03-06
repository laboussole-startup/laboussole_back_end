from . import views
from django.urls import path


urlpatterns=[
    path('',views.FilieresListView.as_view(),name='filieres list view'),
    path('<int:filiere_id>/',views.FilieresDetailView.as_view(),name='filiere detail view')
]