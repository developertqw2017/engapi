#!/usr/bin/env python3
from django.contrib.auth.models import User


class EmailAuthBackend:

    def authenticate(self, username=None, password=None):
        try:
            user = User.object.get(email=username)
            if user.check_password(password):
                return user
            return None
        except User.DoesNotExist:
            return None

    def get_user(self, user_id):
        try:
            return User.objects.get(pk=user_id)
        except User.DoesNotExist:
            return None