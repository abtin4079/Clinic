// To parse this JSON data, do
//
//     final listOfProcess = listOfProcessFromJson(jsonString);

import 'dart:convert';

ListOfProcess listOfProcessFromJson(String str) =>
    ListOfProcess.fromJson(json.decode(str));

String listOfProcessToJson(ListOfProcess data) => json.encode(data.toJson());

ListOfProcess ItemFromJson(String str) =>
    ListOfProcess.fromJson(json.decode(str));

String ItemToJson(ListOfProcess data) => json.encode(data.toJson());

class ListOfProcess {
  List<ItemProcess>? items;
  int? page;
  int? perPage;
  int? totalItems;
  int? totalPages;

  ListOfProcess({
    this.items,
    this.page,
    this.perPage,
    this.totalItems,
    this.totalPages,
  });

  factory ListOfProcess.fromJson(Map<String, dynamic> json) => ListOfProcess(
        items: List<ItemProcess>.from(
            json["items"].map((x) => ItemProcess.fromJson(x))),
        page: json["page"],
        perPage: json["per_page"],
        totalItems: json["total_items"],
        totalPages: json["total_pages"],
      );

  Map<String, dynamic> toJson() => {
        "items": items != null
            ? List<dynamic>.from(items!.map((x) => x.toJson()))
            : [],
        "page": page,
        "per_page": perPage,
        "total_items": totalItems,
        "total_pages": totalPages,
      };
}

class ItemProcess {
  String? hairCount;
  int? id;
  String? operation;
  String? pationtName;
  String? status;
  String? technecianName;

  ItemProcess({
    this.hairCount,
    this.id,
    this.operation,
    this.pationtName,
    this.status,
    this.technecianName,
  });

  factory ItemProcess.fromJson(Map<String, dynamic> json) => ItemProcess(
        hairCount: json["hair_count"],
        id: json["id"],
        operation: json["operation"],
        pationtName: json["pationt_name"],
        status: json["status"],
        technecianName: json["technecian_name"],
      );

  Map<String, dynamic> toJson() => {
        "hair_count": hairCount,
        "id": id,
        "operation": operation,
        "pationt_name": pationtName,
        "status": status,
        "technecian_name": technecianName,
      };
}
