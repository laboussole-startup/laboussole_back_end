from . import views

from django.urls import path



urlpatterns= [
    path('',views.UniversiteListView.as_view(),name='Universite list view'),
    path('<int:universite_id>/',views.UniversiteDetailView.as_view(),name='Universite detail view')
]