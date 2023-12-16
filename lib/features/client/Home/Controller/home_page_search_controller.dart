import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../Models/home_page_search_model.dart';
class HomePageSearchController extends GetxController {
  TextEditingController searchController = TextEditingController();

  RxList<Item> items = <Item>[].obs;

  void fetchPatient() async {
    var home_page_search_item =
    await RemoteSerice2.fetchPatients(searchController.text);
    searchController.clear();

    print(home_page_search_item);
    if (home_page_search_item != null) {
      items.value = home_page_search_item as List<Item>;
    }
  }


}

class RemoteSerice2 {
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
      var host = dotenv.env['HOST'];
      var uri = Uri.http(host! , '/clinic/supervisor_home_page/search_processes',
          queryParameters);

      var response = await http.get(uri, headers: headers);
      print(response.statusCode);
      if (response.statusCode == 200) {
        print(response.body);
        var jsonString = response.body;
        final homePageSearchList = homePageSearchModelFromJson(jsonString);
        print(homePageSearchList.items);
        return homePageSearchList.items;
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
