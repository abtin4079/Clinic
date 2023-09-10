import 'dart:convert';

import 'package:flutter/services.dart' as rootBundle;
import 'package:flutter/material.dart';
class EntityHome {
  int? id;
  String? tech;
  String? zibajo;
  String? situation;
  int? number_of_hairs;

  EntityHome(
      {
        this.id,
        this.tech,
        this.zibajo,
        this.situation,
        this.number_of_hairs
      }
  );

  EntityHome.fromJson(Map<String, dynamic> json)
  {
    id = json['id'];
    tech = json['tech'];
    zibajo = json['zibajo'];
    situation = json['situation'];
    number_of_hairs = json['number_of_hairs'];
  }

}


Future<List<EntityHome>>ReadJsonData() async{
  final jsondata = await rootBundle.rootBundle.loadString('lib/features/client/Home/domain/fake_database.json');
  final list = json.decode(jsondata) as List<dynamic>;
  return list.map((e) => EntityHome.fromJson(e)).toList();
}
