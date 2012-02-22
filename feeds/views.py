from django.http import *
from django.utils.feedgenerator import Rss201rev2Feed
from django.utils.feedgenerator import Atom1Feed
from django.utils.translation import ugettext_lazy  as _

from publications.models import Publication

def news(request):
    news_list = Publication.objects.filter(pub_type='news').all()[:25]
    feed = Rss201rev2Feed(title=_('CFAAIR News'), 
        link='http:/' + request.get_host(),
        feed_url='http://' + request.get_host() + request.get_full_path(),
        description=''
    )
    for n in news_list:
        if n.description:
            description = n.description
        else:
            description = n.title
        feed.add_item(title=n.title,
            link=u'http://' + request.get_host() + n.get_absolute_url(),
            description=description,
            pubdate=n.creation_dt
        )
    return HttpResponse(feed.writeString('UTF-8'), mimetype='application/rss+xml')

    
