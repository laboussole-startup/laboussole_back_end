from django.urls import path
from . import views

urlpatterns = [
    path('',views.ActualitListView.as_view(),name='Actualite_list'),
    path('<int:Actualit_id>/',views.ActualitDetailView.as_view(),name="get detail actualite"),
]