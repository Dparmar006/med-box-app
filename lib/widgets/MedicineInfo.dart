import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
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
      margin: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      padding: EdgeInsets.all(18),
      decoration: BoxDecoration(
        boxShadow: [BoxShadow(color: Color(0x110F0F0F), blurRadius: 12)],
        color: Theme.of(context).primaryColor,
        border: Border.all(color: Theme.of(context).primaryColor),
        borderRadius: BorderRadius.circular(24),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(name, style: Constants.ragulerText),
          SizedBox(height: 5),
          Text(brandName, style: Constants.subtleText),
          Text('$price', style: Constants.subtleText),
          Text(
              'Expiring on ${DateFormat('MMMM').format(expDate)} ${expDate.year}',
              style: Constants.subtleText),
        ],
      ),
    );
  }
}
