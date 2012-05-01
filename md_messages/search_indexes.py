from haystack.indexes import *
from haystack import site

from md_messages.models import Message

class MessageIndex(SearchIndex):
    text = CharField(document=True, use_template=True)

site.register(Message, MessageIndex)