from django.conf.urls.defaults import *
from django.conf import settings

urlpatterns = patterns('md_messages.views',
    url(r'^$', 'index'),
    url(r'^id/(?P<msg_id>\d+)/', 'show_message'),
)