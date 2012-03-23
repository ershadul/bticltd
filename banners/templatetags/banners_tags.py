from django import template

from banners.models import Banner

register = template.Library()
    
def banner_slideshow(context, template="banners/slideshow.html"):
    photos = Banner.objects.all()
    try:
        context.update({
            'photos': photos,
            'template':template
        })
    except:
        context = {"template":template}
    return context

banner_slideshow = register.inclusion_tag('cms/dummy.html', takes_context=True)(banner_slideshow)