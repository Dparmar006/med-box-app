import 'package:flutter/material.dart';
import 'package:med_box/helper/api_manager.dart';
import 'package:med_box/models/medicines.dart';

class Home extends StatefulWidget {
  const Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Future<List<Medicines>> _medicineModel;

  @override
  void initState() {
    _medicineModel = ApiManager().getMedicines();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: Container(
        child: FutureBuilder<List<Medicines>>(
            future: _medicineModel,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                  itemCount: 1,
                  itemBuilder: (context, index) {
                    return Container(
                      height: 100,
                      color: Colors.cyan,
                      child: Text(snapshot.data[index].name),
                    );
                  },
                );
              } else {
                return Center(child: CircularProgressIndicator());
              }
            }),
      ),
    );
  }
}
