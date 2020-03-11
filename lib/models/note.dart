import 'package:flutter/material.dart';

class Note{
  final String day;
  final String date;
  final String month;
  final String title;
  final String start;
  final String end;

  Note({@required this.day,@required this.date,@required this.month,@required this.title,@required this.start,@required this.end,});

  factory Note.fromJson(Map<String, dynamic> json){
    return Note(
      day: json['day'],
      date: json['date'],
      month: json['month'],
      title: json['title'],
      start: json['start'],
      end: json['end']);
  }

}

class ListViewBuilder extends StatelessWidget {
  List<Note> notes;
  ListViewBuilder(this.notes);
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
    physics:  const NeverScrollableScrollPhysics(),
    shrinkWrap: true,  
    itemCount: notes.length,
    itemBuilder: (context,index){
     return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          color:Colors.grey[100],
          borderRadius: BorderRadius.all(Radius.circular(10))
        ),
        child:Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(children: <Widget>[
            Container(
              height: 60,
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                    Text(notes[index].day,style:TextStyle(fontWeight: FontWeight.w400,color:Colors.pink,fontSize: 20)),
                    Text(notes[index].date,style:TextStyle(fontWeight: FontWeight.w300,color:Colors.black,fontSize: 15))
                    ],),
                  ),
                  Expanded(child: SizedBox())
                ],
              ),
            ),
            Expanded(child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                Text(notes[index].title,style:TextStyle(fontWeight: FontWeight.w900,color:Colors.black,fontSize: 24),textAlign: TextAlign.justify,),
                Text("${notes[index].start} - ${notes[index].end}",style:TextStyle(fontWeight: FontWeight.w300,color:Colors.black,fontSize: 15))
              ],),
            ))
          ],),
        )
      ),
    );   
    });
  }
}


