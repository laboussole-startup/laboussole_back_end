from django.urls import path
from . import views

urlpatterns = [
    path('',views.RecherchesListView.as_view(),name='historique recherches_list'),
    path('<int:recherche_id>/',views.RecherchesDetailView.as_view(),name="get historique recherches")
]

