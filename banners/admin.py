from django.contrib import admin

from multilingual.admin import MultilingualModelAdmin

from banners.models import Banner

class BannerAdmin(MultilingualModelAdmin):
    list_display = ('title', 'url', 'sort_order',)
    list_editable = ('sort_order',)

admin.site.register(Banner, BannerAdmin)