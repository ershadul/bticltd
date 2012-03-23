from django import http
import urllib, urlparse
from django.conf import settings
from django.template import loader, Context, RequestContext
from django.template.loader import render_to_string
from django.http import HttpResponse, HttpResponseRedirect
from django.shortcuts import render_to_response, get_object_or_404
from django.http import Http404
from django.core.paginator import Paginator, InvalidPage, EmptyPage
from django.utils.translation import ugettext_lazy  as _

from news.models import News, Photo, Video

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

    news_list = News.objects.filter(is_published=True).all()
    paginator = Paginator(news_list, pagesize)
    try:
        page = paginator.page(page_number)
    except (EmptyPage, InvalidPage):
        page = paginator.page(paginator.num_pages)

    params = {
        'page': page
    }
    context = RequestContext(request, params)
    return render_to_response('news/index.html', context)

def show_news(request, news_id):
    news_obj = News.objects.get(pk=news_id)
    params = {
        'news_obj': news_obj
    }
    context = RequestContext(request, params)
    return render_to_response('news/show_news.html', context)
    
def images(request):
    page = None
    pagesize = 12
    page_number = request.GET.get('page', '1')
    try:
        page_number = int(page_number)
        if page_number < 1:
            raise Exception
    except:
        page_number = 1
    
    photo_set = Photo.objects.all()
    paginator = Paginator(photo_set, pagesize)
    try:
        page = paginator.page(page_number)
    except (EmptyPage, InvalidPage):
        page = paginator.page(paginator.num_pages)
    
    params = {
        'page': page
    }
    context = RequestContext(request, params)

    return render_to_response('news/image_gallery.html', context)

def videos(request):
    page = None
    pagesize = 12
    page_number = request.GET.get('page', '1')
    try:
        page_number = int(page_number)
        if page_number < 1:
            raise Exception
    except:
        page_number = 1

    video_list = Video.objects.all()
    paginator = Paginator(video_list, pagesize)
    try:
        page = paginator.page(page_number)
    except (EmptyPage, InvalidPage):
        page = paginator.page(paginator.num_pages)

    if page.object_list:
        for video in page.object_list:
            if not video.get_thumbnail() and video.video_url:
                result = urlparse.urlparse(video.video_url)
                data = urlparse.parse_qs(result.query)
                if data.has_key('v'):
                    video.youtube_thumbnail = \
                        'http://img.youtube.com/vi/%s/1.jpg' % data['v'][0]

    params = {
        'page': page
    }

    context = RequestContext(request, params)

    return render_to_response('news/video_gallery.html', context)