// To parse this JSON data, do
//
//     final selectPatientModel = selectPatientModelFromJson(jsonString);

import 'dart:convert';

SelectPatientModel selectPatientModelFromJson(String str) =>
    SelectPatientModel.fromJson(json.decode(str));

String selectPatientModelToJson(SelectPatientModel data) =>
    json.encode(data.toJson());

class SelectPatientModel {
  List<Item>? items;
  int? page;
  int? perPage;
  String? searchedWord;
  int? totalItems;
  int? totalPages;

  SelectPatientModel({
    this.items,
    this.page,
    this.perPage,
    this.searchedWord,
    this.totalItems,
    this.totalPages,
  });

  factory SelectPatientModel.fromJson(Map<String, dynamic> json) =>
      SelectPatientModel(
        items: List<Item>.from(json["items"].map((x) => Item.fromJson(x))),
        page: json["page"],
        perPage: json["per_page"],
        searchedWord: json["searched_word"],
        totalItems: json["total_items"],
        totalPages: json["total_pages"],
      );

  Map<String, dynamic> toJson() => {
        "items": items != null
            ? List<dynamic>.from(items!.map((x) => x.toJson()))
            : [],
        "page": page,
        "per_page": perPage,
        "searched_word": searchedWord,
        "total_items": totalItems,
        "total_pages": totalPages,
      };
}

class Item {
  String? fullName;
  String? id;

  Item({
    this.fullName,
    this.id,
  });

  factory Item.fromJson(Map<String, dynamic> json) => Item(
        fullName: json["full_name"],
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "full_name": fullName,
        "id": id,
      };
}
