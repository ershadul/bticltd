from django.utils.translation import ugettext_lazy as _
from cms.app_base import CMSApp
from cms.apphook_pool import apphook_pool

class AdvisorApp(CMSApp):
    name = _('Advisors App')
    urls = ['about_us.advisor_urls']
    menus = []

apphook_pool.register(AdvisorApp)

class DirectorApp(CMSApp):
    name = _('Directors App')
    urls = ['about_us.director_urls']
    menus = []

apphook_pool.register(DirectorApp)

class ExecutiveApp(CMSApp):
    name = _('Executives App')
    urls = ['about_us.executive_urls']
    menus = []

apphook_pool.register(ExecutiveApp)

class OfficeInchargeApp(CMSApp):
    name = _('Office Incharge App')
    urls = ['about_us.office_incharge_urls']
    menus = []

apphook_pool.register(OfficeInchargeApp)

class ZonalInchargeApp(CMSApp):
    name = _('Zonal Incharge App')
    urls = ['about_us.zonal_incharge_urls']
    menus = []

apphook_pool.register(ZonalInchargeApp)