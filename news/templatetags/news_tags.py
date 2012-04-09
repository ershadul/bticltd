from django import template

from news.models import News

register = template.Library()
    
def latest_news(context, template="news/latest_news.html"):
    news_list = News.objects.filter(show_on_homepage=True).all()
    try:
        context.update({
            'news_list': news_list,
            'template': template
        })
    except:
        context = { "template":template }
    return context

latest_news = register.inclusion_tag('cms/dummy.html', 
    takes_context=True)(latest_news)