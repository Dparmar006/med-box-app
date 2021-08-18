import 'package:flutter/material.dart';
import 'package:med_box/helper/api_manager.dart';
import 'package:med_box/models/medicines.dart';

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
        body: Container(
            child: !_loading
                ? ListView.builder(
                    itemCount: _medicineModel.length,
                    itemBuilder: (context, index) {
                      return Container(
                        height: 100,
                        color: Colors.cyan,
                        child: Text(_medicineModel[index].name),
                      );
                    },
                  )
                : Center(child: CircularProgressIndicator())));
  }
}
