import 'dart:convert';

class EachNobat {
  int? id;
  String? operation;
  String? pationt_name;
  String? visit_date;
  String? hair_count;
  String? pationt_phone_number;

  EachNobat(
      {this.id,
      this.operation,
      this.pationt_name,
      this.visit_date,
      this.hair_count,
      this.pationt_phone_number});

  EachNobat.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    hair_count = json['hair_count'];
    operation = json['operation'];
    pationt_name = json['pationt_name'];
    pationt_phone_number = json['pationt_phone_number'];
    visit_date = json['visit_date'];
  }
}

EachNobat convertJsonToItem(String json) {
  final decodedJson = jsonDecode(json);
  return EachNobat.fromJson(decodedJson);
}
