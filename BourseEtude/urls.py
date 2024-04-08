from django.urls import path
from . import views


urlpatterns = [
    path('',views.BourseEtudeListView.as_view(),name='BourseEtude_list'),
    path('<int:bourse_id>/',views.BourseEtudeDetailView.as_view(),name="get detail bourse")
]