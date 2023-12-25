import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import '../../../technicians/utils/token_check.dart';
import '../Models/process_model_client.dart';

class FirstPageClientProcessesController extends GetxController {

  // updating the data of process info with obs
  RxList<ProcessModuleClient> process_info = <ProcessModuleClient>[].obs;

  void fetchInformation() async {
    var process_page_client_item = await getProcess();

    var castedTechList = process_page_client_item as List<ProcessModuleClient>;

    process_info.value = castedTechList ;
    update();
  }
  Future<ProcessModuleClient?> getProcess() async {

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
            '/clinic/supervisor_home_page/list_of_processes');

        var response = await http.get(uri, headers: headers);
        print(411);
        print(response.statusCode);
        print(response.body);
        if (response.statusCode == 200) {
          var jsonString = json.decode(response.body);
          final process = ProcessModuleClient.fromJson(jsonString);
          return process;
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