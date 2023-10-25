import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../Select_Tech/presentation/pages/select_tech_page_1.dart';

class NewPatientController extends GetxController {
  static var client = http.Client();

  TextEditingController nameController = TextEditingController();
  TextEditingController idController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();

  Future<void> registerNewPatient() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    try {
      String? accessToken = prefs.getString('access_token');

      var headers = {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $accessToken'
      };

      // creating the body

      Map<dynamic, String> body = {
        "full_name": nameController.text,
        "national_code": idController.text,
        "phone_number": phoneNumberController.text,
      };

      // creating out url
      var uri =
          Uri.http('185.221.237.51', '/clinic/new_process/create_new_pationt');

      var response =
          await http.post(uri, headers: headers, body: jsonEncode(body));
      if(response.statusCode == 200){
        print(response.body);

        Get.off(SelectTechPage1());

        nameController.clear();
        idController.clear();
        phoneNumberController.clear();
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
