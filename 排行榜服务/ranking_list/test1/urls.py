from django.urls import path
from . import views
urlpatterns = [
    path('home/', views.home, name='home'),
    path('register/', views.Register.as_view(), name='register'),
    path('login/', views.Login.as_view(), name='login'),
    path('logout/', views.logoutTest, name='logout'),
    path('choose/', views.choose, name='choose'),
    path('create/', views.CreateScore.as_view(), name='create_score'),
    path('search/', views.SearchRanking.as_view(), name='search_ranking'),
]
