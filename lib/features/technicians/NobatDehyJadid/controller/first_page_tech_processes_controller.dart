import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import '../../utils/token_check.dart';
import '../model/main_tech_model.dart';

class FirstPageTechProcessesController extends GetxController {

  RxList<MainTechModel> process_tech_info = <MainTechModel>[].obs;

  void fetchTechInformation() async {
    var process_page_client_item = await getTechProcess();

    var castedTechList = process_page_client_item as List<MainTechModel>;

    process_tech_info.value = castedTechList ;
    update();
  }

  Future<List<MainTechModel>?> getTechProcess() async {

    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return tokenCheckBeforeRequest().then((value) async {
      try {
        // getting token from share preferences
        String? accessToken = prefs.getString('access_token');

        // initialize the header
        var headers = {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $accessToken'
        };
        var host = dotenv.env['HOST'];
        // creating out url
        var uri = Uri.http(host!,
            '/clinic/technecian_home_page');

        var response = await http.get(uri, headers: headers);
        print(412);
        print(response.statusCode);
        print(response.body);
        if (response.statusCode == 200) {
          var jsonString = json.decode(response.body);
          final process = MainTechModel.fromJson(jsonString);
          return [process];
        } else {
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
        return null;
      }
    });
  }

}