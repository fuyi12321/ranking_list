### 一、数据库配置

```python
DATABASES = {
    'default': {
        'ENGINE': 'django.db.backends.mysql',
        'NAME': 'ranking_list',
        'USER': 'root',
        'PASSWORD': 'root',
        'HOST': '127.0.0.1',
        'PORT': 3306,
    },
}
```

#### 1.数据库创了一个表用来存放分数和修改时间

```python
class ScoreModel(models.Model):
    user = models.OneToOneField(User, on_delete=models.CASCADE, default=None)
    score = models.IntegerField(default=0)
    datetime = models.DateTimeField(auto_now=True)
```

### 二、流程

#### 1.进入首页

http://localhost:8000/test1/home/

![image-20200222212857352](C:\Users\CMo\AppData\Roaming\Typora\typora-user-images\image-20200222212857352.png)



可以选择登录和注册

没有用户名和密码的需要先进行注册

![image-20200222212932045](C:\Users\CMo\AppData\Roaming\Typora\typora-user-images\image-20200222212932045.png)

注册完成后会回到首页，然后点击登录，输入用户名和密码

![image-20200222213013148](C:\Users\CMo\AppData\Roaming\Typora\typora-user-images\image-20200222213013148.png)

#### 2.功能选择

这里可以选择两个功能：登记分数和查看排行榜

![image-20200222213044676](C:\Users\CMo\AppData\Roaming\Typora\typora-user-images\image-20200222213044676.png)

a.登记分数，这里分数范围是1-10000000，如果超出范围会提示分数数据异常，如果不是数字也会提示异常。登记成功后会回到选择页面

![image-20200222213129673](C:\Users\CMo\AppData\Roaming\Typora\typora-user-images\image-20200222213129673.png)

注：当已有分数的情况下，只有时间大于数据库已有数据的时间才会存储。

如果没有分数的就会新建一条记录

b.查看排行榜，可以按示例输入范围，也可以不输入默认查询1-10

前十是前十，最后一条是自己的数据

![image-20200223022815925](C:\Users\CMo\AppData\Roaming\Typora\typora-user-images\image-20200223022815925.png)

输入2-8的话，显示第二到第八名

![image-20200223022914456](C:\Users\CMo\AppData\Roaming\Typora\typora-user-images\image-20200223022914456.png)

如果输入了错误的格式就会显示，范围输入错误

![image-20200223022944443](C:\Users\CMo\AppData\Roaming\Typora\typora-user-images\image-20200223022944443.png)