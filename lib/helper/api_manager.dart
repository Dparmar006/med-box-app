import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:med_box/constants/api.dart';
import 'package:med_box/models/medicines.dart';

class ApiManager {
  List<Medicines> listMedicines = [];
  var client = http.Client();

  Future<List<Medicines>> getMedicines() async {
    try {
      var response = await client.get("${Api.baseUrl}/medicines");
      if (response.statusCode == 200) {
        List data = json.decode(response.body);
        data.forEach((element) {
          listMedicines.add(Medicines.fromJson(element));
        });
        print(listMedicines);
      }
    } catch (Exception) {
      return listMedicines;
    }
    return listMedicines;
  }

  void getSampleData() async {
    var response =
        await client.get('https://jsonplaceholder.typicode.com/comments');
    var jsonString = response.body;
    var jsonMap = jsonDecode(jsonString);
  }
}
