from django.urls import path
from . import views

urlpatterns = [
    path('',views.FaculteListView.as_view(),name='Faculte_list'),
    path('<int:faculte_id>/',views.FaculteDetailView.as_view(),name="get detail faculte"),
    path('universites/<int:universite_id>/',views.UniversityFacultiesView.as_view(),name="get faculties of given university")
]

