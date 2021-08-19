import 'package:flutter/material.dart';
import 'package:med_box/constants/decoration.dart';

class CustomButton extends StatelessWidget {
  final onPressed;
  const CustomButton({Key key, this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: GestureDetector(
        onTap: () => onPressed(),
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(vertical: 14, horizontal: 30),
          decoration: BoxDecoration(
              color: Theme.of(context).accentColor,
              borderRadius: BorderRadius.circular(32),
              boxShadow: [
                new BoxShadow(
                  color: Color(0x88329D9C),
                  blurRadius: 24,
                )
              ]),
          child:
              Center(child: Text('Button Text', style: Constants.ragulerText)),
        ),
      ),
    );
  }
}
