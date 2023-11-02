// To parse this JSON data, do
//
//     final searchTechModel = searchTechModelFromJson(jsonString);

import 'dart:convert';

SearchTechModel searchTechModelFromJson(String str) => SearchTechModel.fromJson(json.decode(str));

String searchTechModelToJson(SearchTechModel data) => json.encode(data.toJson());

class SearchTechModel {
  List<Item> ? items;
  int ? page;
  int ? perPage;
  String ? searchedWord;
  int ? totalItems;
  int ? totalPages;

  SearchTechModel({
    this.items,
    this.page,
    this.perPage,
    this.searchedWord,
    this.totalItems,
    this.totalPages,
  });

  factory SearchTechModel.fromJson(Map<String, dynamic> json) => SearchTechModel(
    items: List<Item>.from(json["items"].map((x) => Item.fromJson(x))),
    page: json["page"],
    perPage: json["per_page"],
    searchedWord: json["searched_word"],
    totalItems: json["total_items"],
    totalPages: json["total_pages"],
  );

  Map<String, dynamic> toJson() => {
    "items": items != null ? List<dynamic>.from(items!.map((x) => x.toJson())) : [],
    "page": page,
    "per_page": perPage,
    "searched_word": searchedWord,
    "total_items": totalItems,
    "total_pages": totalPages,
  };
}

class Item {
  String ? fullName;
  String ? id;
  String ? profileUrl;

  Item({
    this.fullName,
    this.id,
    this.profileUrl,
  });

  factory Item.fromJson(Map<String, dynamic> json) => Item(
    fullName: json["full_name"],
    id: json["id"],
    profileUrl: json["profile_url"],
  );

  Map<String, dynamic> toJson() => {
    "full_name": fullName,
    "id": id,
    "profile_url": profileUrl,
  };
}
