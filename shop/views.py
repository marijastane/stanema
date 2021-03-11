from django.shortcuts import render
from .models import Customer, Order, Product
from django.views.generic import CreateView, ListView, UpdateView, DeleteView, DetailView
from django.contrib.auth.mixins import PermissionRequiredMixin
from django.contrib.auth.views import LoginView


class CreateCustomerView(PermissionRequiredMixin, CreateView):
    model = Customer
    template_name = ""
    from_class = ""
    permission_required = "Customer.add_customer"
    permission_denied_message = "You don't have permission"
    login_url = "shop:login"

class ListCustomerView(ListView):
    model = Customer
    template_name = ""