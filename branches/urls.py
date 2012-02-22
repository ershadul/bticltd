from django.conf.urls.defaults import *
from django.conf import settings

urlpatterns = patterns('branches.views',
    url(r'^$', 'index'),
)