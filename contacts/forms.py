from django import forms

from contacts.models import ContactMessage

class MessageForm(forms.ModelForm):
    class Meta:
        model = ContactMessage