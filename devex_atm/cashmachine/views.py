# -*- coding: utf-8 -*-

from .form import CardNumberForm, PasswordForm, PayoutForm
from .models import Cards, AvailableOperations, OperationsLog
from .decorators import card_is_authenticated

from django.shortcuts import render
from django.http import HttpResponseRedirect
from django.contrib.sessions.models import Session

import hashlib
import datetime


def card_number(request):
    # form initializing
    form = CardNumberForm()
    context = {
        'form': form,
    }

    if request.method == 'POST':

        #checking if card exists and not blocked
        card = Cards.objects.filter(cardnum=request.POST.get('card_number'))
        if card:
            if card[0].is_active:
                request.session['card_num'] = card[0].cardnum

                return HttpResponseRedirect('/passwd/')
            else:
                request.session.flush()
                context['result'] = {'ERROR': 'Sorry, but your card is blocked.'}
                return render(request, 'cashmachine/error.html', context)
        else:

            return render(request, 'cashmachine/login.html', context)

    return render(request, 'cashmachine/login.html', context)


def password(request):
    # form initializing
    form = PasswordForm()
    context = {
        'form': form,
    }

    if request.method == 'POST' and request.session.get('card_num'):
        #checking if password is valid and the amount of tries does not exceed 4
        card = Cards.objects.get(cardnum=request.session['card_num'])
        if card.wrong_pass_counter<4:

            #password check
            request.session['passwd'] = request.POST.get('passwd')
            hash = hashlib.md5(request.session['passwd']).hexdigest()
            if hash == card.password:
                card.wrong_pass_counter = 0
                card.save()

                return HttpResponseRedirect('/operations/')
            else:
                #incrementing wrong-pass counter
                card.wrong_pass_counter = int(card.wrong_pass_counter) + 1

                #blocking if the wrong pass was entered 4 times
                if card.wrong_pass_counter == 4:
                    card.wrong_pass_counter = 0
                    card.is_active = False
                    card.save()
                    context['result'] = {'ERROR': 'You have entered wrong PIN more than 4 times. Card Is Blocked.'}
                    return render(request, 'cashmachine/error.html', context)
                else:
                    card.save()

                context['result']= {'Error':"Wrong password",}
                return render(request, 'cashmachine/passwd.html', context)
        else:
            request.session.flush()
            context['result'] = {'ERROR': 'Sorry, but your card is blocked.'}
            return render(request, 'cashmachine/error.html', context)

    return render(request, 'cashmachine/passwd.html', context)


@card_is_authenticated
def operations(request):
    #returning the operations available int the DB
    operations = {each.id: [each.operation_name, each.operation_url] for each in AvailableOperations.objects.all()}

    context = {'operations':operations}
    return render(request, 'cashmachine/operations.html', context)


@card_is_authenticated
def balance(request):
    #getting the data for log
    card = Cards.objects.get(cardnum=request.session['card_num'])
    balance = AvailableOperations.objects.get(operation_name="Balance")
    #setting the log
    new_entry = OperationsLog(card_id=card, operation_id=balance, )
    new_entry.save()
    context = {
        'result':{
            'CARD': request.session['card_num'],
            'Date': datetime.datetime.now().strftime("%b-%d-%Y"),
            'Balance': card.balance,
        }
    }
    return render(request, 'cashmachine/balance.html', context)


@card_is_authenticated
def payout(request):
    form = PayoutForm()
    context = {}
    if request.method == "POST":
        #checking the balance
        card = Cards.objects.get(cardnum=request.session['card_num'])
        if float(request.POST.get('amount')) > float(card.balance):

            context['result'] = {'ERROR': 'Not enough funds on your card'}
            return render(request, 'cashmachine/error.html', context)
        else:
            card.balance = float(card.balance) - float(request.POST.get('amount'))
            card.save()

            new_entry = OperationsLog(card_id=Cards.objects.get(cardnum=request.session['card_num']),
                                      operation_id=AvailableOperations.objects.get(operation_name="Cash"), payout= request.POST.get('amount') )
            new_entry.save()

            context['result'] = {'CARD': card.cardnum, 'Time': datetime.datetime.now().strftime("%H:%M:%S,%b-%d-%Y"), 'Amount': float(request.POST.get('amount')),
                                 'Balance': card.balance}

            return render(request, 'cashmachine/result.html', context)
    context['form'] = form
    return render(request, 'cashmachine/payout.html', context)


def exit(request):
    #exitting and deleting all session data
    form = CardNumberForm()
    context = {
        'form': form,
    }

    request.session.flush()
    return render(request, 'cashmachine/login.html', context)