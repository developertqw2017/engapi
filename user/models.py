from django.db import models

# Create your models here.
class UserAccount(models.Model):
    Uid=models.AutoField(primary_key = True)
    Uname=models.CharField(max_length=30)
    Uaccount=models.CharField(max_length=30)
    Upass=models.CharField(max_length=30)

class UserComment(models.Model):
    UBcomment_id=models.AutoField(max_length = 4, primary_key = True)
    UBcomment_date=models.DateTimeField()
    UBcomment=models.CharField(max_length=200)
    UBcomment_to=models.IntegerField(max_length = 4)
    UBComment_by=models.ForeignKey(UserAccount,on_delete=models.CASCADE)
    UBcomment_IP=models.CharField(max_length=50)
    UBcomment_approved=models.BooleanField(default="TRUE")
    UBcomment_parent=models.IntegerField(max_length = 4)


class UserBaseInfo(models.Model):
    UBage=models.IntegerField(max_length=4)
    UBemail=models.CharField(max_length=50)
    UBfriend=models.ForeignKey(UserAccount, on_delete = models.CASCADE)
    UBsignature=models.CharField(max_length=100)
    UBsex=models.BooleanField()
    UBphone_number=models.IntegerField(max_length=10)


class News(models.Model):
    STATUS_CHOICES=(('pub','publish'),('ver','verify'),('f','fail'))
    COMMENT_STATUS_CHOICES=(('o','open'),('c','close'))
    Nid = models.AutoField(max_length = 4, primary_key = True)
    Nauthor = models.ForeignKey(UserBaseInfo, on_delete = models.CASCADE)
    Ndate = models.DateTimeField()
    Ncontent = models.TextField()
    Ntitle_cn = models.CharField(max_length=60)
    Ntitle_en = models.CharField(max_length=60)
    Nstatus = models.CharField(max_length=12,choices = STATUS_CHOICES)
    Ncomment_status = models.CharField(max_length=12,choices = COMMENT_STATUS_CHOICES)
    Npost_modified = models.DateTimeField()
    Npost_parent = models.IntegerField(max_length = 4)
    Nlength = models.IntegerField(max_length = 3)
    Ngrade_info = models.CharField(max_length=14)
    Nhas_audio = models.BooleanField(default=True)
    Nhas_video = models.BooleanField(default=False)
    Nsummary = models.TextField()
    Nnum_reviews = models.IntegerField(max_length=4)


class UserNewsMeta(models.Model):
    is_finished = models.BooleanField(default=False)
    is_liked = models.BooleanField(default=False)
    is_reviewed = models.BooleanField(default=False)
    UNM_id = models.ForeignKey(News, on_delete = models.CASCADE)

class Vocabulary(models.Model):
    CONTENT_TYPE_CHOICES = (('voc','vocabulary'),('ph','phrase'))
    Voc_id = models.IntegerField(max_length = 4)
    cn_definition = models.CharField(max_length = 80)
    en_definition = models.CharField(max_length = 80)
    content = models.CharField(max_length = 30)
    content_type = models.CharField(max_length = 12, choices = CONTENT_TYPE_CHOICES)
    uk_audio = models.URLField()
    us_audio = models.URLField()

class ExmSentence(models.Model):
    ES_id = models.AutoField(primary_key=True)
    ES_sen = models.TextField()
    ES_definition = models.TextField()
    ES_voc_id = models.ForeignKey(Vocabulary, on_delete = models.CASCADE)


