from django.contrib import auth
from django.shortcuts import render

# Create your views here.
from rest_framework.views import APIView
from background.utils.views import Result


from rest_framework_simplejwt.serializers import TokenObtainPairSerializer
from rest_framework_simplejwt.views import TokenObtainPairView


class MyTokenObtainPairSerializer(TokenObtainPairSerializer):
    def validate(self, attrs):
        data = super().validate(attrs)
        refresh = self.get_token(self.user)
        data['refresh'] = str(refresh)
        data['access'] =  'JWT ' + str(refresh.access_token)

        # Add extra responses here
        data['username'] = self.user.user_name
        # data['groups'] = self.user.groups.values_list('name', flat=True)

        result = {"success": True, "data": data, "msg": "登录成功"}

        return result


class MyTokenObtainPairView(TokenObtainPairView):
    serializer_class = MyTokenObtainPairSerializer




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
