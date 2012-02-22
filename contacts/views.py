from django import http
from django.conf import settings
from django.template import loader, Context, RequestContext
from django.template.loader import render_to_string
from django.http import HttpResponse, HttpResponseRedirect
from django.shortcuts import render_to_response, get_object_or_404
from django.http import Http404
from django.utils.translation import ugettext_lazy  as _

from contacts.forms import MessageForm

def contact_us(request):
    data = {}
    message = None
    params = {}
    
    if request.method == 'POST':
        data = request.POST.copy()
        form = MessageForm(data)
        if form.is_valid():
            try:
                form.save()
                message = _('Thanks! Your comment has been saved successfully.')
            except Exception, e:
                # Log error
                pass
    else:
        form = MessageForm()

    params = { 'data': data,
               'form': form,
               'message': message
    }
    context = RequestContext(request, params)
    
    return render_to_response('contacts/contact.html', context)