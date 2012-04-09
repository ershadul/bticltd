# sister_concerns/urls.py
from django.conf.urls.defaults import *
from django.conf import settings

urlpatterns = patterns('sister_concerns.views',
    url(r'^$', 'index'),
    url(r'^(?P<sc_id>\d+)/$', 'index'),
    url(r'^(?P<sc_id>\d+)/projects/$', 'projects'),
    url(r'^(?P<sc_id>\d+)/products/$', 'products'),
    url(r'^(?P<sc_id>\d+)/projects/(?P<p_id>\d+)/$', 'show_project'),
    url(r'^(?P<sc_id>\d+)/products/(?P<p_id>\d+)/$', 'show_product'),
)