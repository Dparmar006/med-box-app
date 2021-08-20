import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:med_box/constants/decoration.dart';
import 'package:med_box/helper/api_manager.dart';
import 'package:med_box/widgets/CustomButton.dart';

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
      expDate = _expDate ?? DateTime.now();
    });
  }

  void setMfgDate(DateTime _mfgDate) async {
    final DateTime _mfgDate = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime.now(),
        lastDate: DateTime(2040));
    setState(() {
      mfgDate = _mfgDate ?? DateTime.now();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Add new medicine',
          style: Constants.appBarText,
        ),
      ),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextField(
                  controller: brandName,
                  decoration: InputDecoration(
                    labelText: "Name of the Brand",
                    contentPadding: EdgeInsets.all(18),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(6),
                    ),
                    labelStyle:
                        TextStyle(color: Theme.of(context).primaryColor),
                    hintStyle: TextStyle(color: Theme.of(context).primaryColor),
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
                          "Expiring on ${expDate.day}/${expDate.month}/${expDate.year}")
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
                SizedBox(height: 10),
                CustomButton(
                  onPressed: () => addMedicine(),
                ),
              ],
            ),
          ],
        ),
      )),
    );
  }
}
