#!/usr/bin/env python3
from django.apps import AppConfig

class ImagesConfig(AppConfig):
    name = "images"
    verbose_name = verbose_name_plural = "图片书签"

    def ready(self):
        from . import signals