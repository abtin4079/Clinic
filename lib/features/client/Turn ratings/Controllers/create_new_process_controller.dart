import 'dart:convert';
import 'package:clinic/features/client/NavigationBar/navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

import '../Models/process_module.dart';

class CreateNewProcessController extends GetxController {
  TextEditingController tarmo1Controller = TextEditingController();
  TextEditingController tarmo2Controller = TextEditingController();

  String full_name_pat = '';
  String patiant_id = '';

  String tech_id = '';
  String full_name_tech = '';
  String profile_url = '';

  String tech_id_2 = '';
  String full_name_tech_2 = '';
  String profile_url_2 = '';
  final visitDate = DateTime.now().toIso8601String();

  void fetchTechIdAndName(
      String fullName, String techId, String profileUrl) async {
    tech_id = techId;
    update();
    full_name_tech = fullName;
    update();
    profile_url = profileUrl;
    update();
  }

  void fetchTechIdAndName_tech2(
      String fullName, String techId, String profileUrl) async {
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

  Future<void> registerNewProcess1( String? operation) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    try {
      String? accessToken = prefs.getString('access_token');

      var headers = {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $accessToken'
      };
      print(2);
      // creating the body
      List<Map<String, String>> processes = [
        {
          "hair_count": tarmo1Controller.text,
          "operation": "کاشت مو",
          "pationt_id": patiant_id,
          "technecian_id": tech_id,
          "visit_date": visitDate,
        }
      ];

      String jsonBody = json.encode({"processes": processes});

      final databody = {
        "processes": [
          {
            "hair_count": tarmo1Controller.text,
            "operation": operation,
            "pationt_id": patiant_id,
            "technecian_id": tech_id,
            "visit_date": visitDate,
          }
        ]
      };

      var host = dotenv.env['HOST'];
      // creating out url
      var uri =
          Uri.http(host! , '/clinic/new_process/create_new_process');
      print(3);
      var response =
          await http.post(uri, body: jsonEncode(databody), headers: headers);
      print(4);
      print('pationt_id is : ${patiant_id}');
      print('tech_id is : ${tech_id}');
      print("date time is : ${visitDate}");
      print("tech name is : ${full_name_tech}");
      print("pationt name is : ${full_name_pat}");
      print("controller tar mo: ${tarmo1Controller.text}");
      print(response.statusCode);
      if (response.statusCode == 200) {
        print(response.body);
        Get.off(() => const ClientPage());
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
      print(e.toString());
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
  }

  Future<void> registerNewProcess2( String? operation1, String? operation2) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    try {
      String? accessToken = prefs.getString('access_token');

      var headers = {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $accessToken'
      };
      print(2);
      // creating the body

      final databody = {
        "processes": [
          {
            "hair_count": tarmo1Controller.text,
            "operation": operation1,
            "pationt_id": patiant_id,
            "technecian_id": tech_id,
            "visit_date": visitDate,
          },
          {
            "hair_count": tarmo2Controller.text,
            "operation": operation2,
            "pationt_id": patiant_id,
            "technecian_id": tech_id_2,
            "visit_date": visitDate,
          }
        ]
      };


      // creating out url
      var uri =
      Uri.http('185.221.237.51', '/clinic/new_process/create_new_process');
      print(3);
      var response =
      await http.post(uri, body: jsonEncode(databody), headers: headers);
      print(4);
      print('pationt_id is : ${patiant_id}');
      print('tech_id is : ${tech_id}');
      print('tech_id2 is : ${tech_id_2}');
      print("date time is : ${visitDate}");
      print("pationt name is : ${full_name_pat}");
      print("controller tar mo: ${tarmo1Controller.text}");
      print("controller tar mo2: ${tarmo2Controller.text}");
      print(response.statusCode);
      if (response.statusCode == 200) {
        print(response.body);
        Get.off(ClientPage());
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
      print(e.toString());
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
  }
}
