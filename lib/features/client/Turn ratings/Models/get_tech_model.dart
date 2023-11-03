import 'dart:convert';

class GetTechModel {
  String id;
  String fullName;
  String phoneNumber;
  String nationalCardNumber;

  GetTechModel(
      this.id,
      this.fullName,
      this.phoneNumber,
      this.nationalCardNumber);

  factory GetTechModel.fromJson(Map<String, dynamic> json) {
    return GetTechModel(
        json['id'],
        json['full_name'],
        json['phone_number'],
        json['national_card_number']);
  }
}

List<GetTechModel> convertJsonToList(String json) {
  // Decode the JSON string.
  final decodedJson = jsonDecode(json);

  // Create a list to store the converted JSON data.
  final userList = <GetTechModel>[];

  // Iterate over the decoded JSON data and add each element to the list.
  for (final item in decodedJson) {
    userList.add(GetTechModel.fromJson(item));
  }

  // Return the list.
  return userList;
}
