# -*- coding: utf-8 -*-
import os
gettext = lambda s: s
PROJECT_PATH = os.path.abspath(os.path.dirname(__file__))

# Django settings for concord project.

DEBUG = True
TEMPLATE_DEBUG = DEBUG

ADMINS = (
    # ('Your Name', 'your_email@domain.com'),
)

MANAGERS = ADMINS

DATABASES = {
    'default': {
        'ENGINE': 'django.db.backends.mysql', # Add 'postgresql_psycopg2', 'postgresql', 'mysql', 'sqlite3' or 'oracle'.
        'NAME': 'bticltd',                      # Or path to database file if using sqlite3.
        'USER': 'root',                      # Not used with sqlite3.
        'PASSWORD': '',                  # Not used with sqlite3.
        'HOST': '',                      # Set to empty string for localhost. Not used with sqlite3.
        'PORT': '',                      # Set to empty string for default. Not used with sqlite3.
    }
}

# Local time zone for this installation. Choices can be found here:
# http://en.wikipedia.org/wiki/List_of_tz_zones_by_name
# although not all choices may be available on all operating systems.
# On Unix systems, a value of None will cause Django to use the same
# timezone as the operating system.
# If running in a Windows environment this must be set to the same as your
# system time zone.
TIME_ZONE = 'America/Chicago'

# Language code for this installation. All choices can be found here:
# http://www.i18nguy.com/unicode/language-identifiers.html
LANGUAGE_CODE = 'en'

SITE_ID = 1

# If you set this to False, Django will make some optimizations so as not
# to load the internationalization machinery.
USE_I18N = True

# If you set this to False, Django will not format dates, numbers and
# calendars according to the current locale
USE_L10N = True

# Absolute filesystem path to the directory that will hold user-uploaded files.
# Example: "/home/media/media.lawrence.com/"
MEDIA_ROOT = os.path.join(PROJECT_PATH, "media")
STATIC_ROOT = MEDIA_ROOT
# URL that handles the media served from MEDIA_ROOT. Make sure to use a
# trailing slash if there is a path component (optional in other cases).
# Examples: "http://media.lawrence.com", "http://example.com/media/"
MEDIA_URL = '/media/'
STATIC_URL = MEDIA_URL
# URL prefix for admin media -- CSS, JavaScript and images. Make sure to use a
# trailing slash.
# Examples: "http://foo.com/media/", "/media/".
ADMIN_MEDIA_PREFIX = '/media/admin/'

# Make this unique, and don't share it with anybody.
SECRET_KEY = '0i2&e2w))1@f=csdfdsfdr#okv^7q%o^yf+sdkfsd78w789749%^*&*__))()(h34jk5h43jkh5j34kh5jk40&*&*^z==(kc'

# List of callables that know how to import templates from various sources.
TEMPLATE_LOADERS = (
    'django.template.loaders.filesystem.Loader',
    'django.template.loaders.app_directories.Loader',
#     'django.template.loaders.eggs.Loader',
)

MIDDLEWARE_CLASSES = (
    'django.middleware.common.CommonMiddleware',
    'django.contrib.sessions.middleware.SessionMiddleware',
    'django.middleware.csrf.CsrfViewMiddleware',
    'django.contrib.auth.middleware.AuthenticationMiddleware',
    'django.contrib.messages.middleware.MessageMiddleware',
    
    #'middleware.DefaultLanguageMiddleware',
    'cms.middleware.page.CurrentPageMiddleware',
    'cms.middleware.user.CurrentUserMiddleware',
    #'cms.middleware.toolbar.ToolbarMiddleware',
    'cms.middleware.media.PlaceholderMediaMiddleware',
    'middleware.PDFHttpResponse',
    'cms.middleware.multilingual.MultilingualURLMiddleware',
)

ROOT_URLCONF = 'urls'

TEMPLATE_DIRS = (
    # Put strings here, like "/home/html/django_templates" or "C:/www/django/templates".
    # Always use forward slashes, even on Windows.
    # Don't forget to use absolute paths, not relative paths.
	os.path.join(PROJECT_PATH, "templates"),
)

