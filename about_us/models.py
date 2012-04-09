import datetime
from PIL import Image
from django.db import models
from django.utils.translation import ugettext_lazy  as _

from multilingual.translation import Translation as TranslationBase
from multilingual.exceptions import TranslationDoesNotExist
from multilingual.manager import MultilingualManager
from tinymce.models import HTMLField

class Employee(models.Model):
    EMPLOYEE_TYPES = (
        ('advisor', _('Advisor')),
        ('director', _('director')),
        ('executive', _('Executive')),
        ('zonal-incharge', _('Zonal Incharge')),
        ('office-incharge', _('Office Incharge')),
    )
    employee_type = models.CharField(max_length=75, choices=EMPLOYEE_TYPES, db_index=True)
    created_at = models.DateTimeField(_('Created At'), default=datetime.datetime.now())
    updated_at = models.DateTimeField(_('Updated At'), auto_now=True)
    image = models.ImageField(_('Image'), upload_to='uploads/about_us/images/', null=True, blank=True)
    sort_order = models.IntegerField(default=1, null=True, blank=True)
    email = models.EmailField(blank=True, null=True)


    class Translation(TranslationBase):
        name = models.CharField(_('Name'), max_length=255)
        tag_line = models.CharField(_('Tag Line'), max_length=75, null=True, blank=True)
        contact_number = models.CharField(_('Contact Numbers'), max_length=255, null=True, blank=True)
        tag_line = models.CharField(_('Tag Line'), max_length=75, null=True, blank=True)
        designation = models.CharField(_('Designation'), max_length=75, null=True, blank=True)
        description = models.TextField(_('Description'), null=True, blank=True)
    
    objects = MultilingualManager()

    def __unicode__(self):
        try:
            return unicode(self.name)
        except TranslationDoesNotExist:
            return 'Unnamed %s' % str(self.id)

    def save(self, width=1000, height=1000):
        super(Employee, self).save()
        if self.image:
            image = Image.open(self.image.path)
            image.thumbnail((width, height), Image.ANTIALIAS)
            image.save(self.image.path)

    def has_image(self):
        if self.image or self.image_url:
            return True
        return False

    def get_image(self):
        if self.image:
            return self.image
        elif self.image_url:
            return self.image_url
        return ''

    def get_image_url(self):
        if self.image:
            return self.image.url
        elif self.image_url:
            return self.image_url
        return ''

    def get_absolute_url(self):
        return 'id/%s' % str(self.id)

    class Meta:
        verbose_name = _("Employee")
        verbose_name_plural = _("Employees")
        ordering = ('sort_order',)