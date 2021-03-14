from django.shortcuts import HttpResponse, render
from django.contrib.auth.decorators import login_required
from django.template import loader

#@login_required
#def home(request, word="", word1=""):
#    return HttpResponse(f"Home {word} {word1} page!")


def index(request):
    home = "index"
    context = {"index": index}
    return render(request, "index.html", context)
