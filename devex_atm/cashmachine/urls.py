from django.conf.urls import include, url
from django.conf.urls.static import static
from django.contrib.staticfiles.urls import staticfiles_urlpatterns
from django.conf import settings
from . import views

urlpatterns = [
    url(r'^$', views.card_number, name='card_number'),
    url(r'^passwd/$', views.password, name='password'),
    url(r'^operations/$', views.operations, name='operations'),
    url(r'^balance/$', views.balance, name='balance'),
    url(r'^payout/$', views.payout, name='payout'),
    url(r'^exit/$', views.exit, name='exit')

]