import 'package:flutter/material.dart';
import 'package:flutter_python_noteapp/api/httpServices.dart';
import 'package:flutter_python_noteapp/models/note.dart';
import 'package:flutter_python_noteapp/screens/screen_add.dart';

class Home extends StatefulWidget {
  Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink[800],
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Text("My Notes",style: TextStyle(fontSize: 40,color: Colors.white,fontWeight: FontWeight.w900),),
      ),
      body: FutureBuilder(
          future: getNotes(),
          builder: (context,snapshot){
        if (snapshot.hasData) {
          return ListViewBuilder(snapshot.data);
        }else if(snapshot.hasError){
          return Center(child: Text(snapshot.error.toString()));
        }
        return Center(child: CircularProgressIndicator(strokeWidth: 1,));
      }),
      floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.pink,
          child:Icon(Icons.add,color: Colors.white,),onPressed: ()=>Navigator.of(context).push(MaterialPageRoute(builder: (context)=>ScreenAdd()))),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}