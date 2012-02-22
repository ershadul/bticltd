from django.utils.translation import ugettext_lazy as _
from cms.app_base import CMSApp
from cms.apphook_pool import apphook_pool

class MDMessageApp(CMSApp):
    name = _('MD Messages')
    urls = ['md_messages.urls']
    menus = []

apphook_pool.register(MDMessageApp)