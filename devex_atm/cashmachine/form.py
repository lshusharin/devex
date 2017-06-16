from django import forms


class CardNumberForm(forms.Form):

    card_number = forms.CharField(widget=forms.TextInput(attrs={"class": "form-control", 'id':'idcardnum', "placeholder": "Card Number", "maxlength":"19", 'autofocus': '', 'readonly':'readonly',}))

class PasswordForm(forms.Form):

    passwd = forms.CharField(widget=forms.PasswordInput(attrs={"class": "form-control", 'id':'idpasswd', "placeholder": "Password",  'autofocus': '', 'readonly':'readonly', }))

class PayoutForm(forms.Form):

    amount = forms.CharField(widget=forms.TextInput(attrs={"class": "form-control", 'id':'idpayout', "placeholder": "Enter amount",  'autofocus': '', 'readonly':'readonly', }))