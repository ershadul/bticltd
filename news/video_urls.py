from django.conf.urls.defaults import *
from django.conf import settings

urlpatterns = patterns('news.views',
    url(r'^$', 'videos'),
)