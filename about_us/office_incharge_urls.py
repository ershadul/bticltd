from django.conf.urls.defaults import *
from django.conf import settings

urlpatterns = patterns('about_us.views',
    url(r'^$', 'officeincharge_index'),
    url(r'^id/(?P<employee_id>\d+)/', 'show_employee'),
)