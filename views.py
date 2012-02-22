from django import http
from django.conf import settings
from django.template import loader, Context, RequestContext
from django.template.loader import render_to_string
from django.http import HttpResponse, HttpResponseRedirect
from django.shortcuts import render_to_response, get_object_or_404
from django.http import Http404

def server_error(request):
    context = RequestContext(request)
    return render_to_response('500.html', context)
    
def page_not_found(request):
    context = RequestContext(request)
    return render_to_response('404.html', context)

def forbidden(request):
    context = RequestContext(request)
    return render_to_response('403.html', context)