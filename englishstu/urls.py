"""englishstu URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/1.11/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  url(r'^$', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  url(r'^$', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.conf.urls import url, include
    2. Add a URL to urlpatterns:  url(r'^blog/', include('blog.urls'))
"""
from django.conf.urls import url
from django.contrib import admin
from user import views

urlpatterns = [
    url(r'^admin/', admin.site.urls),
    url(r'UserBaseInfo/(\S{1,30})/$',views.showUserBaseInfo),
    url(r'Comment/(\S{1,30})/$',views.showComment),
    url(r'News/(\S{1,30})/$',views.showNews),
    url(r'News_author/(\S{1,30})/$',views.showNews_by_author),
    url(r'News_title_cn/(\S{1,30})/$',views.showNews_by_title_cn),
    url(r'News_title_en/(\S{1,30})/$',views.showNews_by_title_en),
    url(r'gettoken/$',views.get_token),
    url(r'updateWordSet/',views.updateWordSet),
    url(r'resouce/',views.UserResouce),
    url(r'delresouce/',views.delUserResouce),
    url(r'addUserResouce/',views.addUserResouce),
    url(r'UserJournal/(\${1,20})/$',views.UserJournal),
    url(r'usLogin$',views.usLogin),
]


