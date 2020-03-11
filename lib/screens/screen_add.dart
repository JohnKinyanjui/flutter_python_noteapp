import 'package:flutter/material.dart';
import 'package:flutter_python_noteapp/api/httpServices.dart';
import 'package:flutter_python_noteapp/widgets/container_text.dart';

class ScreenAdd extends StatefulWidget {
  ScreenAdd({Key key}) : super(key: key);

  @override
  _ScreenAddState createState() => _ScreenAddState();
}

class _ScreenAddState extends State<ScreenAdd> {
  static TextEditingController controller = TextEditingController();
  HttpServices httpservices = HttpServices(controller.toString());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink[800],
      appBar:AppBar(
        titleSpacing: 0,
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Text("Add Note",style: TextStyle(fontSize: 40,color: Colors.white,fontWeight: FontWeight.w900),),
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: Column(
        children: <Widget>[
           Padding(
             padding: const EdgeInsets.all(8.0),
             child: Container(
               decoration: BoxDecoration(
                   color: Colors.white,
                   borderRadius: BorderRadius.all(Radius.circular(20))
               ),
               child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: TextField(
                     style:  TextStyle(fontSize: 20,color: Colors.grey[800]),
                    controller: controller,
                    decoration: InputDecoration(
                      hintText: "Add Title",
                      hintStyle: TextStyle(fontSize: 20,color: Colors.grey[800])
                    ),
                  ),
                ),
             ),
           ),
          Padding(
              padding: const EdgeInsets.all(8.0),
                  child: Container(
                  decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(20))
                  ),
                  child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(child: Text("Most data is dummy but you can change it example : The title is the data only added  by you",style: TextStyle(fontSize: 15,color: Colors.pink,fontWeight: FontWeight.w300),)),
                  ),
                  ),
          ),
          Expanded(child: ContainerText(text:"2 January 2020")),
          Expanded(child: Row(
            children: <Widget>[
              Expanded(child: ContainerText(text:"10:00AM")),
              Expanded(child: ContainerText(text:"12:00PM")),
            ],
          )),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
              onTap: () async{
                AddNote();
                Navigator.of(context).pop();
              },
              child: Container(
                height: 50,
                width: 200,
                decoration: BoxDecoration(
                  color: Colors.pink,
                  borderRadius: BorderRadius.all(Radius.circular(50))
                ),
                child: Center(child: Text("Save",style: TextStyle(color: Colors.white,fontWeight: FontWeight.w700),)),
              ),
            ),
          )
        ],
      ),
      
    );
  }
}