from datetime import timedelta
import os


# 基础配置
class Config(object):
    # 项目根目录
    BASE_DIR = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
    DEBUG = False
    TESTING = False
    SECRET_KEY = "nqwindsaidnasiudhia(ADSNI)165153dasda"
    # session存活时间
    PERMANENT_SESSION_LIFETIME = timedelta(days=1)
    # session是否持久存储
    PERMANENT = True
    DATABASE_URI = 'sqlite:///:memory:'


class ProductionConfig(Config):
    SQLALCHEMY_DATABASE_URI = "mysql+pymysql://root:lzkmysql@localhost:3306/blog"


class DevelopmentConfig(Config):
    SQLALCHEMY_DATABASE_URI = "mysql+pymysql://root:lzkmysql@localhost:3306/blog"
    SQLALCHEMY_TRACK_MODIFICATIONS = False
    DEBUG = False


class TestingConfig(Config):
    TESTING = True


CONFIG = {
    'default': Config,
    'develop': DevelopmentConfig,
    'product': ProductionConfig,
    'testing': TestingConfig
}
