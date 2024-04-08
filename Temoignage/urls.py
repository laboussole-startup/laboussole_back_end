from . import views
from django.urls import path



urlpatterns=[
    path('',views.TemoignageListView.as_view(),name='temoignage list view'),
    path('<int:temoignage_id>/',views.TemoignageDetailView.as_view(),name='temoignage detail view')
]