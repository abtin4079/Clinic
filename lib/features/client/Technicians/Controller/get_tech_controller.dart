import 'package:clinic/features/client/Technicians/Models/get_tech_model.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../Models/search_tech_model.dart';

class GetTechController extends GetxController {
  RxList<GetTechModel> get_tech_list = <GetTechModel>[].obs;

  // var tech_list = List<SearchTechModel>().obs;

  Future<void> fetchTech() async {
    // var tech_page_search_item = await RemoteSerice3.fetchPatients(searchController.text);
    RemoteSericeGetTech.fetchTechs().then((value) {
      if (value == null) {
      } else {
        var castedTechList = value as List<GetTechModel>;
        get_tech_list.value = castedTechList;
        update();
      }
    });
  }
}

class RemoteSericeGetTech {
  static var client = http.Client();

  static Future<List<GetTechModel>?> fetchTechs() async {
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
        'page': '1',
        'per_page': '10',
      };
      var host = dotenv.env['HOST'];
      var uri = Uri.http(
          host! ,
          '/clinic/supervisor_technecian_page/get_list_of_technecians',
          queryParameters);

      var response = await http.get(uri, headers: headers);
      print(response.statusCode);
      if (response.statusCode == 200) {
        print(response.body);
        var jsonString = response.body;
        if (jsonString == null) {
          return <GetTechModel>[];
        }
        var getTechModelList = convertJsonToListForGet(jsonString);
        print(getTechModelList);
        return getTechModelList;
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
