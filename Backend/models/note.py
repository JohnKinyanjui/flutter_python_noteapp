from resources.db import db,ma
from flask import request
from flask_restful import Resource,Api
from sqlalchemy.orm.exc import NoResultFound

class Note(db.Model):
    id = db.Column(db.Integer,primary_key=True)
    day = db.Column(db.String,nullable=False)
    date = db.Column(db.String,nullable=False)
    month = db.Column(db.String,nullable=False)
    title = db.Column(db.String,nullable=True)
    start = db.Column(db.String,nullable=False)
    end = db.Column(db.String,nullable=False)

class NoteSchema(ma.ModelSchema):
    class Meta():
        model = Note

note_sc = NoteSchema()
note_schema = NoteSchema(many=True)
class AddNote(Resource):
    def post(self,day,date,month,title,start,end):
        new_note = Note(day=day,date=date,month=month,title=title,start=start,end=end)        
        db.session.add(new_note)
        db.session.commit() 
        return { "message":"Note added"}

class UpdateNote(Resource):
    def post(self,id,title):
        db.session.query(Note).filter(Note.id == id).update({Note.title: title},  synchronize_session = False)  
        db.session.commit() 
        return {"message":"note updated"}
             
     
class findNote(Resource):
    def get(self,id):
        try:
            nota = db.session.query(Note).filter(Note.id == id).first();
            note = note_sc.dump(nota)
            return {"note":note}
        except NoResultFound:
            return {"message":"note not found"}


          
        
class AllNotes(Resource):
    def get(self):
        notes = Note.query.all()
        notes_all = note_schema.dump(notes)
        return {"note":notes_all}

