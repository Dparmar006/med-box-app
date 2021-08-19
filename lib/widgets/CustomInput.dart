import 'package:flutter/material.dart';

class CustomInput extends StatelessWidget {
  final String hintText;

  const CustomInput({Key key, this.hintText}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5),
      child: TextField(
        decoration: InputDecoration(
          // hintText: hintText,
          labelText: hintText,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(6),
          ),
        ),
      ),
    );
  }
}
