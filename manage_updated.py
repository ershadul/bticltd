#!/usr/bin/env python
import os
import sys
import os.path

sys.stdout = sys.stderr

# *** Code from http://code.google.com/p/modwsgi/wiki/VirtualEnvironments to enable virtualenv site-packages ***

ALLDIRS = ['/home/concord/Envs/local125/lib/python2.6/site-packages']

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

sys.path.insert(0, '/home/concord')
sys.path.insert(0, '/home/concord/concord')
os.environ['DJANGO_SETTINGS_MODULE'] = 'settings'
os.environ['PYTHON_EGG_CACHE'] = '/home/concord/.pycache'

from django.core.management import execute_manager
try:
    import settings # Assumed to be in the same directory.
except ImportError:
    import sys
    sys.stderr.write("Error: Can't find the file 'settings.py' in the directory containing %r. It appears you've customized things.\nYou'll have to run django-admin.py, passing it your settings module.\n(If the file settings.py does indeed exist, it's causing an ImportError somehow.)\n" % __file__)
    sys.exit(1)

if __name__ == "__main__":
    execute_manager(settings)
