import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_python_noteapp/screens/home.dart';

void main() {
  runApp(MyApp());
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarBrightness: Brightness.light,
    statusBarColor: Colors.transparent,
    systemNavigationBarColor: Colors.pink[800]
  ));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
       primaryColorBrightness: Brightness.light,
        primarySwatch: Colors.blue,
      ),
      home: Home(),
    );
  }
}
