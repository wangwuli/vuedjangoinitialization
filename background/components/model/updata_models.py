# -*- coding: utf-8 -*-
# !/usr/bin/env python
import os
try:
    os.system('python ../../manage.py inspectdb > ../models.py')
except:
    os.system('python ../manage.py inspectdb > ../models.py')

print ('更新models.py成功！')
