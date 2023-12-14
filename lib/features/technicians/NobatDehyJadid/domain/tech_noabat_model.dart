import 'dart:convert';

import 'package:flutter/services.dart' as rootBundle;

class TechNobatModel {
  int? id;
  String? operation;
  String? date;
  String? zibajo;
  String? clinic;

  TechNobatModel(
      {
    this.id,
    this.operation,
    this.date,
    this.zibajo,
    this.clinic
  });

  TechNobatModel.fromJson(Map<String, dynamic> json)
  {
    id = json['id'];
    operation = json['operation'];
    date = json['date'];
    zibajo = json['zibajo'];
    clinic = json['clinic'];
  }
}

Future<List<TechNobatModel>>readJsonDatatech() async{
  final jsondata = await rootBundle.rootBundle.loadString("lib/features/technicians/NobatDehyJadid/domain/tech.json");
  final list = json.decode(jsondata) as List<dynamic>;

  return list.map((e) => TechNobatModel.fromJson(e)).toList();
}
