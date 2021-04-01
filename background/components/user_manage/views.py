from django.shortcuts import render

# Create your views here.
from rest_framework.views import APIView
from django.contrib.auth import get_user_model

from background.utils.views import Result


class Create_user(APIView):
    def post(self, request):
        """
        创建用户
        """
        data = request.data.copy()
        User = get_user_model()
        User.objects.create_user(data)
        return Result.success_response(data='创建成功')

    def put(self, request):
        data = request.data.copy()
        return True

    def delete(self, request):
        data = request.data
        return True
