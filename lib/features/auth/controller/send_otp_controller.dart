import 'dart:convert';
import 'package:clinic/features/auth/presentation/pages/login_second_page.dart';
import 'package:clinic/features/auth/presentation/pages/sarting_page.dart';
import 'package:clinic/features/auth/utils/api_endpoint.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

import '../../../themes/colors.dart';

class SendOTPController extends GetxController {
  TextEditingController phonenumberController = TextEditingController();
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  Future<void> registerwithphone() async {
    try {
      var headers = {'Content-Type': 'application/json'};

      var host = dotenv.env['HOST'];
      var uri = Uri.http(host!, '/auth/sendotp');

      Map<dynamic, String> body = {
        'phone_number': phonenumberController.text,
      };

      var response = await http.post(uri, body: jsonEncode(body), headers: headers);

      if (response.statusCode == 200) {
        final json = jsonDecode(response.body);
        var message = json['message'];
        print(message);
        final SharedPreferences? prefs = await _prefs;
        await prefs?.setString('message', message);
        // phonenumberController.clear();
        Get.to(LoginSecondPage(), arguments: phonenumberController.text);
      } else {
        throw jsonDecode(response.body)["detail"] ?? "unknown error occured";
      }
    } catch (e) {
      Get.to(StartingPage());
      print(e.toString());
      showDialog(
          context: Get.context!,
          builder: (context) {
            return Directionality(
              textDirection: TextDirection.rtl,
              child: SimpleDialog(
                title: Center(child: Text('خطا')),
                contentPadding: EdgeInsets.all(20),
                children: [
                  Center(child: Text("شماره ی وارد شده موجود نمی باشد", style: TextStyle(
                    fontSize: 16,
                    color: Colors.red
                  ),))
                ],
              ),
            );
          });
    }
  }
}
