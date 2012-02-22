from django.conf.urls.defaults import *
from django.conf import settings

urlpatterns = patterns('news.views',
    url(r'^$', 'index'),
    url(r'^id/(?P<news_id>\d+)/', 'show_news'),
)