from . import views
from django.urls import path


urlpatterns=[
    path('',views.FilieresListView.as_view(),name='filieres list view'),
    path('<int:filiere_id>/',views.FilieresDetailView.as_view(),name='filiere detail view'),
    path('faculte/<int:faculte_id>/',views.FacultesFilieresView.as_view(),name='filieres of a specific faculte'),
    path('faculte/<int:faculte_id>/<int:duree_cycle>/',views.FilieresPerCycleView.as_view(),name='filieres of a faculte for a given cycle')
]