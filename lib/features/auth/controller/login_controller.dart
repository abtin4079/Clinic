import 'dart:convert';
import 'package:clinic/features/auth/controller/refresh_token_controller.dart';
import 'package:clinic/features/auth/controller/send_otp_controller.dart';
import 'package:clinic/features/client/Home/Controller/remote_service.dart';
import 'package:clinic/features/client/NavigationBar/navigation_bar.dart';
import 'package:clinic/features/technicians/NavigationBar/navigation_bar_for_tech.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../utils/api_endpoint.dart';
import 'package:http/http.dart' as http;

class LoginController extends GetxController {

  TextEditingController otpcontroller = TextEditingController();
  final SendOTPController sendOTPController = Get.put(SendOTPController());


  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  Future<void> loginwithphone() async {
    try{
      var headers = {'Content-Type' : 'application/json'};

      var uri = Uri.http('185.221.237.51', '/auth/login');

      Map<dynamic, String> body = {
        'phone_number': sendOTPController.phonenumberController.text,
        'otp': otpcontroller.text
      };

      var response = await http.post(uri, body: jsonEncode(body), headers: headers);

      if(response.statusCode == 200){
        final json = jsonDecode(response.body);
        var access_token = json['access_token'];
        var refresh_token = json['refresh_token'];
        var user = json['user'];

        print(user);
        if(user == 'Supervisor'){
          Get.off(ClientPage());
        } else {
          Get.off(Techpages());
        }

        final SharedPreferences ? prefs = await _prefs ;

        await prefs ?.setString('access_token', access_token);
        await prefs ?.setString('refresh_token', refresh_token);

        // testing that if the access_token and refresh_token is saved or not in the console
        String? thhr = prefs?.getString('access_token');
        print(thhr);
        otpcontroller.clear();
        sendOTPController.phonenumberController.clear();
      }
      else{
        throw jsonDecode(response.body)["detail"] ?? "unknown error occured" ;
      }

    }catch (e){
      Get.back();
      print(e.toString());
      showDialog(context: Get.context!, builder: (context){
        return SimpleDialog(
          title: Text('Error'),
          contentPadding: EdgeInsets.all(20),
          children: [
            Text(e.toString())
          ],
        );
      });
    }
  }
}