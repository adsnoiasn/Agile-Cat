from flask import Blueprint, render_template, request, redirect, session, make_response, url_for, jsonify
from App.blog import *
from App.ext import db
from App.forms import RegisterForm
import hashlib
from App.verifycode import vc
from random import randint
from App.SMS import sms

blog = Blueprint('blog', __name__)


def check_log():
    username = session.get('username')
    print(username)
    if username:
        username = db.session.query(User.username).filter(User.password == username).scalar()
        return username
    else:
        return False


@blog.route('/')
def index():
    if check_log():
        # 查询文章数据
        articles = Article.query.all()
        tag = db.session.query(Article.aid, Tag.name).filter(Article.aid == Tag.aid).all()
        articles2 = db.session.query(Article, Category.name).filter(Article.cid == Category.cid).order_by(
            -Article.create_time).all()
        username = check_log()
        arti_num = len(articles)
        return render_template("index.html", **locals())
    else:
        return redirect(url_for("blog.login"))


@blog.route('/blog/')
@blog.route('/blog/<int:cid>/')
@blog.route('/blog/<int:cid>/<int:page>/')
def b_blog(cid=3, page=1):
    if check_log():
        arti_l = Article.query.order_by(-Article.create_time)[:3]
        arti_c = Category.query.all()
        arti_t = db.session.query(Tag.name).distinct().all()

        # 参数：当前页码，每页记录个数
        pagination = db.session.query(Article, Category).filter(Article.cid == Category.cid,
                                                                Article.cid == cid).order_by(
            -Article.create_time).paginate(page, 2)
        # 页码少于5页，全显
        if pagination.pages <= 5:
            pagination.page_range = range(1, pagination.pages + 1)
        # 如果多于5页
        else:
            # 当前页码如果大于等于3并且page+2小于总页数 [page-2,page+2]
            if page >= 3 and page + 2 <= pagination.pages:
                pagination.page_range = range(page - 2, page + 3)
            # 当前页码如果大于等于3并且page+2大于总页数
            elif page >= 3 and page + 2 > pagination.pages:
                pagination.page_range = range(pagination.pages - 5, pagination.pages + 1)
            # 如果页码小于3  [1,5]
            elif page < 3:
                pagination.page_range = range(1, 6)
        cid2 = cid
        username = check_log()
        return render_template("blog.html", **locals())
    else:
        return redirect(url_for("blog.login"))


@blog.route('/post/')
@blog.route('/post/<int:aid>/')
def post(aid=4):
    if check_log():
        articles = db.session.query(Article, Category).filter(Article.aid == aid, Article.cid == Category.cid).first()
        tag = db.session.query(Tag.name).filter(aid == Tag.aid).all()
        aid_min = db.session.query(Article.aid).filter(Article.aid < aid).all()
        aid_max = db.session.query(Article.aid).filter(Article.aid > aid).all()
        if len(aid_min) > 1:
            aid_max += [(aid_min[0][0],)]
            if len(aid_max) > 1:
                aid_min = [(aid_max[-2][0],)] + aid_min
        else:
            aid_min = [(aid_max[-1][0],)] + aid_min
        arti_l = Article.query.order_by(-Article.create_time)[:3]
        arti_c = Category.query.all()
        arti_t = db.session.query(Tag.name).distinct().all()
        username = check_log()
        return render_template("post.html", **locals())
    else:
        return redirect(url_for("blog.login"))


@blog.route('/login/', methods=["GET", "POST"])
def login():
    if request.method == "POST":
        username = request.form.get('username')
        password = request.form.get('password')
        password = hashlib.sha1(password.encode('utf8')).hexdigest()
        user = User.query.filter(User.username == username, User.password == password).first()
        if user:
            session['username'] = password
            return redirect(url_for('blog.index'))
        else:
            print("用户名或密码错误")
    return render_template("login.htm")


@blog.route("/logout/")
def logout():
    session.clear()
    return redirect("/")


@blog.route("/verify/")
def verify_code():
    result = vc.generate()
    # 把验证码字符串保存到session
    session['code'] = vc.code
    # 创建响应对象
    response = make_response(result)
    response.headers["Content-Type"] = "image/png"
    return response


# 短信验证
@blog.route("/send/", methods=["GET", "POST"])
def send_sms():
    phone = request.values.get('phone')
    if phone:
        # 产生验证码
        num = randint(1000, 9999)
        # 添加到session
        session['sms'] = str(num)
        para = "{'number':'%d'}" % num
        res = sms.send(phone, para)
        print(res, type(res))
        return jsonify({'code': 1, 'msg': '发送成功'})
    return jsonify({"code": 0, 'msg': "电话号码不存在"})


@blog.route('/sign/', methods=['GET', 'POST'])
def register_user():
    form = RegisterForm()
    if request.method == 'POST':
        # 验证成功，返回True，否则返回False
        if form.validate_on_submit():
            print('ok')
            # 获取验证数据
            username = form.username.data
            password = form.password.data
            phone = form.phone.data
            user = User(username=username, phone=phone)
            # 保存用户信息
            user.password = hashlib.sha1(password.encode('utf8')).hexdigest()
            session['username'] = user.password
            db.session.add(user)
            db.session.commit()
            return redirect("/")
    return render_template("register.htm", **locals())
