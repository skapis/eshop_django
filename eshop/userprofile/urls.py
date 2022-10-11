from django.urls import path
from . import views
from django.views.decorators.csrf import csrf_exempt

urlpatterns = [
    path('', views.account, name='account'),
    path('edit', views.edit_account, name='edit_account'),
    path('edit-address/<uuid:address_id>', views.edit_address, name='edit_address'),
    path('add-address', views.add_address, name='add_address'),
    path('change-primary/<uuid:address_id>', views.change_to_primary, name='change_primary'),
    path('delete-address/<uuid:address_id>', views.delete_address, name='delete_address')
]
