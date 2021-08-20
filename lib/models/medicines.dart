// To parse this JSON data, do
//
//     final medicines = medicinesFromJson(jsonString);

import 'dart:convert';

List<Medicines> medicinesFromJson(String str) =>
    List<Medicines>.from(json.decode(str).map((x) => Medicines.fromJson(x)));

String medicinesToJson(List<Medicines> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Medicines {
  Medicines({
    this.mfgDate,
    this.expDate,
    this.disease,
    this.id,
    this.brandName,
    this.name,
    this.quantityAvailabe,
    this.quantityImported,
    this.v,
    this.price,
    this.unit,
  });

  DateTime mfgDate;
  DateTime expDate;
  List<String> disease;
  String id;
  String brandName;
  String name;
  int quantityAvailabe;
  int quantityImported;
  int v;
  int price;
  String unit;

  factory Medicines.fromJson(Map<String, dynamic> json) => Medicines(
        mfgDate: DateTime.parse(json["mfgDate"] ?? DateTime.now().toString()),
        expDate: DateTime.parse(json["expDate"] ?? DateTime.now().toString()),
        disease: List<String>.from(json["disease"].toList()),
        id: json["_id"],
        brandName: json["brandName"],
        name: json["name"],
        quantityAvailabe: json["quantityAvailabe"],
        quantityImported: json["quantityImported"],
        v: json["__v"],
        price: json["price"],
        unit: json["unit"],
      );

  List<String> mapTodieses(Map<String, dynamic> json) {
    List<String> d = [];
    json.values.map((e) => d.add(e));
    return d;
  }

  Map<String, dynamic> toJson() => {
        "mfgDate": mfgDate,
        "expDate": expDate.toIso8601String(),
        "disease": List<dynamic>.from(disease.map((x) => x)),
        "_id": id,
        "brandName": brandName,
        "name": name,
        "quantityAvailabe": quantityAvailabe,
        "quantityImported": quantityImported,
        "__v": v,
        "price": price,
        "unit": unit,
      };
}
