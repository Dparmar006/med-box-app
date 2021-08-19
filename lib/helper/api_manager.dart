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
      print(response.body);
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

  void postMedicine(Map map) async {
    try {
      var response = apiClient.post(Uri.parse("${Api.baseUrl}/medicines"),
          body: jsonEncode(map));
      print(response);
    } catch (e) {
      print(e);
    }
  }
}
