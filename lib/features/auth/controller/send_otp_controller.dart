import 'dart:convert';
import 'package:clinic/features/auth/presentation/pages/login_second_page.dart';
import 'package:clinic/features/auth/utils/api_endpoint.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class SendOTPController extends GetxController{

  TextEditingController phonenumberController = TextEditingController();
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();


  Future<void> registerwithphone() async {
    try{
      var headers = {'Content-Type' : 'application/json'};
     // var uri = Uri.https( 'http://185.221.237.51/auth', '/sendotp' );
      var uri = Uri.http('185.221.237.51', '/auth/sendotp');
    //  Uri url = Uri.parse("http://185.221.237.51/auth/sendotp");
    //  Uri url1 = Uri.parse("http://185.221.237.51/clinic/images/test.jpg");

      Map<dynamic, String> body = {
        'phone_number': phonenumberController.text,
      };

      var response = await http.post(uri, body: jsonEncode(body), headers: headers);

      if(response.statusCode == 200){
        final json = jsonDecode(response.body);
        var message = json['message'];
        print(message);
        final SharedPreferences ? prefs = await _prefs ;
        await prefs ?.setString('message', message);
       // phonenumberController.clear();
        Get.off(LoginSecondPage());
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

