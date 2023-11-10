import 'dart:convert';

class NobatTech {
  int? id;
  String? operation;
  String? pationt_name;
  String? visit_date;

  NobatTech({this.id, this.operation, this.pationt_name, this.visit_date});

  NobatTech.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    operation = json['operation'];
    pationt_name = json['pationt_name'];
    visit_date = json['visit_date'];
  }
}

List<NobatTech> convertJsonToList(String json) {
  // Decode the JSON string.
  final decodedJson = jsonDecode(json);

  // Create a list to store the converted JSON data.
  final listOf = <NobatTech>[];

  // Iterate over the decoded JSON data and add each element to the list.
  for (final item in decodedJson["items"]) {
    listOf.add(NobatTech.fromJson(item));
  }
  print(listOf);
  // Return the list.
  return listOf;
}
