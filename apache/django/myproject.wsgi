import os, sys, site

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

from django.core.handlers.wsgi import WSGIHandler
application = WSGIHandler()