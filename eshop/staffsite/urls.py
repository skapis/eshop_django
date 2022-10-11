from django.urls import path
from django.views.decorators.csrf import csrf_exempt
from . import views


urlpatterns = [
    path('', views.index, name='staff'),
    path('dashboard/product', views.product_dashboard, name='product_dashboard'),
    path('dashboard/user', views.user_dashboard, name='user_dashboard'),
    path('dashboard/order', views.order_dashboard, name='order_dashboard'),
    path('settings', views.settings_view, name='settings'),
    path('user/<int:user_id>', views.user_detail, name='user_detail'),
    path('access-denied', views.access_denied, name='access_denied'),
    path('new-category', views.add_category, name='add_category'),
    path('new-payment', csrf_exempt(views.add_payment_method), name='add_payment'),
    path('new-shipping', csrf_exempt(views.add_shipping), name='add_shipping'),
    path('new-country', csrf_exempt(views.add_country), name='add_country'),
    path('delete-country/<str:code>', csrf_exempt(views.delete_country), name='delete_country'),
    path('delete-category/<str:category_name>', views.delete_category, name='delete_category'),
    path('edit-category/<str:category_name>', views.edit_category, name='edit_category'),
    path('edit-shipping/<int:shipping_id>', csrf_exempt(views.edit_shipping), name='edit_shipping'),
    path('edit-payment/<int:payment_id>', csrf_exempt(views.edit_payment), name='edit_payment'),
    path('change_currency/<str:code>', views.change_currency, name='change_currency'),
    path('delete-shipping/<int:shipping_id>', views.delete_shipping, name='delete_shipping'),
    path('delete-payment/<int:payment_id>', views.delete_payment, name='delete_payment'),
    path('add-product', views.add_product, name='add_product'),
    path('delete-product/<int:product_id>', views.delete_product, name='delete_product'),
    path('edit-product/<int:product_id>', views.edit_product, name='edit_product'),
    path('hide-product/<int:product_id>', views.hide_product, name='hide_product'),
    path('sales', views.sales, name='sales')
]
