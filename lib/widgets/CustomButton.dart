import 'package:flutter/material.dart';
import 'package:med_box/constants/decoration.dart';

class CustomButton extends StatelessWidget {
  final onPressed;
  final String title;
  const CustomButton({Key key, this.onPressed, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: GestureDetector(
        onTap: () => onPressed(),
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(vertical: 14, horizontal: 30),
          decoration: BoxDecoration(
            boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 12)],
            color: Theme.of(context).accentColor,
            borderRadius: BorderRadius.circular(32),
          ),
          child: Center(child: Text(title, style: Constants.ragulerWhiteText)),
        ),
      ),
    );
  }
}
