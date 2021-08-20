import 'package:flutter/material.dart';
import 'package:med_box/constants/decoration.dart';
import 'package:med_box/models/medicines.dart';

class MedicineDetail extends StatelessWidget {
  final Medicines data;

  const MedicineDetail({Key key, this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.all(15),
      padding: EdgeInsets.all(18),
      decoration: BoxDecoration(
        boxShadow: [
          new BoxShadow(
            color: Theme.of(context).primaryColor,
            blurRadius: 22,
          )
        ],
        color: Theme.of(context).primaryColor,
        border: Border.all(color: Theme.of(context).primaryColor),
        borderRadius: BorderRadius.circular(32),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(data.name, style: Constants.hugeTitleText),
          SizedBox(height: 5),
          Text(data.brandName, style: Constants.ragulerText),
          Text('Rs. ${data.price} / ${data.unit} ',
              style: Constants.ragulerText),
          Text('Expiring on ${data.expDate.month}/${data.expDate.year}',
              style: Constants.ragulerText),
        ],
      ),
    );
  }
}
