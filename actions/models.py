from django.db import models
from django.contrib.auth.models import User
from django.contrib.contenttypes.models import ContentType
from django.contrib.contenttypes.fields import GenericForeignKey


class Action(models.Model):
    user = models.ForeignKey(User,
                             related_name="actions",
                             db_index=True,
                             verbose_name="用户",
                             on_delete=models.CASCADE)
    verb = models.CharField("动态描述", max_length=255)
    created = models.DateTimeField("创建时间", auto_now_add=True,
                                   db_index=True)
    target_ct = models.ForeignKey(ContentType,
                                  blank=True, null=True,
                                  related_name="target_obj",
                                  on_delete=models.CASCADE)
    target_id = models.PositiveIntegerField(null=True, blank=True,
                                            db_index=True)
    target = GenericForeignKey("target_ct", "target_id",models.CASCADE)

    class Meta:
        ordering = ("-created",)
        verbose_name = verbose_name_plural = "动态"

    def __str__(self):
        return "{} 的动态".format(self.user)


