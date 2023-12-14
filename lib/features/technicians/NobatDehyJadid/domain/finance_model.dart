import 'dart:convert';
import 'package:flutter/services.dart' as rootBundle;

class FinanceModel {
  int? id;
  String? operation;
  String? state;
  String? date;
  String? zibajo;
  String? tar_mo;

  FinanceModel({
    this.id,
    this.operation,
    this.state,
    this.date,
    this.zibajo,
    this.tar_mo,
  });

  factory FinanceModel.fromJson(Map<String, dynamic> json) {
    return FinanceModel(
      id: json['id'],
      operation: json['operation'],
      state: json['state'],
      date: json['date'],
      zibajo: json['zibajo'],
      tar_mo: json['tar_mo'],
    );
  }
}

Future<List<FinanceModel>> readJsonDatafinance() async {
  final jsondata =
  await rootBundle.rootBundle.loadString("lib/features/technicians/NobatDehyJadid/domain/finance.json");
  final list = json.decode(jsondata) as List<dynamic>;

  return list.map((e) => FinanceModel.fromJson(e)).toList();
}
