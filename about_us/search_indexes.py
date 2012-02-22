from haystack.indexes import *
from haystack import site

from about_us.models import Employee

class EmployeeIndex(SearchIndex):
    text = CharField(document=True, use_template=True)

site.register(Employee, EmployeeIndex)