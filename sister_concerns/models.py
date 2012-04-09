# coding: utf-8
from PIL import Image
from django.db import models
from django.utils.translation import ugettext_lazy  as _

from multilingual.translation import Translation as TranslationBase
from multilingual.exceptions import TranslationDoesNotExist
from multilingual.manager import MultilingualManager
from tinymce.models import HTMLField


class SisterConcern(models.Model):
    created_dt = models.DateTimeField(_('Creation date'), auto_now_add=True)
    updated_dt = models.DateTimeField(_('Update date'), auto_now=True)
    sort_order = models.SmallIntegerField(_('Sort order'), default=1, db_index=True)
    logo = models.ImageField(_('Logo'), upload_to='uploads/sister-concerns/images', null=True, blank=True)
    
    class Translation(TranslationBase):
        name = models.CharField(_('Name'), max_length=255)
        slogan = models.CharField(_('Slogan'), max_length=255, blank=True, null=True)
        #description = models.TextField(_('Description'), blank=True, null=True)
        description = HTMLField(_('Description'), blank=True, null=True)

    objects = MultilingualManager()

    class Meta:
        verbose_name = _("Sister Concern")
        verbose_name_plural = _("Sister Concerns")
        ordering = ('sort_order',)
        
    def __unicode__(self):
        try:
            return unicode(self.name)
        except TranslationDoesNotExist:
            return ''
    
    def save(self, width=1000, height=1000):
        super(SisterConcern, self).save()
        if self.logo:
            image = Image.open(self.logo.path)
            image.thumbnail((width, height), Image.ANTIALIAS)
            image.save(self.logo.path)
            
    def get_absolute_url(self):
        return "%s/" % str(self.id)

class Project(models.Model):
    created_at = models.DateTimeField(_('Created at'), auto_now_add=True)
    updated_at = models.DateTimeField(_('Updated at'), auto_now=True)
    sister_concern = models.ForeignKey(SisterConcern)
    sort_order = models.SmallIntegerField(_('Sort order'), default=1, db_index=True)
    show_on_homepage = models.BooleanField(default=True, db_index=True)
    logo = models.ImageField(_('Logo'), upload_to='uploads/sister-concerns/images', null=True, blank=True)

    class Translation(TranslationBase):
        name = models.CharField(_('Name'), max_length=255)
        slogan = models.CharField(_('Slogan'), max_length=255, blank=True, null=True)
        description = HTMLField(_('Description'), blank=True, null=True, default='')
        #description = models.TextField(_('Description'), blank=True, null=True, default='')

    objects = MultilingualManager()

    def save(self, width=200, height=200):
        super(Project, self).save()
        if self.logo:
            image = Image.open(self.logo.path)
            image.thumbnail((width, height), Image.ANTIALIAS)
            image.save(self.logo.path)
    
    def __unicode__(self):
        try:
            return unicode(self.name)
        except TranslationDoesNotExist:
            return ''

    class Meta:
        verbose_name = _("Project")
        verbose_name_plural = _("Projects")
        ordering = ('sort_order',)
        
    def get_absolute_url(self):
        return "%s/projects/%s/" % (str(self.sister_concern.id), str(self.id))
        

class Product(models.Model):
    created_at = models.DateTimeField(_('Created at'), auto_now_add=True)
    updated_at = models.DateTimeField(_('Updated at'), auto_now=True)
    sister_concern = models.ForeignKey(SisterConcern)
    sort_order = models.SmallIntegerField(_('Sort order'), default=1, db_index=True)
    show_on_homepage = models.BooleanField(default=True, db_index=True)
    logo = models.ImageField(_('Logo'), upload_to='uploads/sister-concerns/images', null=True, blank=True)

    class Translation(TranslationBase):
        name = models.CharField(_('Name'), max_length=255)
        slogan = models.CharField(_('Slogan'), max_length=255, blank=True, null=True)
        description = HTMLField(_('Description'), blank=True, null=True, default='')
        #description = models.TextField(_('Description'), blank=True, null=True, default='')

    objects = MultilingualManager()

    def save(self, width=200, height=200):
        super(Product, self).save()
        if self.logo:
            image = Image.open(self.logo.path)
            image.thumbnail((width, height), Image.ANTIALIAS)
            image.save(self.logo.path)

    def __unicode__(self):
        try:
            return unicode(self.name)
        except TranslationDoesNotExist:
            return ''

    class Meta:
        verbose_name = _("Product")
        verbose_name_plural = _("Products")
        ordering = ('sort_order',)
        
    def get_absolute_url(self):
        return "%s/products/%s/" % (str(self.sister_concern.id), str(self.id))
    