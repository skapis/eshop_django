from django import template
from .models import ProductCategory

register = template.Library()


@register.inclusion_tag('partials/navbar.html')
def show_categories():
    categories = ProductCategory.objects.all()
    return {
        'categories': categories
    }
