from django.shortcuts import render, redirect, reverse
from django.http import HttpResponse
from django.views import View
from django.contrib.auth.decorators import login_required, permission_required
from django.utils.decorators import method_decorator
from .form import RegisterForm, LoginForm
from django.contrib.auth.models import User
from django.contrib.auth import login, logout, authenticate
from .models import ScoreModel
import datetime
import pytz
import re

# Create your views here.
@login_required
def index(request):
    return render(request, 'test1/home.html')


def home(request):
    username = request.user
    return render(request, 'test1/home.html', context={'username': username})


class Register(View):
    def get(self, request):
        return render(request, 'test1/register.html')

    def post(self, request):
        form = RegisterForm(request.POST)
        # 验证数据的合法性
        if form.is_valid():
            # 获取具体某个字段的值
            username = form.cleaned_data.get('username')
            password = form.cleaned_data.get('password')
            password_repeat = form.cleaned_data.get('password_repeat')
            if password == password_repeat:
                User.objects.create_user(username=username, password=password)
                return redirect(reverse('home'))
            else:
                return HttpResponse('密码不一致')
        else:
            return HttpResponse('注册失败')


class Login(View):
    def get(self, request):
        form = LoginForm()
        return render(request, 'test1/login.html', context={'form': form})

    def post(self, request):
        form = LoginForm(request.POST)
        if form.is_valid():
            username = form.cleaned_data.get('username')
            password = form.cleaned_data.get('password')
            # 验证模型
            user = authenticate(username=username, password=password)
            if user:
                login(request, user)
                next_url = request.GET.get('next')
                if next_url:
                    return redirect(next_url)
                else:
                    return redirect(reverse('choose'))
            else:
                return redirect(reverse('register'))
        else:
            return HttpResponse('登录失败')


def logoutTest(request):
    logout(request)
    return redirect(reverse('home'))


# 选择接口
def choose(request):
    return render(request, 'test1/choose.html')


# 填入分数
class CreateScore(View):
    @method_decorator(login_required())
    def get(self, request):
        return render(request, 'test1/create.html')

    def post(self, request):
        username = request.user
        score = int(request.POST.get('score'))
        user = User.objects.filter(username=username).first()
        # 如果分数异常
        if score not in range(1, 10000000):
            return HttpResponse('分数数据异常')
        else:
            score_user = ScoreModel.objects.filter(user_id=user.id)
            # 如果用户没有填过分数，就创建
            if not score_user:
                ScoreModel.objects.create(score=score, user_id=user.id)
                return redirect('choose')
            # 如果用户填过，就更新
            else:
                # 如果记录不存在的话，它会报错。
                scores = ScoreModel.objects.get(user_id=user.id)
                now_datetime = datetime.datetime.now().replace(tzinfo=pytz.timezone('UTC'))
                if scores.datetime - now_datetime < datetime.timedelta(seconds=1):
                    scores.score = score
                    scores.save()
                    return HttpResponse('分数更新成功')
                else:
                    return HttpResponse('时间异常')


# 查询排行榜
class SearchRanking(View):
    @method_decorator(login_required())
    def get(self, request):
        return render(request, 'test1/search.html')

    def post(self, request):
        username = request.user
        user = User.objects.filter(username=username).first()
        my_score = ScoreModel.objects.get(user_id=user.id)
        ranges = request.POST.get('ranges')
        pattern = re.compile(r'^[0-9]?\d-[0-9]?\d$')
        ret = re.match(pattern, ranges)

        context = {
            'user': user,
            'myScore': my_score
        }
        if ranges == '':
            data = ScoreModel.objects.order_by('-score')[:10]
            context['specified'] = data
        else:
            if ret:
                range_left = int(ranges.split('-')[0]) - 1
                range_right = int(ranges.split('-')[1])
                if range_left < range_right:
                    data = ScoreModel.objects.order_by('-score')[range_left: range_right]
                    context['specified'] = data
                    context['rank_start'] = range_left
                else:
                    return HttpResponse('范围输入有误')
            else:
                return HttpResponse('范围输入有误')
        return render(request, 'test1/search.html', context=context)




