import 'dart:convert';
import 'package:flutter/services.dart' as rootBundle;

class EntityTech {
  int? id;
  String? tech_name;
  String? phone;
  int? kodemelli;

  EntityTech(
      {
        this.id,
        this.tech_name,
        this.phone,
        this.kodemelli
      });

  EntityTech.fromJson2(Map<String, dynamic> json)
  {
    id = json['id'];
    tech_name = json['tech_name'];
    phone = json['phone'];
    kodemelli = json['kodemelli'];
  }


}


Future<List<EntityTech>>ReadJsonData2() async {
  final   jsondata = await rootBundle.rootBundle.loadString("lib/features/client/Technicians/presentation/domain/fake_database_tech.json");
  final list = json.decode(jsondata) as List<dynamic>;

  return list.map((e) => EntityTech.fromJson2(e)).toList();
}