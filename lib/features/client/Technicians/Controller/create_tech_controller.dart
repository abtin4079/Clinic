import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

import '../presentation/pages/tech1.dart';

class CreateTechController extends GetxController {

  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController cardIdController = TextEditingController();

  Future<void> getNewTech() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    try{
      // getting token from share preferences
      String? accessToken = pref.getString('access_token');

      // initialize the header
      var headers = {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $accessToken'
      };

      // creating out url
      var uri = Uri.http('185.221.237.51',
          '/auth/supervisor_technecian_page/create_new_technecian');

      Map<dynamic, String> body = {
          "fullname": nameController.text,
          "phone_number": phoneController.text,
          "national_card_number": cardIdController.text,

      };

      var response = await http.post(uri, body: jsonEncode(body), headers: headers);

      if(response.statusCode == 200){
        print(response.body);
        Get.off(Tech1());
        return null;
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

    }catch(e){
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
  }
}