import 'package:flutter/material.dart';

class AddMedicine extends StatefulWidget {
  AddMedicine({Key key}) : super(key: key);

  @override
  _AddMedicineState createState() => _AddMedicineState();
}

class _AddMedicineState extends State<AddMedicine> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text('Add medicine'),
    );
  }
}
