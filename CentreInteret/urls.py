from django.urls import path
from . import views

urlpatterns = [
    path('',views.CentreInteretListView.as_view(),name='CentreInteret_list'),
    path('<int:interet_id>/',views.CentreInteretDetailView.as_view(),name="get detail Centre Interet")
]

