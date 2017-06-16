from django.core.exceptions import PermissionDenied
from .models import Cards

import hashlib

def card_is_authenticated(function):
    def wrap(request):
        card = Cards.objects.filter(cardnum=request.session.get('card_num'))

        if card and request.session.get('passwd') and card[0].password == hashlib.md5(request.session.get('passwd')).hexdigest():
            return function(request)
        else:
            raise PermissionDenied
    wrap.__doc__ = function.__doc__
    wrap.__name__ = function.__name__
    return wrap