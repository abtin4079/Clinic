import 'dart:convert';

class GetTechModel {
  final String id;
  final String nationalCode;
  final String phoneNumber;
  final String fullName;
  final String profileUrl;

  GetTechModel({
    required this.id,
    required this.phoneNumber,
    required this.nationalCode,
    required this.fullName,
    required this.profileUrl,
  });

  factory GetTechModel.fromJson(Map<String, dynamic> json) {
    return GetTechModel(
      id: json['id'],
      nationalCode: json['national_code'],
      phoneNumber: json['phone_number'],
      fullName: json['full_name'],
      profileUrl: json['profile_url'],
    );
  }
}

List<GetTechModel> convertJsonToListForGet(String jsonString) {
  // Decode the JSON string
  var decodedObject = json.decode(jsonString) as Map<String, dynamic>;

  // Get the items list from the map
  var itemsList = decodedObject['items'] as List<dynamic>;

  // Map the items list to a list of GetTechModel objects
  return itemsList.map((item) => GetTechModel.fromJson(item)).toList();
}