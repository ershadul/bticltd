from django.conf.urls.defaults import *
from django.conf import settings

from contacts.views import *

urlpatterns = patterns('',
    url(r'^$', contact_us, name='contact-us'),
)