# sister_concerns/views.py
from django import http
from django.conf import settings
from django.template import loader, Context, RequestContext
from django.template.loader import render_to_string
from django.http import HttpResponse, HttpResponseRedirect
from django.shortcuts import render_to_response, get_object_or_404
from django.http import Http404
from django.utils.translation import ugettext_lazy  as _

from sister_concerns.models import SisterConcern, Project, Product

def index(request, sc_id=None):
    sister_concern = None
    if sc_id:
        sister_concern = SisterConcern.objects.get(pk=sc_id)
    else:
        if SisterConcern.objects.count() > 0:
            sister_concern = SisterConcern.objects.all()[0:1].get()
    
    params = {
        'sister_concern': sister_concern
    }
    context = RequestContext(request, params)
    return render_to_response('sister_concerns/sc.html', context)
    

def projects(request, sc_id=None):
    sister_concern = None
    if sc_id:
        sister_concern = SisterConcern.objects.get(pk=sc_id)
    else:
        if SisterConcern.objects.count() > 0:
            sister_concern = SisterConcern.objects.all()[0:1].get()

    params = {
        'sister_concern': sister_concern
    }
    context = RequestContext(request, params)
    return render_to_response('sister_concerns/projects.html', context)

def show_project(request, sc_id, p_id):
    sister_concern = None
    if sc_id:
        sister_concern = SisterConcern.objects.get(pk=sc_id)
    else:
        if SisterConcern.objects.count() > 0:
            sister_concern = SisterConcern.objects.all()[0:1].get()
    
    project = Project.objects.get(pk=p_id)
    params = {
        'sister_concern': sister_concern,
        'project': project
    }
    context = RequestContext(request, params)
    return render_to_response('sister_concerns/show_project.html', context)
            
def products(request, sc_id):
    sister_concern = None
    if sc_id:
        sister_concern = SisterConcern.objects.get(pk=sc_id)
    else:
        if SisterConcern.objects.count() > 0:
            sister_concern = SisterConcern.objects.all()[0:1].get()
    params = {
        'sister_concern': sister_concern
    }
    context = RequestContext(request, params)
    return render_to_response('sister_concerns/products.html', context)

def show_product(request, sc_id, p_id):
    sister_concern = None
    if sc_id:
        sister_concern = SisterConcern.objects.get(pk=sc_id)
    else:
        if SisterConcern.objects.count() > 0:
            sister_concern = SisterConcern.objects.all()[0:1].get()
    product = Product.objects.get(pk=p_id)
    params = {
        'sister_concern': sister_concern,
        'product': product
    }
    context = RequestContext(request, params)
    return render_to_response('sister_concerns/show_product.html', context)
