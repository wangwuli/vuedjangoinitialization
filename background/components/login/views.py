from django.contrib import auth
from django.shortcuts import render

# Create your views here.
from rest_framework.views import APIView
from rest_framework_simplejwt.authentication import JWTAuthentication
from rest_framework_simplejwt.exceptions import InvalidToken, AuthenticationFailed

from background.utils.views import Result

from django.utils.translation import gettext_lazy as _
from rest_framework_simplejwt.serializers import TokenObtainPairSerializer
from rest_framework_simplejwt.views import TokenObtainPairView

from user_account.models import UserInfo


class MyTokenObtainPairSerializer(TokenObtainPairSerializer):
    def validate(self, attrs):
        data = super().validate(attrs)
        refresh = self.get_token(self.user)
        data['refresh'] = str(refresh)
        data['access'] =  'Bearer ' + str(refresh.access_token)

        # Add extra responses here
        data['userinfo'] = {
            'username': self.user.user_name,
            'nick': self.user.nick
        }
        # data['groups'] = self.user.groups.values_list('name', flat=True)

        result = {"success": True, "data": data, "msg": "登录成功"}

        return result


class MyTokenObtainPairView(TokenObtainPairView):
    serializer_class = MyTokenObtainPairSerializer


#https://blog.csdn.net/tlju_xiao_ma/article/details/114182293

# class Login(APIView):
#     def get(self, request):
#         data = request.query_params
#         return Result.success_response(data='非法的方法')
#
#     def post(self, request):
#         data = request.data
#
#         user_obj = auth.authenticate(user_name=data['username'], password=data['password'])
#         if user_obj:
#             return Result.success_response(data='登录成功')
#         else:
#             return Result.success_response(data='登录失败')
#
#     def put(self, request):
#         data = request.data.copy()
#         return Result.success_response(data='非法的方法')
#
#     def delete(self, request):
#         data = request.data
#         return Result.success_response(data='非法的方法')
