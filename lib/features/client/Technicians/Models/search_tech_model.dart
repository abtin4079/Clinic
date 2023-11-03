import 'dart:convert';

class SearchTechModel {
  final String id;
  final String fullName;
  final String profileUrl;

  SearchTechModel({
    required this.id,
    required this.fullName,
    required this.profileUrl,
  });

  factory SearchTechModel.fromJson(Map<String, dynamic> json) {
    return SearchTechModel(
      id: json['id'],
      fullName: json['full_name'],
      profileUrl: json['profile_url'],
    );
  }
}

List<SearchTechModel> convertJsonToList(String jsonString) {
  // Decode the JSON string
  var decodedObject = json.decode(jsonString) as Map<String, dynamic>;

  // Get the items list from the map
  var itemsList = decodedObject['items'] as List<dynamic>;

  // Map the items list to a list of SearchTechModel objects
  return itemsList.map((item) => SearchTechModel.fromJson(item)).toList();
}