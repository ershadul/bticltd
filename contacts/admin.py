from django.contrib import admin

from multilingual.admin import MultilingualModelAdmin

from contacts.models import ContactMessage

admin.site.register(ContactMessage)