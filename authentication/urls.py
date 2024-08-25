from django.urls import path
from . import views

urlpatterns = [
    path('signup/',views.UserCreateView.as_view(),name='signup view'),
    path('<user_email>/', views.UserGetDetailView.as_view(), name='get_detail_user'),
    path('recover/<user_email>/',views.RecoverPasswordView.as_view(),name='recover'),
    path('contact/<user_email>/',views.ContactUsView.as_view(),name='contact us'),
    path('user/username/<int:user_id>/', views.GetUsernameByIdView.as_view(), name='get-username-by-id')
]