from django.shortcuts import render
from django.http import HttpResponse
from user.models import UserAccount,UserComment,UserBaseInfo,News,UserNewsMeta,Vocabulary,ExmSentence
from datetime import date,datetime
import json
import urllib
# Create your views here.

def index(request):
    return HttpResponse("这里是emoji英语学习！")
#@Uid 用户名唯一id
def showUserBaseInfo(request, Uid):
    Uid = urllib.parse.unquote(Uid)
    UBinfo = UserBaseInfo.objects.get(UBid = Uid)
    UBinfo.__delattr__('_state')
    resp = json.dumps(UBinfo.__dict__)
    return HttpResponse(resp)

#@Comid 评论唯一id
def showComment(request, Comid):
    Comid = urllib.parse.unquote(Comid)
    UComment = UserComment.objects.get(UBcomment_id = Comid)
    UComment.__delattr__('_state')
    resp = json.dumps(UComment.__dict__)
    return HttpResponse(resp)

#@Nid 新闻唯一id
def showNews(request, Nid):
    Nid = urllib.parse.unquote(Nid)
    Ncontent = News.objects.get(Nid = Nid)
    Ncontent.__delattr__('_state')
    resp = json.dumps(Ncontent.__dict__)
    return HttpResponse(resp)

#@Nauthor 新闻作者
def showNews_by_author(request, Nauthor):
    Nauthor = urllib.parse.unquote(Nauthor)
    Ncontent = News.objects.get(Nauthor = Nauthor)
    Ncontent.__delattr__('_state')
    resp = json.dumps(Ncontent.__dict__)
    return HttpResponse(resp)

#@Ntitle_cn 新闻中文标题
def showNews_by_title_cn(request, Ntitle_cn):
    Ntitle_cn = urllib.parse.unquote(Ntitle_cn)
    Ncontent = News.objects.get(Ntitle_cn = Ntitle_cn)
    Ncontent.__delattr__('_state')
    resp = json.dumps(Ncontent.__dict__)
    return HttpResponse(resp)

#@Ntitle_en 新闻英文标题
def showNews_by_title_en(request, Ntitle_en):
    Ntitle_en = urllib.parse.unquote(Ntitle_en)
    Ncontent = News.objects.get(Ntitle_en = Ntitle_en)
    Ncontent.__delattr__('_state')
    resp = json.dumps(Ncontent.__dict__)
    return HttpResponse(resp)

#@wordset 单词设置表单
def updateWordSet(request):
    if request.method == 'POST':
    	wordset = request.POST['wordset']
#        WordSet.objects.filter(WS_id = wordset.WS_id).update(WS_voc_book = wordset.WS_voc_book, WS_pronunciation = wordset.WS_pronunciation, WS_tranlate_en = wordset.WS_translate_En, WS_translate_cn = WS_translate_Cn, WS_voc_auto_pron = wordset.WS_voc_auto_pron, WS_setntence_auto_pron = wordset.WS_sentence_auto_pron, WS_disp_note = wordset.WS_disp_note, WS_stu_degree = wordset.degree, WS_stu_times = wordset.WS_stu_times, WS_stu_volume = wordset.WS_stu_volume)
    return HttpResponse('200')

#@uid 用户唯一id
def UserResouce(request):
    if request.method == 'POST':
        uid = request.POST['uid']
        resouce_resp = UserResource.objects.get(R_uid = uid)
        resp = resouce_resp.__delattr('_state')
        return HttpResponse(resp)

#@R_id 资源唯一id
def delUserResouce(request):
    if request.method == 'GET':
        uid = request.get['uid']
        R_id = request.get['R_id']
        UserResouce.objects.filter(R_id = R_id).delete()
        return HttpResponse('200')

#@resouce 资源信息,key和model中一样的
def addUserResouce(request):
    if request.method == 'POST':
        resouce == request.POST['resouce_info']
        UserResouce.objects.create(**resouce)
        return HttpResponse('200')

#@Journal 某个用户的所有日志
def UserJournal(request, uid):
    uid = urllib.parse.unquote(uid)
    Journal = UserJournal.objects.get(UJ_id = uid)
    for x in range(len(Journal)):
        Journal[x].__delattr__('_state')
    resp = json.dumps(Journal)
    return HttpResponse(resp)

