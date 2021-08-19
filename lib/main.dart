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
        primaryColor: Color(0xff56C596),
        accentColor: Color(0xff2C6975),
        scaffoldBackgroundColor: Color(0xffffffff),
      ),
      home: Home(),
    );
  }
}
