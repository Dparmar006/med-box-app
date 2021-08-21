import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:med_box/constants/decoration.dart';
import 'package:med_box/helper/api_manager.dart';
import 'package:med_box/models/medicines.dart';

class MedicneDetail extends StatefulWidget {
  const MedicneDetail({Key key}) : super(key: key);

  @override
  _MedicneDetailState createState() => _MedicneDetailState();
}

class _MedicneDetailState extends State<MedicneDetail> {
  Medicines _medicine;
  bool _loading = true;
  String medicineId;

  @override
  void initState() {
    getMedicinesDetails();
    super.initState();
  }

  Future<void> getMedicinesDetails() async {
    _medicine = await ApiManager().getMedicineDetail();
    setState(() {
      _loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    // medicineId = ModalRoute.of(context).settings.arguments as String;

    return Scaffold(
      // appBar: AppBar(
      //   title: Text(_medicine == null ? '' : _medicine.name),
      //   elevation: 0,
      //   backgroundColor: Colors.white,
      // ),
      body: SafeArea(
          child: !_loading
              ? Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      margin: EdgeInsets.all(15),
                      padding: EdgeInsets.all(15),
                      height: 250,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(24),
                          boxShadow: [
                            BoxShadow(color: Color(0x110F0F0F), blurRadius: 12)
                          ]),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(bottom: 8.0),
                            child: Text(
                              _medicine == null ? '' : _medicine.name,
                              style: Constants.headingText,
                            ),
                          ),
                          Text(
                            _medicine == null ? '' : _medicine.brandName,
                            style: Constants.ragulerText,
                          ),
                          Text(
                            "Culpa ad enim cupidatat culpa commodo do laborum laboris.   Sit mollit eu sit ad sunt do id enim laboris veniam in",
                            style: Constants.subtleText,
                            // overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.all(15),
                      padding: EdgeInsets.all(15),
                      height: 250,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(24),
                          boxShadow: [
                            BoxShadow(color: Color(0x110F0F0F), blurRadius: 12)
                          ]),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            _medicine == null
                                ? ''
                                : '₹ ${_medicine.price} / ${_medicine.unit}',
                            style: Constants.ragulerText,
                          ),
                          Text(
                            _medicine == null
                                ? ''
                                : 'Expiring on ${DateFormat('MMMM').format(_medicine.expDate)} ${_medicine.expDate.year}',
                            style: Constants.ragulerDangerText,
                          ),
                          Text(
                            _medicine == null
                                ? ''
                                : 'Menufecturd on ${DateFormat('MMMM').format(_medicine.mfgDate)} ${_medicine.mfgDate.year}',
                            style: Constants.ragulerText,
                          ),
                          Text(
                            _medicine == null
                                ? ''
                                : "${_medicine.quantityAvailabe} ${_medicine.unit} availabe out of ${_medicine.quantityImported}",
                            style: Constants.ragulerText,
                            // overflow: TextOverflow.ellipsis,
                          ),
                          Text(
                            _medicine == null
                                ? ''
                                : "${_medicine.disease.map((e) => e.toString())} ",
                            style: Constants.ragulerText,
                            // overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ),
                  ],
                )
              : Center(
                  child: CircularProgressIndicator(),
                )),
    );
  }
}
