from django.contrib import auth
from django.shortcuts import render

# Create your views here.
from rest_framework.views import APIView

from utils.views import Result


class Login(APIView):
    def get(self, request):
        data = request.query_params
        return Result.success_response(data='非法的方法')

    def post(self, request):
        data = request.data

        user_obj = auth.authenticate(user_name=data['username'], password=data['password'])
        if user_obj:
            return Result.success_response(data='登录成功')
        else:
            return Result.success_response(data='登录失败')

    def put(self, request):
        data = request.data.copy()
        return Result.success_response(data='非法的方法')

    def delete(self, request):
        data = request.data
        return Result.success_response(data='非法的方法')
