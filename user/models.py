from django.db import models

# Create your models here.
class UserAccount(models.Model):
    Uid=models.AutoField(max_length = 4, primary_key = True)
    Uname=models.CharField(max_length=30)
    Uaccount=models.CharField(max_length=30)
    Upass=models.CharField(max_length=30)

class UserComment(models.Model):
    UBcomment_id=models.AutoField(max_length = 4, primary_key = True)
    UBcomment_date=models.DateTimeField()
    UBcomment=CharFIeld(max_length=200)
    UBcomment_to=models.IntergerField(max_length = 4)
    UBComment_by=models.ForeignKey('UserAccount')
    UBcomment_IP=models.CharField(max_length=50)
    UBcomment_approved=models.BooleanField(default="TRUE")
    UBcomment_parent=models.IntergerField(max_length = 4)


class UserBaseInfo(models.Model):
    UBage=models.IntergerField(max_length=4)
    UBemail=models.CharField(max_length=50)
    UBfriend=models.ForeignKey('UserAccount')
    UBsignature=CharField(max_length=100)
    UBsex=BooleanField()
    UBphone_number=IntergerField(max_length=10)


class News(models.Model):
    Nid = models.AutoField(max_length = 4, primary_key = True)
    Nauthor = models.ForeignKey()
    Ndate = models.DateTimeField()
    Ncontent = models.TextField()
    Ntitle_cn = models.CharField(max_length=60)
    Ntitle_en = models.CharField(max_length=60)
    Nstatus = models.choices('publish','verify','fail')
    Ncomment_status = models.choices('open','close')
    Npost_modified = models.DateTimeField()
    Npost_parent = models.IntergerField(max_length = 4)
    Nlength = models.IntergerField(max_length = 3)
    Ngrade_info = models.CharField(max_length=14)
    Nhas_audio = models.BooleanField(default=True)
    Nhas_video = models.BooleanField(default=False)
    Nsummary = models.TextField()
    Nnum_reviews = models.IntergerField(max_length=4)


class UserNewsMeta(models.Model):
    is_finished = BooleanField(default=False)
    is_liked = BooleanField(default=False)
    is_reviewed = BooleanField(default=False)
    UNM_id = ForeignKey('News')

class Vocabulary(models.Model):
    Voc_id = models.IntergerField(max_length = 4)
    cn_definition = models.CharField(max_length = 80)
    en_definition = models.CharField(max_length = 80)
    content = models.CharField(max_length = 30)
    content_type = models.choices('vocabulary','phrase')
    uk_audio = models.URLField()
    us_audio = models.URLField()

class ExmSentence(models.Model):
    ES_id = models.AutoField(max_length,primary_key=True)
    ES_sen = models.TextField()
    ES_definition = models.TextField()
    ES_voc_id = models.ForeignKey('Vocabulary')


