import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:med_box/constants/decoration.dart';
import 'package:med_box/helper/api_manager.dart';
import 'package:med_box/widgets/CustomInput.dart';

class AddMedicine extends StatefulWidget {
  AddMedicine({Key key}) : super(key: key);

  @override
  _AddMedicineState createState() => _AddMedicineState();
}

class _AddMedicineState extends State<AddMedicine> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              height: 100,
              child: Text(
                "Add new medicine",
                style: Constants.headingText,
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                CustomInput(
                  hintText: "Name of the Brand",
                ),
                CustomInput(
                  hintText: "Name",
                ),
                CustomInput(
                  hintText: "Imported quantity",
                ),
                CustomInput(
                  hintText: "Availabe quantity",
                ),
                TextField(
                  decoration: InputDecoration(hintText: 'Expiry date'),
                  onTap: () => showDatePicker(
                      context: context,
                      firstDate: DateTime.now(),
                      lastDate: DateTime(2040),
                      initialDate: DateTime.now(),
                      initialEntryMode: DatePickerEntryMode.input),
                ),
                ElevatedButton(
                  onPressed: () => {},
                  child: Text('Add', style: Constants.ragulerText),
                )
              ],
            ),
          ],
        ),
      )),
    );
  }
}

void addMedicine() {
  var values = new Map();
  values.addAll({'name': 'Sample'});
  ApiManager().postMedicine(values);
}
