#!/usr/bin/env python
# encoding: utf-8
'''
@desc:    表单验证模块
@author:  
@contact: 
@file: forms.py
@time: 2020/3/2 2:38 下午
'''
import re
from flask import session
from flask_wtf import FlaskForm
from wtforms import StringField, PasswordField
from wtforms.fields.html5 import EmailField
from wtforms.validators import DataRequired, Length, EqualTo, Email, ValidationError

from App.blog import User

# 自定义验证函数有两个参数，第一个表单对象，
# 第二个参数要验证的字段对象，用户输入的值是字段对象的data属性
def check_phone(form1,field):
    print('phone')
    if not re.match(r'(13\d|14[5|7]|15\d|166|17[3|6|7]|18\d)\d{8}$',field.data):
        raise ValidationError("电话号码不符合规则")


class RegisterForm(FlaskForm):

    username = StringField("用户名",validators=[DataRequired("用户名必须输入")])
    password = PasswordField("密码",validators=[DataRequired("密码格式输入错误"),Length(min=3,max=12,message="密码长度必须在3-12位")])
    confirm = PasswordField("确认密码",validators=[EqualTo("password",message="两次密码不一致")])
    phone = StringField("电话",validators=[check_phone])
    code = StringField()
    sms = StringField()

    # 字段验证
    def validate_sms(self, field):
        print(field.data, session.get("sms"))
        if field.data != session.get("sms"):
            raise ValidationError("短信验证失败")

    # 验证用户是否重名
    # 自定义的验证方法： validate_字段名
    def validate_username(self,field):
        # value是一个对象，获取用户输入的值应该是field.data
        print(field.data)
        user = User.query.filter(User.username==field.data).first()
        if user:
            raise ValidationError("用户名重名")
        return field

    def validate_code(self,field):
        print(field.data ,session.get('code'))
        if field.data != session.get('code'):
            raise ValidationError("验证码匹配失败")
