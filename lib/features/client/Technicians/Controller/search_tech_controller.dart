import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../Models/search_tech_model.dart';
class SearchTechController extends GetxController {
  TextEditingController searchController = TextEditingController();

  RxList<Item> items = <Item>[].obs;

  void fetchPatient() async {
    var tech_page_search_item =
    await RemoteSerice3.fetchPatients(searchController.text);
    searchController.clear();

    print(tech_page_search_item);
    if (tech_page_search_item != null) {
      items.value = tech_page_search_item as List<Item>;
    }
  }


}

class RemoteSerice3 {
  static var client = http.Client();

  static Future<List<Item>?> fetchPatients(String search) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    try {
      // getting token from share preferences
      String? accessToken = prefs.getString('access_token');

      // initialize the header
      var headers = {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $accessToken'
      };

      final queryParameters = {
        'search': search,
        'page': '1',
        'per_page': '1',
      };

      var uri = Uri.http('185.221.237.51', '/clinic/supervisor_home_page/search_processes',
          queryParameters);

      var response = await http.get(uri, headers: headers);
      print(response.statusCode);
      if (response.statusCode == 200) {
        print(response.body);
        var jsonString = response.body;
        final TechPageSearchList = searchTechModelFromJson(jsonString);
        print(TechPageSearchList.items);
        return TechPageSearchList.items;
      }
      if (response == 400) {
        print(response.body);
        return null;
      }
      if (response == 403) {
        print(response.body);
        return null;
      }
      if (response == 500) {
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