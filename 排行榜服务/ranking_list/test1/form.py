from django import forms


# 可以生成前端的代码，
# 用来验证 重要
class RegisterForm(forms.Form):
    username = forms.CharField(max_length=30, min_length=6)
    password = forms.CharField(max_length=8, min_length=6,
                               widget=forms.PasswordInput(
                                   attrs={'placeholder': '请输入密码'}
                               ))
    password_repeat = forms.CharField(widget=forms.PasswordInput())


class LoginForm(forms.Form):
    username = forms.CharField(max_length=30, min_length=6)
    password = forms.CharField(max_length=8, min_length=6,
                               widget=forms.PasswordInput(
                                   attrs={'placeholder': '请输入密码'}
                               ))

