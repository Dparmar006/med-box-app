import 'package:flutter/material.dart';

class Constants {
  static const dangerColor = Colors.red;

  static const ragulerText = TextStyle(
      color: Color(0x771E1C61), fontSize: 16, fontWeight: FontWeight.bold);
  static const ragulerWhiteText = TextStyle(
      color: Color(0xffffffff), fontSize: 16, fontWeight: FontWeight.bold);

  static const ragulerDangerText = TextStyle(
      color: Color(0xFFEF5350), fontSize: 16, fontWeight: FontWeight.bold);

  static const subtleText = TextStyle(color: Color(0xff606060), fontSize: 14);

  static const headingText = TextStyle(
    color: Color(0xff292685),
    fontSize: 22,
    fontWeight: FontWeight.bold,
  );

  static const appBarText = TextStyle(
    color: Color(0xffffffff),
    fontSize: 18,
    fontWeight: FontWeight.bold,
  );
  static const hugeTitleText = TextStyle(
    color: Color(0xffffffff),
    fontSize: 26,
    fontWeight: FontWeight.bold,
  );

// INPUT
  static var defaultInput = InputDecoration(
    border: OutlineInputBorder(borderRadius: BorderRadius.circular(6)),
    contentPadding: EdgeInsets.all(18),
    labelStyle: TextStyle(color: Color(0x771E1C61)),
    hintStyle: TextStyle(color: Color(0x771E1C61)),
  );
}
