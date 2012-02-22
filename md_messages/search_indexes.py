from haystack.indexes import *
from haystack import site

from news.models import News

class NewsIndex(SearchIndex):
    text = CharField(document=True, use_template=True)

site.register(News, NewsIndex)