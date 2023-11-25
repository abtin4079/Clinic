class TechProfile {
  String? phone;
  String? nationalCode;
  String? name;

  TechProfile({
    this.phone,
    this.nationalCode,
    this.name,
  });

  TechProfile.fromJson(Map<String, dynamic> json) {
    name = json['fullname'];
    phone = json['phone_number'];
    nationalCode = json['national_card_number'];
  }
}
