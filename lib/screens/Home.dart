import 'package:flutter/material.dart';
import 'package:med_box/helper/api_manager.dart';
import 'package:med_box/models/medicines.dart';
import 'package:med_box/screens/AddMedicine.dart';
import 'package:med_box/widgets/MedicineInfo.dart';

class Home extends StatefulWidget {
  const Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Medicines> _medicineModel;
  bool _loading = true;

  @override
  void initState() {
    getMedicines();
    super.initState();
  }

  Future<void> getMedicines() async {
    _medicineModel = await ApiManager().getMedicines();
    setState(() {
      _loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Home'),
        ),
        floatingActionButton: FloatingActionButton.extended(
            onPressed: () => {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => AddMedicine()),
                  ),
                },
            label: Icon(Icons.add)),
        body: SafeArea(
          child: Container(
              padding: EdgeInsets.all(10),
              child: !_loading
                  ? ListView.builder(
                      itemCount: _medicineModel.length,
                      itemBuilder: (context, index) {
                        return Medicine(
                          name: _medicineModel[index].name,
                          brandName: _medicineModel[index].brandName,
                          price: _medicineModel[index].price,
                          expDate: _medicineModel[index].expDate,
                        );
                      },
                    )
                  : Center(
                      child: CircularProgressIndicator(),
                    )),
        ));
  }
}
