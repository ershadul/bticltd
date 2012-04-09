# sister_concerns/cms_app.py
from django.utils.translation import ugettext_lazy as _
from cms.app_base import CMSApp
from cms.apphook_pool import apphook_pool

class SisterConcernApp(CMSApp):
    name = _('Sister Concerns App')
    urls = ['sister_concerns.urls']
    menus = []
apphook_pool.register(SisterConcernApp)