import datetime
from PIL import Image
from django.db import models
from django.utils.translation import ugettext_lazy  as _

from multilingual.translation import Translation as TranslationBase
from multilingual.exceptions import TranslationDoesNotExist
from multilingual.manager import MultilingualManager
from tinymce.models import HTMLField

class Location(models.Model):
    created_at = models.DateTimeField(_('Created At'), default=datetime.datetime.now())
    updated_at = models.DateTimeField(_('Updated At'), auto_now=True)
    parent = models.ForeignKey('self', blank=True, null=True, related_name='children')
    sort_order = models.IntegerField(default=1)

    class Translation(TranslationBase):
        name = models.CharField(_('Name'), max_length=255, null=True, blank=True)
    
    objects = MultilingualManager()

    def __unicode__(self):
        try:
            if self.parent:
                return unicode(self.parent) + u' :: ' + unicode(self.name)
            return unicode(self.name)
        except TranslationDoesNotExist:
            return 'Untitled %s' % str(self.id)

    class Meta:
        verbose_name = _("Location")
        verbose_name_plural = _("Locations")
        ordering = ('sort_order',)

class Branch(models.Model):
    created_at = models.DateTimeField(_('Created At'), default=datetime.datetime.now())
    updated_at = models.DateTimeField(_('Updated At'), auto_now=True)
    location = models.ForeignKey(Location)
    sort_order = models.IntegerField(default=1)

    class Translation(TranslationBase):
        name = models.CharField(_('Name'), max_length=255)
        description = models.TextField(_('Description'), null=True, blank=True)
        address = models.TextField(_('Address'), null=True, blank=True)
        contact = models.TextField(_('Contact'), null=True, blank=True)

    objects = MultilingualManager()

    def __unicode__(self):
        try:
            return unicode(self.name)
        except TranslationDoesNotExist:
            return 'Untitled %s' % str(self.id)

    class Meta:
        verbose_name = _("Branch")
        verbose_name_plural = _("Branches")
        ordering = ('sort_order',)