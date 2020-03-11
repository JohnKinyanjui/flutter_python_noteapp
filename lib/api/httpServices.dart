import 'dart:convert';
import 'dart:ffi';
import 'package:flutter/foundation.dart';
import 'package:flutter_python_noteapp/models/note.dart';
import 'package:http/http.dart' as http;

class HttpServices{
  final String title;
  HttpServices(this.title);




}
Future<Void> AddNote() async{
  String url = "http://196.178.737.1:5000/addNote/Monday/02/January/title/10:00/20:00";
  var client = http.Client();
  var response = await client.post(url);
  if (response.statusCode == 200){
    print("Success");
  }else{
    print("Fail");
  }
}

Future<List<Note>> getNotes() async{
  String url = "http://196.178.737.1:5000/Notes";
  var client = http.Client();
  var response = await client.get(url);
  return compute(parsedNotes,response.body);
}

List<Note> parsedNotes(String ResponseBody){
  final parsed = json.decode(ResponseBody);
  return (parsed["note"] as List).map<Note>((json) => Note.fromJson(json)).toList();
}