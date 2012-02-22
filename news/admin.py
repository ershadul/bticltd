from django.contrib import admin
from multilingual.admin import MultilingualModelAdmin

from news.models import News

class NewsAdmin(MultilingualModelAdmin):
    list_display = ('title', 'is_published', 'show_on_homepage', 'sort_order',)
    list_editable = ('sort_order', 'is_published', 'show_on_homepage',)

admin.site.register(News, NewsAdmin)