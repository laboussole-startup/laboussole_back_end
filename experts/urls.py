from django.urls import path
from . import views

urlpatterns = [
    path('',views.ExpertListView.as_view(),name='Expert_list'),
    path('<int:expert_id>/',views.ExpertDetailView.as_view(),name="get detail expert"),
]

