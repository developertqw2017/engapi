from django.shortcuts import render, get_object_or_404
from django.contrib.auth.decorators import login_required
from django.views.decorators.http import require_POST
from django.core.paginator import Paginator, PageNotAnInteger, EmptyPage
from django.http import JsonResponse, HttpResponse
from django.contrib.auth.models import User
from django.contrib import messages

from .forms import UserRegistrationForm, UserEditForm, ProfileEditForm
from .models import Profile, Contact
from actions.models import Action
from actions.utils import create_action


@require_POST
@login_required
def user_follow(request):
    user_id = request.POST.get("id")
    action = request.POST.get("action")
    if user_id and action:
        try:
            user = User.objects.get(id=user_id)
            if action == "follow":
                Contact.objects.get_or_create(user_from=request.user,
                                              user_to=user)
                create_action(request.user, "关注了", user)
            else:
                Contact.objects.filter(user_from=request.user,
                                       user_to=user).delete()
            return JsonResponse({"status": "ok"})
        except User.DoesNotExist:
            return JsonResponse({"status": "ko"})
    return JsonResponse({"status": "ko"})


@login_required
def user_list(request):
    users = User.objects.filter(is_active=True)
    return render(request, "account/user/list.html",
                  {"section": "people", "users": users})


@login_required
def user_detail(request, username):
    user = get_object_or_404(User,
                             username=username,
                             is_active=True)
    return render(request, "account/user/detail.html",
                  {"section": "people", "user": user})


@login_required
def edit(request):
    if request.method == "POST":
        user_form = UserEditForm(instance=request.user,
                                 data=request.POST)
        profile_form = ProfileEditForm(instance=request.user.profile,
                                       data=request.POST,
                                       files=request.FILES)
        if user_form.is_valid() and profile_form.is_valid():
            user_form.save()
            profile_form.save()
            messages.success(request, "个人资料更新成功!")
        else:
            messages.warning(request, "更新个人资料失败")
    else:
        user_form = UserEditForm(instance=request.user)
        profile_form = ProfileEditForm(instance=request.user.profile)
    return render(request, "account/edit.html",
                  {"user_form": user_form, "profile_form": profile_form})


@login_required
def dashboard(request):
    actions = Action.objects.exclude(user=request.user)
    following_ids = request.user.following.values_list("id", flat=True)

    if following_ids:
        actions = actions.filter(user_id__in=following_ids)\
                        .select_related("user", "user__profile")\
                        .prefetch_related("target")

    paginator = Paginator(actions, 6)
    page = request.GET.get("page")
    try:
        actions = paginator.page(page)
    except PageNotAnInteger:
        actions = paginator.page(1)
    except EmptyPage:
        if request.is_ajax():
            return HttpResponse("")
        actions = paginator.page(paginator.num_pages)

    if request.is_ajax():
        return render(request, "actions/action/detail.html",
                      {"section": "dashboard", "actions": actions})
    return render(request, "account/dashboard.html",
                  {"section": "dashboard", "actions": actions})


def register(request):
    if request.method == "POST":
        user_form = UserRegistrationForm(request.POST)
        if user_form.is_valid():
            new_user = user_form.save(commit=False)
            new_user.set_password(user_form.cleaned_data["password"])
            new_user.save()
            profile = Profile.objects.create(user=new_user)
            create_action(new_user, "创建了一个新的账号{}".format(new_user.username))
            return render(request, "account/register_done.html",
                          {"new_user": new_user})
    else:
        user_form = UserRegistrationForm()
    return render(request, "account/register.html",
                  {"user_form": user_form})
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

def indexpage(request):
    return redirect(url_header)
