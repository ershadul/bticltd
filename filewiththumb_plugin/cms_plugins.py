from cms.plugin_pool import plugin_pool
from cms.plugin_base import CMSPluginBase
from django.utils.translation import ugettext_lazy as _
from filewiththumb_plugin.models import FileWithThumb
from django.conf import settings

class FileWithThumbPlugin(CMSPluginBase):
    model = FileWithThumb
    name = _("FileWithThumb")
    render_template = "filewiththumb_plugin/file_with_thumb.html"
    text_enabled = True
    
    def render(self, context, instance, placeholder):  
        instance.title = settings.dbgettext(instance.title)
        context.update({
            'object':instance, 
            'placeholder':placeholder
        })    
        return context

    def icon_src(self, instance):
        file_icon = instance.get_icon_url()
        if file_icon: return file_icon
        return settings.CMS_MEDIA_URL + u"images/plugins/file.png"
    
plugin_pool.register_plugin(FileWithThumbPlugin)
