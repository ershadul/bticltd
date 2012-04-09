from django.contrib import admin

from multilingual.admin import MultilingualModelAdmin

from sister_concerns.models import *

class SisterConcernAdmin(MultilingualModelAdmin):
    list_display = ('name', 'sort_order',)
    list_editable = ('sort_order',)

admin.site.register(SisterConcern, SisterConcernAdmin)

class ProjectAdmin(MultilingualModelAdmin):
    list_display = ('sister_concern', 'name', 'show_on_homepage', 'sort_order',)
    list_editable = ('sort_order', 'show_on_homepage',)

admin.site.register(Project, ProjectAdmin)

admin.site.register(Product, ProjectAdmin)