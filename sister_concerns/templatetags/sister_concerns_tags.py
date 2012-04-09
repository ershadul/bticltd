from django import template

from sister_concerns.models import *

register = template.Library()

def show_sister_concerns_menu(context, template='sister_concerns/sister_concerns_menu.html'):
    try:
        sister_concerns = SisterConcern.objects.all()
        for sc in sister_concerns:
            sc.sub_menu = []
            if sc.project_set.count() > 0:
                menu_item = { 
                    'type': 'projects',
                    'items': sc.project_set.all()
                }
                sc.sub_menu.append(menu_item)
            if sc.product_set.count() > 0:
                menu_item = { 
                    'type': 'products',
                    'items': sc.product_set.all()
                }
                sc.sub_menu.append(menu_item)
    except Exception, e:
        sister_concerns = []

    try:
        context.update({ 'sister_concerns': sister_concerns, 'template': template  })
    except:
        context = { 'template': template }
    return context
show_sister_concerns_menu = register.inclusion_tag('cms/dummy.html', \
    takes_context=True)(show_sister_concerns_menu)


def show_sister_concerns_sidebar_menu(context, template='sister_concerns/sister_concerns_sidebar_menu.html'):
    try:
        sister_concerns = SisterConcern.objects.all()
        for sc in sister_concerns:
            sc.sub_menu = []
            if sc.project_set.count() > 0:
                menu_item = { 
                    'type': 'projects',
                    'items': sc.project_set.all()
                }
                sc.sub_menu.append(menu_item)
            if sc.product_set.count() > 0:
                menu_item = { 
                    'type': 'products',
                    'items': sc.product_set.all()
                }
                sc.sub_menu.append(menu_item)
    except Exception, e:
        sister_concerns = []

    try:
        context.update({ 'sister_concerns': sister_concerns, 'template': template  })
    except:
        context = { 'template': template }
    return context
show_sister_concerns_sidebar_menu = register.inclusion_tag('cms/dummy.html', \
    takes_context=True)(show_sister_concerns_sidebar_menu)
    

def featured_products(context, template="sister_concerns/featured_products.html"):
    projects = Project.objects.filter(show_on_homepage=True).all()
    products = Product.objects.filter(show_on_homepage=True).all()
    try:
        context.update({
            'items': list(projects) + list(products),
            'template': template 
        })
    except:
        context = { "template":template }
    return context

featured_products = register.inclusion_tag('cms/dummy.html', 
    takes_context=True)(featured_products)