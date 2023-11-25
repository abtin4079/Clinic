import 'dart:convert';

import 'package:flutter/services.dart' as rootBundle;

class EntityHome {
  int? id;
  String? tech;
  String? zibajo;
  String? situation;
  String? operation;
  String? number_of_hairs;

  EntityHome(
      {this.id, this.tech, this.zibajo, this.situation, this.number_of_hairs});

  EntityHome.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    tech = json['technecian_name'];
    zibajo = json['pationt_name'];
    situation = json['status'];
    number_of_hairs = json['hair_count'];
    operation = json['operation'];
  }
}

Future<List<EntityHome>> ReadJsonData() async {
  final jsondata = await rootBundle.rootBundle
      .loadString('lib/features/client/Home/domain/fake_database.json');
  final list = json.decode(jsondata) as List<dynamic>;
  return list.map((e) => EntityHome.fromJson(e)).toList();
}
