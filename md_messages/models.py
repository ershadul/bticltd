import datetime
from PIL import Image
from django.db import models
from django.utils.translation import ugettext_lazy  as _

from multilingual.translation import Translation as TranslationBase
from multilingual.exceptions import TranslationDoesNotExist
from multilingual.manager import MultilingualManager
from tinymce.models import HTMLField

class Message(models.Model):
    created_at = models.DateTimeField(_('Created At'), default=datetime.datetime.now())
    updated_at = models.DateTimeField(_('Updated At'), auto_now=True)
    image = models.ImageField(_('Image File'), upload_to='uploads/news/images/', null=True, blank=True)
    image_url = models.URLField(_('Image URL'), null=True, blank=True)
    video = models.FileField(_('Video File'), upload_to='uploads/news/videos/', null=True, blank=True)
    video_url = models.URLField(_('Video URL'), null=True, blank=True)
    sort_order = models.IntegerField(default=1, null=True, blank=True)
    is_published = models.BooleanField(_('Is Published'), default=False)
    show_on_homepage = models.BooleanField(default=False)

    class Translation(TranslationBase):
        title = models.CharField(_('Title'), max_length=255, null=True, blank=True)
        description = HTMLField(_('Description'), null=True, blank=True)
    
    objects = MultilingualManager()

    def __unicode__(self):
        try:
            return unicode(self.title)
        except TranslationDoesNotExist:
            return 'Untitled %s' % str(self.id)

    def save(self, width=1000, height=1000):
        super(Message, self).save()
        if self.image:
            image = Image.open(self.image.path)
            image.thumbnail((width, height), Image.ANTIALIAS)
            image.save(self.image.path)

    def has_thumbnail(self):
        if self.image or self.image_url:
            return True
        return False

    def get_thumbnail(self):
        if self.image:
            return self.image
        elif self.image_url:
            return self.image_url
        return ''

    def get_thumbnail_url(self):
        if self.image:
            return self.image.url
        elif self.image_url:
            return self.image_url
        return ''

    def has_video(self):
        if self.video or self.video_url:
            return True
        return False

    def get_video(self):
        if self.video:
            return self.video.url
        else:
            return self.video_url

    def get_absolute_url(self):
        return 'id/%s' % str(self.id)

    class Meta:
        verbose_name = _("Managing Director's Message")
        verbose_name_plural = _("Managing Director's Messages ")
        ordering = ('sort_order',)