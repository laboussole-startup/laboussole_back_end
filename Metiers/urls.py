from django.urls import path
from . import views


urlpatterns = [
    path('',views.MetiersListView.as_view(),name='metier list view'),
    path('<int:metier_id>/',views.MetiersDetailView.as_view(),name='metier detail view'),
    path('reccomendations/',views.MetierRecommendationsView.as_view(),name='metier recommend view'),
    path('debouches/<str:faculte_id>/', views.FacultesDebouchesView.as_view(), name='debouches_view'),
    path('debouches/<str:filiere_id>/', views.FilieresDebouchesView.as_view(), name='debouches_view'),

]
