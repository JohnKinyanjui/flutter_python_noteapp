import 'package:flutter/material.dart';

class ContainerText extends StatelessWidget {
  String text;

  ContainerText({this.text});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(20))
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(child: Text(text,style: TextStyle(fontSize: 30,color: Colors.pink,fontWeight: FontWeight.w900),)),
        ),
      ),
    );
  }
}
