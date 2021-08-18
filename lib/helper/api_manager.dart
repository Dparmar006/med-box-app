import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:med_box/constants/api.dart';
import 'package:med_box/models/medicines.dart';

class ApiManager {
  List<Medicines> listMedicines = [];
  final apiClient = http.Client();

  Future<List<Medicines>> getMedicines() async {
    print("CAlling");
    try {
      print("int try");
      var response = await apiClient.get(Uri.parse("${Api.baseUrl}/medicines"));
      print(response.body);
      if (response.statusCode == 200) {
        List data = json.decode(response.body);
        data.forEach((element) {
          listMedicines.add(Medicines.fromJson(element));
        });
        print(listMedicines);
      }
    } catch (e) {
      print("Error: $e");
      return listMedicines;
    }
    return listMedicines;
  }

  void getSampleData() async {
    var response = await apiClient
        .get(Uri.parse('https://jsonplaceholder.typicode.com/comments'));
    var jsonString = response.body;
    var jsonMap = jsonDecode(jsonString);
  }
}
