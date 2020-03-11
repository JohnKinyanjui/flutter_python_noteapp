from flask import Flask
from flask_restful import Api,Resource

app = Flask(__name__)
api = Api(app)

app.config["SQLALCHEMY_DATABASE_URI"] = "sqlite:///db.sqlite"
app.config['SQLALCHEMY_TRACK_MODIFICATIONS'] = False

from resources.db import db
from models.note import AddNote, AllNotes,UpdateNote,findNote

db.create_all()

api.add_resource(AddNote,'/addNote/<string:day>/<string:date>/<string:month>/<string:title>/<string:start>/<string:end>')
api.add_resource(UpdateNote,'/<int:id>/<string:title>')
api.add_resource(findNote,'/Notes/<int:id>')
api.add_resource(AllNotes,'/Notes')


