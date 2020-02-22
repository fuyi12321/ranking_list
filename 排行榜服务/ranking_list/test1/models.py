from django.db import models
from django.contrib.auth.models import User


# Create your models here.
# 分数表
class ScoreModel(models.Model):
    user = models.OneToOneField(User, on_delete=models.CASCADE, default=None)
    score = models.IntegerField(default=0)
    datetime = models.DateTimeField(auto_now=True)