INSTALLED_APPS = (
    'django.contrib.auth',
    'django.contrib.contenttypes',
    'django.contrib.sessions',
    'django.contrib.sites',
    'django.contrib.messages',
    # Uncomment the next line to enable the admin:
    'django.contrib.admin',
    # Uncomment the next line to enable admin documentation:
    # 'django.contrib.admindocs',
    'filebrowser',
    'tinymce',
	'mptt',
	'menus',
	'south',
	#'appmedia',
	'sorl.thumbnail',
    'cms',
    'cms.plugins.file',
    'cms.plugins.googlemap',
    'cms.plugins.link',
    'cms.plugins.picture',
    'cms.plugins.text',
    'cms.plugins.video',
    'haystack',
    'cms_search',

    'news',
    'md_messages',
    'contacts',
    'about_us',
    'branches',
    'banners',
    'sister_concerns',
    'search',
)

TEMPLATE_CONTEXT_PROCESSORS = (
    'django.core.context_processors.auth',
    'django.core.context_processors.i18n',
    'django.core.context_processors.request',
    'django.core.context_processors.media',
    'cms.context_processors.media',
    'multilingual.context_processors.multilingual',
)

# Project settings
LANGUAGES = (
	('en', gettext('English')),
    ('bn', gettext('Bengali')),
)
CMS_LANGUAGES = LANGUAGES
DEFAULT_LANGUAGE = 0

CMS_TEMPLATES = (
    ('index.html', 'Home Page'),
    ('about_us/about_us.html', 'About Us Page'),
    ('flatpage.html', 'Flat Page'),
    ('two_column_flatpage.html', 'Two column Flat Page'),
    ('news/news_page_layout.html', 'News Room Page'),
    ('sister_concerns/sister_concern_layout.html', 'Sister Concerns Page'),
)

CMS_USE_TINYMCE = True

TINYMCE_JS_URL = '/media/js/tiny_mce/tiny_mce.js'

TINYMCE_DEFAULT_CONFIG = {
    'plugins': "table,paste,searchreplace,advimage,advlink,fullscreen,visualchars,preview,media,directionality,contextmenu,directionality",
    'theme_advanced_path_location' : "bottom",
    'theme_advanced_buttons1' : "fullscreen,separator,preview,separator,media,cut,copy,paste,separator,undo,redo,separator,search,separator,ltr,rtl,separator,replace,separator,code,separator,cleanup,separator,bold,italic,underline,strikethrough,separator,forecolor,backcolor,separator,justifyleft,justifycenter,justifyright,justifyfull,separator,help",
    'theme_advanced_buttons2' : "removeformat,styleselect,formatselect,fontselect,fontsizeselect,separator,bullist,numlist,outdent,indent,separator,link,unlink,anchor",
    'theme_advanced_buttons3' : "sub,sup,separator,image,insertdate,inserttime,separator,tablecontrols,separator,hr,advhr,visualaid,separator,charmap,emotions,iespell,flash,separator,print",
    'mode': 'textareas',
    'theme': 'advanced',
    'theme_advanced_toolbar_location': 'top',
    'theme_advanced_toolbar_align': "left",
    'advimage_update_dimensions_onchange': True,
    'browsers': 'gecko',
    'dialog_type': 'modal',
    'object_resizing': True,
    'cleanup_on_startup': True,
    'remove_trailing_nbsp': True,
    'width': '100%',
    'height': '350',
    'forced_root_block': False
}

FILEBROWSER_MEDIA_URL = '/media/'
FILEBROWSER_URL_FILEBROWSER_MEDIA = '/media/filebrowser/'
FILEBROWSER_URL_TINYMCE = "/media/js/tiny_mce/"
FILEBROWSER_PATH_TINYMCE = "js/tiny_mce/"

# Search Configuration
HAYSTACK_SITECONF = 'search.search_sites'
HAYSTACK_SEARCH_ENGINE = 'whoosh'
HAYSTACK_WHOOSH_PATH = os.path.join(PROJECT_PATH, 'whoosh/')

# Email settings
#EMAIL_USE_TLS = True
#EMAIL_HOST = 'smtp.gmail.com'
#EMAIL_HOST_USER = 'concord.outdoor@gmail.com'
#EMAIL_HOST_PASSWORD = 'concord123'
#EMAIL_PORT = 587
#DEFAULT_FROM_EMAIL = 'concord-outdoor.com <concord.outdoor@gmail.com>'

GEOIP_PATH = os.path.join(PROJECT_PATH, "bin")

THUMBNAIL_DEBUG = True

try:
    from local_settings import *
except Exception, e:
    pass