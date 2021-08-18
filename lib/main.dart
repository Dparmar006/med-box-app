import 'package:flutter/material.dart';
import 'package:med_box/screens/Home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MedBox',
      theme: ThemeData(
          primaryColor: Color(0xff0D0D0D),
          accentColor: Color(0xff8743FF),
          scaffoldBackgroundColor: Color(0xff171717)),
      home: Home(),
    );
  }
}
