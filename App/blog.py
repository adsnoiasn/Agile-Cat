from datetime import datetime
from App.ext import db
from flask._compat import text_type
from flask_login import UserMixin

# 文章
"""
aid : 主键 自增
title：  标题
content: 内容
create_time:发布时间
author: 作者
category: 类别
hits: 点击量
comments:品论量
"""


class Article(db.Model):
    aid = db.Column(db.Integer, primary_key=True, autoincrement=True)
    title = db.Column(db.String(100), nullable=True)
    content = db.Column(db.String(10000))
    content_second = db.Column(db.String(10000))
    create_time = db.Column(db.DateTime, default=datetime.now)
    cid = db.Column(db.Integer, db.ForeignKey("category.cid", ondelete="CASCADE"))
    hits = db.Column(db.Integer, default=0)
    comments = db.Column(db.Integer, default=0)
    picture = db.Column(db.String(300))
    __tablename__ = 'article'


"""
用户表
uid: 主键
用户名
密码
电话
email
头像
注册时间
是否禁止登陆

"""


# 要使用登录管理器，用户类必须继承自UserMixin
class User(db.Model, UserMixin):
    uid = db.Column(db.Integer, primary_key=True, autoincrement=True)
    username = db.Column(db.String(30), nullable=False, unique=True)
    password = db.Column(db.String(128), nullable=False)
    phone = db.Column(db.String(11))

    __tablename__ = 'user'


"""
评论
id:主键
content:内容
create_time:时间
user:外键，关联用户
"""


class Mark(db.Model):
    mid = db.Column(db.Integer, primary_key=True, autoincrement=True)
    content = db.Column(db.String(1000))
    create_time = db.Column(db.DateTime)
    uid = db.Column(db.Integer, db.ForeignKey('user.uid'))

"""
类别表
cid : 主键 自增
名称
文章数量
"""


class Category(db.Model):
    cid = db.Column(db.Integer, primary_key=True, autoincrement=True)
    name = db.Column(db.String(100), nullable=False, unique=True)
    num = db.Column(db.Integer, default=0)
    __tablename__ = "category"


""""
标签表
tid :主键 自增
名称
文章id :外键
"""


class Tag(db.Model):
    tid = db.Column(db.Integer, primary_key=True, autoincrement=True)
    name = db.Column(db.String(30), nullable=True)
    aid = db.Column(db.Integer, db.ForeignKey("article.aid"))
