import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../Models/get_tech_model.dart';
class SelectTechByIdController extends GetxController {

  String full_name = '';
  String ID = '';
  String profileUri = '';

  RxList<GetTechModel> tech_info = <GetTechModel>[].obs;

  void fetchIdAndName(String name, String id, String profileuri) async {
    full_name = name;
    ID = id;
    profileUri = profileuri ;
  }


  void fetchPatient() async {
    var tech_page_search_item = await RemoteSerice4.fetchPatients(ID);

    var castedTechList = tech_page_search_item as List<GetTechModel>;

    tech_info.value = castedTechList ;
    update();
  }

}

class RemoteSerice4 {
  static var client = http.Client();

  static Future<List<GetTechModel>?> fetchPatients(String ID) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    try {
      // getting token from share preferences
      String? accessToken = prefs.getString('access_token');

      // initialize the header
      var headers = {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $accessToken'
      };

      var host = dotenv.env['HOST'];
      var uri = Uri.http(host! , '/auth/technecian_by_id/$ID');

      var response = await http.get(uri, headers: headers);
      print(response.statusCode);
      if (response.statusCode == 200) {
        print(response.body);
        var jsonString = response.body;
        if (jsonString == []) {
          return <GetTechModel>[];
        }
        var searchTechModelList = convertJsonToList(jsonString);
        print(searchTechModelList);
        return searchTechModelList ;
      }
      if (response.statusCode == 400) {
        print(response.body);
        return null;
      }
      if (response.statusCode == 403) {
        print(response.body);
        return null;
      }
      if (response.statusCode == 500) {
        print(response.body);
        return null;
      }
    } catch (e) {
      Get.back();
      showDialog(
          context: Get.context!,
          builder: (context) {
            return SimpleDialog(
              title: Text('Error'),
              contentPadding: EdgeInsets.all(20),
              children: [Text(e.toString())],
            );
          });
    }
    return null;
  }
}