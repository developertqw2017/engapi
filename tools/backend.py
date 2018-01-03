from django.shortcuts import render,redirect,HttpResponse
from django.contrib.auth import authenticate,login,logout

url_header = "http://120.76.140.147/EnglishStu/header.php"
url_login = "http://120.76.140.147/EnglishStu/login.php"

def auth_view(request):
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

