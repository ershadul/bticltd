from django.utils.translation import ugettext_lazy as _
from cms.app_base import CMSApp
from cms.apphook_pool import apphook_pool

class ContactsApp(CMSApp):
    name = _('Contact Us')
    urls = ['contacts.urls']
    menus = []

apphook_pool.register(ContactsApp)