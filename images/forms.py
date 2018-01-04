#!/usr/bin/env python3
from urllib import request

from django import forms
from django.core.files.base import ContentFile

from uuslug import slugify

from .models import Image


class ImageCreateForm(forms.ModelForm):
    class Meta:
        model = Image
        fields = ("title", "url", "description")
        widgets = {
            "url": forms.HiddenInput,
        }

    def clean_url(self):
        url = self.cleaned_data["url"]
        valid_extensions = ["jpg", "jepg", "png", "gif"]
        extension = url.rsplit(".")[-1].lower()
        if extension not in valid_extensions:
            raise forms.ValidationError("图片url后缀非法")
        return url

    def save(self, force_insert=False, force_update=False, commit=True):
        image = super().save(commit=False)
        image_url = self.cleaned_data["url"]    # 和image.url效果一样
        image_name = "{}.{}".format(slugify(image.title),
                                    image_url.rsplit(".", 1)[-1].split("?")[0].lower())

        response = request.urlopen(image_url)
        image.image.save(image_name,
                         ContentFile(response.read()),
                         save=False)
        if commit:
            image.save()
        return image