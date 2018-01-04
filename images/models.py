from django.db import models
from django.conf import settings



class Image(models.Model):
    user = models.ForeignKey(settings.AUTH_USER_MODEL,
                             verbose_name="创建者",
                             on_delete=models.CASCADE,
                             related_name="images_created")
    title = models.CharField("标题", max_length=200)
    slug = models.SlugField(max_length=200, blank=True)
    url = models.URLField()
    image = models.ImageField("图片", upload_to="images/%Y/%m/%d")
    description = models.TextField("描述", blank=True)
    created = models.DateField("创建时间", auto_now_add=True, db_index=True)
    users_like = models.ManyToManyField(settings.AUTH_USER_MODEL,
                                        verbose_name="喜爱这张照片的用户",
                                        related_name="images_liked",
                                        blank=True)
    total_likes = models.PositiveIntegerField("点赞数", default=0,
                                              db_index=True)

    def __str__(self):
        return self.title

    class Meta:
        ordering = ("-created",)
        verbose_name = verbose_name_plural = "图片"

    def save(self, *args, **kwargs):
        if not self.slug:
            self.slug = uuslug(self.title, instance=self)
        super().save(*args, **kwargs)

    def get_absolute_url(self):
        return reverse("images:detail", args=(self.id, self.slug))
