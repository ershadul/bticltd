#!/usr/bin/env python
import os
import sys
import os.path
import site

sys.stdout = sys.stderr

# *** Code from http://code.google.com/p/modwsgi/wiki/VirtualEnvironments to enable virtualenv site-packages ***

# Tell wsgi to add the Python site-packages to its path.
site.addsitedir('/home/ershadul/.virtualenvs/djangocms/lib/python2.7/site-packages')

sys.path.insert(0, '/home/ershadul/webapps/new_bticltd/bticltd')
os.environ['DJANGO_SETTINGS_MODULE'] = 'settings'

activate_this = os.path.expanduser("/home/ershadul/.virtualenvs/djangocms/bin/activate_this.py")
execfile(activate_this, dict(__file__=activate_this))

# Calculate the path based on the location of the WSGI script
project = '/home/username/webapps/new_bticltd/bticltd/'
workspace = os.path.dirname(project)
sys.path.append(workspace)

from django.core.management import execute_manager
try:
    import settings # Assumed to be in the same directory.
except ImportError:
    import sys
    sys.stderr.write("Error: Can't find the file 'settings.py' in the directory containing %r. It appears you've customized things.\nYou'll have to run django-admin.py, passing it your settings module.\n(If the file settings.py does indeed exist, it's causing an ImportError somehow.)\n" % __file__)
    sys.exit(1)

if __name__ == "__main__":
    execute_manager(settings)
