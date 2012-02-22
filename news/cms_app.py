from django.utils.translation import ugettext_lazy as _
from cms.app_base import CMSApp
from cms.apphook_pool import apphook_pool

class NewsApp(CMSApp):
    name = _('News')
    urls = ['news.urls']
    menus = []

apphook_pool.register(NewsApp)