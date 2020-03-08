from App import create_app
from flask_script import Manager

from flask_migrate import MigrateCommand, Migrate
from App.ext import db

app = create_app()
manager = Manager(app)

migrate = Migrate(db=db, app=app)
manager.add_command('db', MigrateCommand)

if __name__ == '__main__':
    manager.run()
