import os
import sys
import os.path

sys.stdout = sys.stderr

# *** Code from http://code.google.com/p/modwsgi/wiki/VirtualEnvironments to enable virtualenv site-packages ***

ALLDIRS = ['/Users/ershadul/Sites/python/virtualenvs/djangocms/lib/python2.7/site-packages']

#import sys
import site

# Remember original sys.path.
prev_sys_path = list(sys.path)

# Add each new site-packages directory.
for directory in ALLDIRS:
  site.addsitedir(directory)

# Reorder sys.path so new directories at the front.
new_sys_path = []
for item in list(sys.path):
    if item not in prev_sys_path:
        new_sys_path.append(item)
        sys.path.remove(item)
sys.path[:0] = new_sys_path

# *** end of code ***
sys.path.insert(0, '/Users/ershadul/Sites/python/bticltd')
os.environ['DJANGO_SETTINGS_MODULE'] = 'settings'
os.environ['PYTHON_EGG_CACHE'] = '/Users/ershadul/Sites/python/bticltd/.pycache'

import django.core.handlers.wsgi
application = django.core.handlers.wsgi.WSGIHandler()
