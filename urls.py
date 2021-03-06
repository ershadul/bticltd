from django.conf.urls.defaults import *
from django.contrib import admin
from django.conf import settings

admin.autodiscover()

#handler500 = 'views.server_error'
#handler404 = 'views.page_not_found'
#handler403 = 'views.forbidden'

urlpatterns = patterns('',
    (r'^media/(?P<path>.*)', 'django.views.static.serve', \
        { 'document_root' : settings.MEDIA_ROOT }),
    (r'^admin/filebrowser/', include('filebrowser.urls')),
    (r'^tinymce/', include('tinymce.urls')),
    (r'^admin/cms/page/\s*themes/(?P<path>.*)', \
        'django.views.static.serve', { 'document_root' : settings.MEDIA_ROOT + '/cms/jstree/themes'}),
    (r'^admin/', include(admin.site.urls)),
    (r'^robots\.txt', 'views.robots'),
    (r'^search/', include('haystack.urls')),
    (r'^', include('cms.urls')),
)
