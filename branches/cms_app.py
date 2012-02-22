from django.utils.translation import ugettext_lazy as _
from cms.app_base import CMSApp
from cms.apphook_pool import apphook_pool

class BranchApp(CMSApp):
    name = _('Branch App')
    urls = ['branches.urls']
    menus = []

apphook_pool.register(BranchApp)