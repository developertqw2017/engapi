from django.http import HttpResponse,JsonResponse
from user.models import UserAccount,UserComment,UserBaseInfo,News,UserNewsMeta,Vocabulary,ExmSentence, WordSet, UserResource, UserJournal
from django.shortcuts import render,redirect
from datetime import date,datetime
import json
from django.http import HttpResponseRedirect
import redis
from userSystem import userSystem
import urllib
from django.contrib.auth import authenticate,login,logout
from tools.forms import LoginForm
# Create your views here.
class CJsonEncoder(json.JSONEncoder):
    def default(self, obj):
        if isinstance(obj, datetime):
            return obj.strftime('%Y-%m-%d %H:%M:%S')
        elif isinstance(obj, date):
            return obj.strftime('%Y-%m-%d')
        else:
            return json.JSONEncoder.default(self, obj)


#@Uid 用户名唯一id
def showUserBaseInfo(request, Uid):
    r = redis.StrictRedis(host = 'localhost',port = '6379',db = 0)
    sessionid = request.COOKIES.get('sessionid',None)
    if not r.exists(sessionid):
        return HttpResponseRedirect("https://120.76.140.147/English/login.php")
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
    resp = json.dumps(UComment.__dict__, cls = CJsonEncoder)
    return HttpResponse(resp)

#@Nid 新闻唯一id
def showNews(request, Nid):
    Nid = urllib.parse.unquote(Nid)
    Ncontent = News.objects.get(Nid = Nid)
    Ncontent.__delattr__('_state')
    resp = json.dumps(Ncontent.__dict__, cls = CJsonEncoder)
    return HttpResponse(resp)
#@Nauthor 新闻作者
def showNews_by_author(request, Nauthor):
    Nauthor = urllib.parse.unquote(Nauthor)
    Ncontent = News.objects.get(Nauthor = Nauthor)
    Ncontent.__delattr__('_state')
    resp = json.dumps(Ncontent.__dict__, cls = CJsonEncoder)
    return HttpResponse(resp)

#@Ntitle_cn 新闻中文标题
def showNews_by_title_cn(request, Ntitle_cn):
    Ntitle_cn = urllib.parse.unquote(Ntitle_cn)
    Ncontent = News.objects.get(Ntitle_cn = Ntitle_cn)
    Ncontent.__delattr__('_state')
    resp = json.dumps(Ncontent.__dict__, cls = CJsonEncoder)
    return HttpResponse(resp)

#@Ntitle_en 新闻英文标题
def showNews_by_title_en(request, Ntitle_en):
    Ntitle_en = urllib.parse.unquote(Ntitle_en)
    Ncontent = News.objects.get(Ntitle_en = Ntitle_en)
    Ncontent.__delattr__('_state')
    resp = json.dumps(Ncontent.__dict__, cls = CJsonEncoder)
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
        resp = resouce_resp.__delattr('_state', cls = CJsonEncoder)
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
        resouce = request.POST['resouce_info']
        UserResouce.objects.create(**resouce)
        return HttpResponse('200')

#@Journal 某个用户的所有日志
def UserJournal(request, uid):
    uid = urllib.parse.unquote(uid)
    Journal = UserJournal.objects.get(UJ_id = uid)
    for x in range(len(Journal)):
        Journal[x].__delattr__('_state')
        resp = json.dumps(Journal, cls = CJsonEncoder)
        return HttpResponse(resp)




def index(request):
    r = redis.StrictRedis(host = 'localhost',port = '6379',db = 0)
    sessionid = request.COOKIES.get('sessionid',None)
    if not r.exists(sessionid):
        return HttpResponseRedirect("https://120.76.140.147/English/login.php")


def userlogin(request):
    m = UserAccount.objects.get(Uaccount=request.POST['username'])
    if m.Upass == request.POST['password']:
        request.session['member_id'] = m.id
        return HttpResponseRedirect("http://120.76.140.147/EnglishStu/header.php")
    else:
        return HttpResponse("Your username and password didn't match.")

def logout(request):
    try:
        del request.session['member_id']
    except KeyError:
        pass
    return HttpResponseRedirect("https://120.76.140.147/English/login.php")
from qiniu import Auth,put_file
import qiniu.config


# 定义获取七牛服务器上的tocken

#@login_required
#@require_http_methods(['GET'])
def get_token(request):
    # 1. 先要设置AccessKey和SecretKey
    access_key = "yLAD0JMxDrx5eqHUVWbSiAKTonSL8DfY372l9AO6"
    secret_key = "179S3CXzY1r4BCJm1wZmUAA3wcDI2oUshchjGwQd"
    # 2. 授权
    q = Auth(access_key, secret_key)
    # 3. 设置七牛空间(自己刚刚创建的)
    bucket_name = 'tuchuang'
    # 4. 生成token
    token = q.upload_token(bucket_name)
    # 5. 返回token,key必须为uptoken
    return JsonResponse({'uptoken': token})

#def verifySession(request):
#    ss = request.body.decode()
#    print(ss)
#    r = redis.StrictRedis(host = 'localhost',port = '6379',db = 0)
#    usSys = userSystem.usSystem(request)
#    print(request)
#    print(request.COOKIES.get('sessionid', None))
#    print(usSys.getUsObj(),'ver')
#   a = usSys.getUsObj()
#    todo_list = [
#        {"id":"1","content":"a"}
#    ]
#    response = HttpResponse(json.dumps(todo_list))
#    response["Access-Control-Allow-Origin"] = "*"
#    response["Access-Control-Allow-Methods"] = "POST, GET, OPTIONS"
#    response["Access-Control-Max-Age"] = "1000"
#    response["Access-Control-Allow-Headers"] = "*"
#    return response


url_header = "http://120.76.140.147/EnglishStu/header.php"
url_login = "http://120.76.140.147/EnglishStu/login.php"

def usLogin(request):
    username=request.POST.GET("usernmae")  # 获取用户名
    password=request.POST.GET("password")  # 获取用户的密码

    user=authenticate(username=username,password=password) # 验证用户名和密码，返回用户对象

    if user:      # 如果用户对象存在
        login(request,user)   # 用户登陆
        return redirect(url_header)

    else:
        return HttpResponse("用户名或密码错误")

def logout_view(request):

    logout(request)  # 注销用户
    return redirect(url_login)

def view1(request):
    if not request.user.is_authenticated():
        return redirect(url_login)


def user_login(request):
    if request.method == 'POST':
        form = LoginForm(request.POST)
        if form.is_valid():
            cd = form.cleaned_data
            user = authenticate(username=cd['username'],
                                password=cd['password'])
            if user is not None:
                if user.is_active:
                    login(request, user)
                    return HttpResponse('Authenticated successfully')
                else:
                    return HttpResponse('Disabled account')
        else:
            return HttpResponse('Invalid login')
    else:
        form = LoginForm()
    return render(request, 'account/login.html', {'form': form})
