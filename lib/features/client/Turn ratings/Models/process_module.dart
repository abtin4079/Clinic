// To parse this JSON data, do
//
//     final processModule = processModuleFromJson(jsonString);

import 'dart:convert';

ProcessModule processModuleFromJson(String str) =>
    ProcessModule.fromJson(json.decode(str));

String processModuleToJson(ProcessModule data) => json.encode(data.toJson());

class ProcessModule {
  List<Process>? processes;

  ProcessModule({
    this.processes,
  });

  factory ProcessModule.fromJson(Map<String, dynamic> json) => ProcessModule(
        processes: List<Process>.from(
            json["processes"].map((x) => Process.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "processes": processes != null
            ? List<dynamic>.from(processes!.map((x) => x.toJson()))
            : [],
      };
}

class Process {
  String? hairCount;
  String? operation;
  String? pationtId;
  String? technecianId;
  String? visitDate;

  Process({
    this.hairCount,
    this.operation,
    this.pationtId,
    this.technecianId,
    this.visitDate,
  });

  factory Process.fromJson(Map<String, dynamic> json) => Process(
        hairCount: json["hair_count"],
        operation: json["operation"],
        pationtId: json["pationt_id"],
        technecianId: json["technecian_id"],
        visitDate: json["visit_date"],
      );

  Map<String, dynamic> toJson() => {
        "hair_count": hairCount,
        "operation": operation,
        "pationt_id": pationtId,
        "technecian_id": technecianId,
        "visit_date": visitDate,
      };
}
