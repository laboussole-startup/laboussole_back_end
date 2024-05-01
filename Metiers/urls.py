from django.urls import path
from . import views


urlpatterns = [
    path('',views.MetiersListView.as_view(),name='metier list view'),
    path('<int:metier_id>/',views.MetiersDetailView.as_view(),name='metier detail view'),
    path('reccomendations/',views.MetierRecommendationsView.as_view(),name='metier recommend view'),
    path('facultesdebouches/<str:faculte_id>/', views.FacultesDebouchesView.as_view(), name='debouches_view'),
    path('filieresdebouches/<str:filiere_id>/', views.FilieresDebouchesView.as_view(), name='debouches_view'),

]
