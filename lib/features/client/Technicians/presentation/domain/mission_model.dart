import 'dart:convert';
import 'package:flutter/services.dart' as rootBundle;

class MissionModel {
  int? id;
  String? amaliat;
  String? zibajo;
  String? tar_mo;
  String? date;

  MissionModel({this.id, this.amaliat, this.zibajo, this.tar_mo, this.date});

  MissionModel.fromJson2(Map<String, dynamic> json) {
    id = json['id'];
    amaliat = json['amaliat'];
    zibajo = json['zibajo'];
    tar_mo = json['tar_mo'];
    date = json['date'];
  }
}

Future<List<MissionModel>> ReadMissionData() async {
  final jsondata = await rootBundle.rootBundle.loadString(
      "lib/features/client/Technicians/presentation/domain/missions_data.json");
  final list = json.decode(jsondata) as List<dynamic>;

  return list.map((e) => MissionModel.fromJson2(e)).toList();
}
