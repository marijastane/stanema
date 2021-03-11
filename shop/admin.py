from django.contrib import admin
from shop.models import Customer, Product, Order


admin.site.register(Customer)
admin.site.register(Product)
admin.site.register(Order)
# Register your models here.
