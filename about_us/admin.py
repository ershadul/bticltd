from django.contrib import admin
from multilingual.admin import MultilingualModelAdmin

from about_us.models import Employee

class EmployeeAdmin(MultilingualModelAdmin):
    list_display = ('name', 'employee_type', 'sort_order',)
    list_editable = ('sort_order',)
    list_filter = ('employee_type',)

admin.site.register(Employee, EmployeeAdmin)