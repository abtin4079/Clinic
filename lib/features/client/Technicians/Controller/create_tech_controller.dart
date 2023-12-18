import 'dart:convert';
import 'package:clinic/features/client/Home/presentation/pages/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

import '../../Home/presentation/pages/master_page.dart';
import '../../NavigationBar/navigation_bar.dart';
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
      print(1);
      // initialize the header
      var headers = {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $accessToken'
      };
      var host = dotenv.env['HOST'];
      // creating out url
      var uri = Uri.http(host!,
          '/auth/supervisor_technecian_page/create_new_technecian');

      Map<dynamic, String> body = {
          "fullname": nameController.text,
          "phone_number": phoneController.text,
          "national_card_number": cardIdController.text,

      };

      var response = await http.post(uri, body: jsonEncode(body), headers: headers);
      print(response.statusCode);
      if(response.statusCode == 200){
        print(response.body);
        Get.off(Home());
        return null;
      }
      if (response.statusCode == 400){
        print(response.body);
        return null;
      }
      if (response.statusCode == 403){
        print(response.body);
        return null;
      }
      if (response.statusCode == 500){
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