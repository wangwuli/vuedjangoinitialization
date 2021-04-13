"""main URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/1.10/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  url(r'^$', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  url(r'^$', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.conf.urls import url, include
    2. Add a URL to urlpatterns:  url(r'^blog/', include('blog.urls'))
"""
from django.conf.urls import url
# from django.contrib import admin
from django.urls import path

from components.home.menu_manage.views import MenuManage
from components.login.views import Login
from components.user_manage.views import Create_user
from rest_framework_simplejwt.views import TokenObtainPairView, TokenRefreshView

urlpatterns = [
    # url(r'^admin/', admin.site.urls),
    url(r'^background/login$', Login.as_view()),
    url(r'^background/create_user$', Create_user.as_view()),
    url(r'^background/home/menu_manage$', MenuManage.as_view()),
    path('login/', TokenObtainPairView.as_view(), name='token_obtain_pair'),  # 登录一般是login
    path('api/token/refresh/', TokenRefreshView.as_view(), name='token_refresh'),  # simplejwt认证接口
]
