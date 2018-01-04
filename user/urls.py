#!/usr/bin/env python3
from django.conf.urls import url

from django.contrib.auth import views


urlpatterns = [

    # login和logout的urls
    url(r"login/$",
        views.login,
        name="login"),
    url(r"logout/$",
        views.logout,
        name="logout"),
    url(r"^logout-then-login/$",
        views.logout_then_login,
        name="logout_then_login"),

    # 密码修改urls
    url(r"^password-change/$",
        views.password_change,
        name="password_change"),
    url(r"^password-change/done/$",
        views.password_change_done,
        name="password_change_done"),

    # 密码恢复urls
    url(r"password-reset/$",
        views.password_reset,
        name="password_reset"),
    url(r"password-reset/done/$",
        views.password_reset_done,
        name="password_reset_done"),
    url(r"password-reset/confirm/(?P<uidb64>[-\w]+)/(?P<token>[-\w]+)/$",
        views.password_reset_confirm,
        name="password_reset_confirm"),
    url(r"^passoword-reset/complete/$",
        views.password_reset_complete,
        name="password_reset_complete"),
]
