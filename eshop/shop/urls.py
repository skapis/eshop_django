from django.urls import path
from . import views
from .views import ProductPage, Cart, CategoryPage

urlpatterns = [
    path('', ProductPage.as_view(), name='home'),
    path('add/<int:product_id>', views.add_to_cart, name='add_to_cart'),
    path('delete/<uuid:cart_id>', views.delete_from_cart, name='delete_from_cart'),
    path('delete-cart', views.delete_cart_all, name='delete_cart_all'),
    path('cart', Cart.as_view(), name='cart'),
    path('update/<uuid:cart_id>/<int:qty>', views.update_cart, name='update'),
    path('product/<int:product_id>', views.product_detail, name='product_detail'),
    path('category/<str:category_name>', CategoryPage.as_view() , name='category'),
    path('cart-total', views.cart_sub_total, name='cart_total'),
    path('order/create', views.create_order, name='create_order'),
    path('order/<uuid:order_id>', views.order_confirm, name='order_confirm'),
    path('order-cancel/<uuid:order_id>', views.cancel_order, name='order_cancel'),
    path('order/<uuid:order_id>/success', views.order_success, name='order_success'),
    path('order-detail/<uuid:order_id>', views.order_detail, name='order_detail'),
    path('search', views.search_products, name='search')
]