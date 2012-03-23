from django.contrib import admin
from multilingual.admin import MultilingualModelAdmin

from news.models import News, Photo, Video

class NewsAdmin(MultilingualModelAdmin):
    list_display = ('title', 'is_published', 'show_on_homepage', 'sort_order',)
    list_editable = ('sort_order', 'is_published', 'show_on_homepage',)
    
class VideoAdmin(MultilingualModelAdmin):
    list_display = ('title', 'sort_order',)
    list_editable = ('sort_order',)

class PhotoAdmin(MultilingualModelAdmin):
    list_display = ('title', 'sort_order',)
    list_editable = ('sort_order',)

admin.site.register(News, NewsAdmin)
admin.site.register(Photo, PhotoAdmin)
admin.site.register(Video, VideoAdmin)