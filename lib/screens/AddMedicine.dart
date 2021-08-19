import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:med_box/constants/decoration.dart';
import 'package:med_box/helper/api_manager.dart';
import 'package:med_box/widgets/CustomInput.dart';

class AddMedicine extends StatefulWidget {
  AddMedicine({Key key}) : super(key: key);

  @override
  _AddMedicineState createState() => _AddMedicineState();
}

class _AddMedicineState extends State<AddMedicine> {
  void addMedicine() {
    var values = new Map();
    values.addAll({
      'name': name.text,
      'brandName': brandName.text,
      'price': price.text,
      'quantityImported': importedQuantity.text,
      'quantityAvailabe': availabeQuantity.text,
      'mfgDate': mfgDate.toString(),
      'expDate': expDate.toString()
    });
    ApiManager().postMedicine(values);
  }

  final TextEditingController brandName = TextEditingController();
  final TextEditingController name = TextEditingController();
  final TextEditingController price = TextEditingController();
  final TextEditingController importedQuantity = TextEditingController();
  final TextEditingController availabeQuantity = TextEditingController();
  DateTime expDate;
  DateTime mfgDate;

  @override
  void initState() {
    expDate = DateTime.now();
    mfgDate = DateTime.now();
    super.initState();
  }

  @override
  void dispose() {
    brandName.dispose();
    name.dispose();
    importedQuantity.dispose();
    availabeQuantity.dispose();
    super.dispose();
  }

  void setExpDate(DateTime _expDate) async {
    final DateTime _expDate = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime.now(),
        lastDate: DateTime(2040));
    setState(() {
      expDate = _expDate;
    });
  }

  void setMfgDate(DateTime _mfgDate) async {
    final DateTime _mfgDate = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime.now(),
        lastDate: DateTime(2040));
    setState(() {
      mfgDate = _mfgDate;
    });
  }

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
              height: 50,
              child: Text(
                "Add new medicine",
                style: Constants.headingText,
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextField(
                  controller: brandName,
                  decoration: InputDecoration(
                    labelText: "Name of the Brand",
                  ),
                ),
                TextField(
                  controller: name,
                  decoration: InputDecoration(
                    labelText: "Name",
                  ),
                ),
                TextField(
                  controller: price,
                  decoration: InputDecoration(
                    labelText: "Price",
                  ),
                  keyboardType: TextInputType.number,
                ),
                TextField(
                  controller: importedQuantity,
                  decoration: InputDecoration(
                    labelText: "Imported quantity",
                  ),
                  keyboardType: TextInputType.number,
                ),
                TextField(
                  controller: availabeQuantity,
                  decoration: InputDecoration(
                    labelText: "Availabe quantity",
                  ),
                  keyboardType: TextInputType.number,
                ),
                TextButton(
                  onPressed: () => setExpDate(expDate),
                  child: Row(
                    children: [
                      Icon(
                        Icons.calendar_today,
                        color: Colors.redAccent,
                      ),
                      SizedBox(width: 10),
                      Text(
                          'Expiring on ${expDate.day}/${expDate.month}/${expDate.year}'),
                    ],
                  ),
                ),
                TextButton(
                  onPressed: () => setMfgDate(mfgDate),
                  child: Row(
                    children: [
                      Icon(
                        Icons.calendar_today,
                        color: Colors.greenAccent,
                      ),
                      SizedBox(width: 10),
                      Text(
                          'Menufectured on ${mfgDate.day}/${mfgDate.month}/${mfgDate.year}'),
                    ],
                  ),
                ),
                ElevatedButton(
                  onPressed: () => {addMedicine()},
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
