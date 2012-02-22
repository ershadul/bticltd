from django.contrib import admin
from multilingual.admin import MultilingualModelAdmin

from branches.models import Location, Branch

class LocationAdmin(MultilingualModelAdmin):
    list_display = ('name', 'parent', 'sort_order',)
    list_editable = ('sort_order',)

class BranchAdmin(MultilingualModelAdmin):
    list_display = ('name', 'location', 'sort_order',)
    list_editable = ('sort_order',)

admin.site.register(Location, LocationAdmin)
admin.site.register(Branch, BranchAdmin)