from PIL import Image

from django.db import models
from django.utils.translation import ugettext_lazy  as _
from multilingual.translation import Translation as TranslationBase
from multilingual.exceptions import TranslationDoesNotExist
from multilingual.manager import MultilingualManager
#from tinymce.models import HTMLField


class Banner(models.Model):
    image = models.ImageField(verbose_name=_('Image'), upload_to='uploads/images/banners')
    url = models.CharField(_('Url'), max_length=200, blank=True, null=True)
    sort_order = models.IntegerField(default=1)
    creation_at = models.DateTimeField(_('Date Created'), auto_now_add=True)
    update_at = models.DateTimeField(_('Date updated'), auto_now=True)
    class Translation(TranslationBase):
        title = models.CharField(_('Title'), max_length=255)
        summary = models.TextField(_('Summary'), blank=True, null=True)

    objects = MultilingualManager()

    class Meta:
        verbose_name = _("Banner")
        verbose_name_plural = _("Banners")
        ordering = ('sort_order',)
    
    def get_absolute_url(self):
        if self.url:
            return self.url
        else:
            return '#'
    
    def save(self, width=1000, height=1000):
        super(Banner, self).save()
        if self.image:
            image = Image.open(self.image.path)
            image.thumbnail((width, height), Image.ANTIALIAS)
            image.save(self.image.path)
    
    def __unicode__(self):
        try:
            return unicode(self.title)
        except TranslationDoesNotExist:
            return ''