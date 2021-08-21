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
        primaryColor: Color(0xffffffff),
        accentColor: Color(0x771E1C61),
        scaffoldBackgroundColor: Color(0xffF9F9F9),
      ),
      home: Home(),
    );
  }
}
