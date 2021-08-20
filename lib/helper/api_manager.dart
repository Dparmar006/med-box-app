import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:med_box/constants/api.dart';
import 'package:med_box/models/medicines.dart';

class ApiManager {
  List<Medicines> listMedicines = [];
  final apiClient = http.Client();

  Future<List<Medicines>> getMedicines() async {
    try {
      var response = await apiClient.get(Uri.parse("${Api.baseUrl}/medicines"));
      if (response.statusCode == 200) {
        List data = json.decode(response.body);
        data.forEach((element) {
          listMedicines.add(Medicines.fromJson(element));
        });
      }
    } catch (e) {
      print("Error: $e");
      return listMedicines;
    }
    return listMedicines;
  }

  void postMedicine(map) async {
    try {
      var response = await apiClient.post(Uri.parse("${Api.baseUrl}/medicines"),
          body: jsonEncode(map),
          headers: <String, String>{'Content-Type': 'application/json'});
      if (response.statusCode == 201) {
        print(
          jsonDecode(response.body),
        );
      }
    } catch (e) {
      print('$e error');
    }
  }

  Future<Medicines> getMedicineDetail() async {
    Medicines medicine;
    try {
      var response = await apiClient.get(
        Uri.parse("${Api.baseUrl}/medicines/611e70a4f5943b0016d4d315"),
      );
      if (response.statusCode == 200) {
        print(
          jsonDecode(response.body)['msg'],
        );
        var data = jsonDecode(response.body)['msg'];
        medicine = Medicines.fromJson(data);
      }
    } catch (e) {
      print('$e error');
      return medicine;
    }
    return medicine;
  }
}
