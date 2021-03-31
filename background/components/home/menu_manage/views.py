# Create your views here.
from django.db.models import Q
from django.forms import model_to_dict
from rest_framework.views import APIView
from components.models import SysMenu
from general.Transform import list_to_tree
from utils.views import Result

class MenuManage(APIView):
    def get(self, request):
        data = request.query_params

        sys_menu = SysMenu.objects.filter(~Q(statu=0)).values()

        sys_menu_data = list(sys_menu)

        data = list_to_tree(sys_menu_data)

        return Result.success_response(data=data, msg='菜单加载成功')
