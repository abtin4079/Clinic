import 'package:clinic/features/auth/controller/login_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../Models/list_of_process.dart';

class RemoteService {
  static var client = http.Client();

  static Future<List<Item>?> fetchProcesses() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    try {
      // getting token from share preferences
      String? accessToken = prefs.getString('access_token');
      print(accessToken);

      // initialize the header
      var headers = {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $accessToken'
      };

      // initialized the query
      final queryParameters = {
        'year': '1402',
        'month': '10',
        'day': '17',
        'page': '1',
        'per_page': '10',
      };

      // creating out url
      var uri = Uri.http('185.221.237.51',
          '/clinic/supervisor_home_page/list_of_processes', queryParameters);

      var response = await client.get(uri, headers: headers);
      print(response.body);
      if (response.statusCode == 200) {
        var jsonString = response.body;
        final listOfProcess = listOfProcessFromJson(jsonString);
        print(listOfProcess.items);
        return listOfProcess.items;
      }
      if (response == 400){
        print(response.body);
        return null;
      }
      if (response == 403){
        print(response.body);
        return null;
      }
      if (response == 500){
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
