# Generated by Django 3.0.3 on 2020-02-21 15:25

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('test1', '0001_initial'),
    ]

    operations = [
        migrations.CreateModel(
            name='ScoreModel',
            fields=[
                ('id', models.AutoField(primary_key=True, serialize=False)),
                ('score', models.IntegerField(default=0)),
                ('datetime', models.DateTimeField(auto_now=True)),
            ],
        ),
        migrations.DeleteModel(
            name='UserModel',
        ),
    ]
