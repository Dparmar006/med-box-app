import 'package:flutter/material.dart';
import 'package:med_box/helper/api_manager.dart';
import 'package:med_box/models/medicines.dart';
import 'package:med_box/widgets/MedicineDetail.dart';
import 'package:med_box/widgets/MedicineInfo.dart';

class MedicneDetail extends StatefulWidget {
  const MedicneDetail({Key key}) : super(key: key);

  @override
  _MedicneDetailState createState() => _MedicneDetailState();
}

class _MedicneDetailState extends State<MedicneDetail> {
  Medicines _medicine = null;
  bool _loading = true;

  @override
  void initState() {
    getMedicinesDetails();
    super.initState();
  }

  Future<void> getMedicinesDetails() async {
    _medicine = await ApiManager().getMedicineDetail();
    print(_medicine);
    setState(() {
      _loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_medicine.name),
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      body: SafeArea(
        child: !_loading
            ? MedicineDetail(
                data: _medicine,
              )
            : Center(
                child: CircularProgressIndicator(),
              ),
      ),
    );
  }
}
