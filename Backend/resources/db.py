from flask_sqlalchemy import SQLAlchemy
from flask_marshmallow import Marshmallow
from resources.app import app

db = SQLAlchemy(app)
ma = Marshmallow(app)
