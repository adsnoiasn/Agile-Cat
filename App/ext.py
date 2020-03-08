from flask_sqlalchemy import SQLAlchemy

db = SQLAlchemy()

# 初始化第三方模块
def init_third(app):
    db.init_app(app)