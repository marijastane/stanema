from django.shortcuts import render
from .models import Customer, Order, Product
from django.views.generic import CreateView, ListView, UpdateView, DeleteView, DetailView
from django.contrib.auth.mixins import PermissionRequiredMixin


class CreateCustomerView(PermissionRequiredMixin, CreateView ):
    model = Customer
    template_name = ""
    from_class = ""
    permission_required = "Customer.add_customer"

# Create your views here.
