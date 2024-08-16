from django.urls import path
from . import views

urlpatterns = [
    path('',views.ConsultationListView.as_view(),name='Consultation_list'),
    path('<int:Consultation_id>/',views.ConsultationDetailView.as_view(),name="get detail consultation7"),
]