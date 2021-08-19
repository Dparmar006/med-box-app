import 'package:flutter/material.dart';
import 'package:med_box/constants/decoration.dart';

class Medicine extends StatelessWidget {
  final String name;
  final String brandName;
  final int price;
  final DateTime expDate;

  const Medicine({Key key, this.name, this.brandName, this.price, this.expDate})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      margin: EdgeInsets.only(bottom: 10),
      padding: EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor,
        border: Border.all(color: Theme.of(context).primaryColor),
        borderRadius: BorderRadius.circular(32),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(name, style: Constants.ragulerText),
          SizedBox(height: 5),
          Text(brandName, style: Constants.subtleText),
          Text('$price', style: Constants.subtleText),
          Text('Expiring on ${expDate.day}/${expDate.month}/${expDate.year}',
              style: Constants.subtleText),
        ],
      ),
    );
  }
}
