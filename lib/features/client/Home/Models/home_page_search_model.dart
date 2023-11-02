// To parse this JSON data, do
//
//     final homePageSearchModel = homePageSearchModelFromJson(jsonString);

import 'dart:convert';

HomePageSearchModel homePageSearchModelFromJson(String str) => HomePageSearchModel.fromJson(json.decode(str));

String homePageSearchModelToJson(HomePageSearchModel data) => json.encode(data.toJson());

class HomePageSearchModel {
  List<Item> ? items;
  int ? page;
  int ? perPage;
  String ? searchWord;
  int ? totalItems;
  int ? totalPages;

  HomePageSearchModel({
    this.items,
    this.page,
    this.perPage,
    this.searchWord,
    this.totalItems,
    this.totalPages,
  });

  factory HomePageSearchModel.fromJson(Map<String, dynamic> json) => HomePageSearchModel(
    items: List<Item>.from(json["items"].map((x) => Item.fromJson(x))),
    page: json["page"],
    perPage: json["per_page"],
    searchWord: json["search_word"],
    totalItems: json["total_items"],
    totalPages: json["total_pages"],
  );

  Map<String, dynamic> toJson() => {
    "items": items != null ?  List<dynamic>.from(items!.map((x) => x.toJson())) : [],
    "page": page,
    "per_page": perPage,
    "search_word": searchWord,
    "total_items": totalItems,
    "total_pages": totalPages,
  };
}

class Item {
  String ? hairCount;
  int ? id;
  String ? operation;
  String ? pationtName;
  String ? status;
  String ? technecianName;

  Item({
    this.hairCount,
    this.id,
    this.operation,
    this.pationtName,
    this.status,
    this.technecianName,
  });

  factory Item.fromJson(Map<String, dynamic> json) => Item(
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
