from django import http
from django.conf import settings
from django.template import loader, Context, RequestContext
from django.template.loader import render_to_string
from django.http import HttpResponse, HttpResponseRedirect
from django.shortcuts import render_to_response, get_object_or_404
from django.http import Http404
from django.core.paginator import Paginator, InvalidPage, EmptyPage
from django.utils.translation import ugettext_lazy  as _

from about_us.models import Employee

def advisor_index(request):
    employees = Employee.objects.filter(employee_type='advisor').all()
    params = {
        'employees': employees
    }
    context = RequestContext(request, params)
    return render_to_response('about_us/advisors.html', context)

def show_employee(request, employee_id):
    employee = Employee.objects.get(pk=employee_id)
    params = {
        'employee': employee
    }
    context = RequestContext(request, params)
    return render_to_response('about_us/show_employee.html', context)

def director_index(request):
    employees = Employee.objects.filter(employee_type='director').all()
    params = {
        'employees': employees
    }
    context = RequestContext(request, params)
    return render_to_response('about_us/directors.html', context)
    
def executive_index(request):
    employees = Employee.objects.filter(employee_type='executive').all()
    params = {
        'employees': employees
    }
    context = RequestContext(request, params)
    return render_to_response('about_us/employee_list.html', context)
    
def officeincharge_index(request):
    employees = Employee.objects.filter(employee_type='office-incharge').all()
    params = {
        'employees': employees
    }
    context = RequestContext(request, params)
    return render_to_response('about_us/employee_list.html', context)
    

def zonalincharge_index(request):
    employees = Employee.objects.filter(employee_type='zonal-incharge').all()
    params = {
        'employees': employees
    }
    context = RequestContext(request, params)
    return render_to_response('about_us/employee_list.html', context)