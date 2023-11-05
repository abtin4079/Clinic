import 'package:get/get.dart';

class CreateNewProcessController extends GetxController {

  String full_name_pat = '';
  String patiant_id = '';

  String tech_id = '';
  String full_name_tech = '';
  String profile_url = '';

  String tech_id_2 = '';
  String full_name_tech_2 = '';
  String profile_url_2 = '';

  void fetchTechIdAndName(String fullName, String techId, String profileUrl) async {
    tech_id = techId;
    update();
    full_name_tech = fullName;
    update();
    profile_url = profileUrl;
    update();
  }

  void fetchTechIdAndName_tech2(String fullName, String techId, String profileUrl) async {
    tech_id_2 = techId;
    update();
    full_name_tech_2 = fullName;
    update();
    profile_url_2 = profileUrl;
    update();
  }

  void fetchPatiantIdAndName(String fullName, String patiantId) async {
    patiant_id = patiantId;
    update();
    full_name_pat = fullName;
    update();
  }



}