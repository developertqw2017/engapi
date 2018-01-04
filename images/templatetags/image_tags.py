#!/usr/bin/env python3
from django.template import Library
from django.utils import timezone

register = Library()


@register.filter
def mod(value, mod_num):
    return value % mod_num


@register.filter
def since(value):
    minutes = (timezone.now() - value).total_seconds() // 60
    if minutes > 60:
        return "{}小时 {}分钟".format(int(minutes//60), int(minutes%60))
    return "{} 分钟".format(int(minutes))
