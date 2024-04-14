from django.urls import path
from . import views

urlpatterns = [
    path('',views.NotificationListView.as_view(),name='Notification_list'),
    path('<int:Notification_id>/',views.NotificationDetailView.as_view(),name="get detail notification"),
]