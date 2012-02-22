from django.template import loader, Context, RequestContext
from django.shortcuts import render_to_response, get_object_or_404
from django.utils.translation import ugettext_lazy  as _

from branches.models import Location

def index(request):
    locations = Location.objects.filter(parent=None).all()
    params = {
        'locations': locations
    }
    context = RequestContext(request, params)
    return render_to_response('branches/index.html', context)