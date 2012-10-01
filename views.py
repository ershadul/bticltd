#from django import http
from django.template import RequestContext
from django.http import HttpResponse
from django.shortcuts import render_to_response
#from django.http import Http404


def server_error(request):
    context = RequestContext(request)
    return render_to_response('500.html', context)


def page_not_found(request):
    context = RequestContext(request)
    return render_to_response('404.html', context)


def forbidden(request):
    context = RequestContext(request)
    return render_to_response('403.html', context)


def robots(request):
    return HttpResponse(open('templates/robots.txt').read(), 'text/plain')
