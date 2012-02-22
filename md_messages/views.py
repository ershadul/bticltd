from django import http
from django.conf import settings
from django.template import loader, Context, RequestContext
from django.template.loader import render_to_string
from django.http import HttpResponse, HttpResponseRedirect
from django.shortcuts import render_to_response, get_object_or_404
from django.http import Http404
from django.core.paginator import Paginator, InvalidPage, EmptyPage
from django.utils.translation import ugettext_lazy  as _

from md_messages.models import Message

def index(request):
    page = None
    pagesize = 5
    page_number = request.GET.get('page', '1')
    try:
        page_number = int(page_number)
        if page_number < 1:
            raise Exception
    except:
        page_number = 1

    message_list = Message.objects.filter(is_published=True).all()
    paginator = Paginator(message_list, pagesize)
    try:
        page = paginator.page(page_number)
    except (EmptyPage, InvalidPage):
        page = paginator.page(paginator.num_pages)

    params = {
        'page': page
    }
    context = RequestContext(request, params)
    return render_to_response('md_messages/index.html', context)

def show_message(request, msg_id):
    message = Message.objects.get(pk=msg_id)
    params = {
        'message': message
    }
    context = RequestContext(request, params)
    return render_to_response('md_messages/show_message.html', context)