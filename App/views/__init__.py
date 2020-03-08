from App.views.views import blog

# 注册蓝图
def register_blueprint(app):
    app.register_blueprint(blog)