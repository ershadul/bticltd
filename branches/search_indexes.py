from haystack.indexes import *
from haystack import site

from branches.models import Branch

class BranchIndex(SearchIndex):
    text = CharField(document=True, use_template=True)

site.register(Branch, BranchIndex)