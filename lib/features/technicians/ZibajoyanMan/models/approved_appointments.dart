import 'dart:convert';

class ApprovedAppointment {
  int? id;
  String? operation;
  String? pationt_name;
  String? visit_date;
  String? hair_count;

  ApprovedAppointment(
      {this.id,
      this.operation,
      this.pationt_name,
      this.visit_date,
      this.hair_count});

  ApprovedAppointment.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    operation = json['operation'];
    pationt_name = json['pationt_name'];
    visit_date = json['visit_date'];
    hair_count = json['hair_count'];
  }
}

List<ApprovedAppointment> convertJsonToList(String json) {
  // Decode the JSON string.
  final decodedJson = jsonDecode(json);

  // Create a list to store the converted JSON data.
  final listOf = <ApprovedAppointment>[];

  // Iterate over the decoded JSON data and add each element to the list.
  for (final item in decodedJson["items"]) {
    listOf.add(ApprovedAppointment.fromJson(item));
  }
  return listOf;
}
