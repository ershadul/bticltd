from PIL import Image
import datetime

from django.db import models
from django.utils.translation import ugettext_lazy  as _
from multilingual.translation import Translation as TranslationBase
from multilingual.exceptions import TranslationDoesNotExist
from multilingual.manager import MultilingualManager
from tinymce.models import HTMLField

class ContactMessage(models.Model):
    name = models.CharField(max_length=255)
    email = models.EmailField()
    company = models.CharField(max_length=255, blank=True, default='')
    message = models.TextField()
    is_read = models.BooleanField(default=False, blank=True)
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)
    
    def __unicode__(self):
        return self.name

    class Meta:
        ordering = ('-created_at',)
    