import 'dart:convert';

import 'package:clinic/features/auth/controller/shared_preference.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class RefreshTokenController extends GetxController {
  Future<void> getNewAccessToken() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    try {
      var headers = {'Content-Type': 'application/json'};

      // gertting the refresh token
      String? refreshToken = prefs.getString('refresh_token');

      final queryParameters = {
        'refresh_token': refreshToken,
      };
      var host = dotenv.env['HOST'];
      var uri =
          Uri.http(host! , '/auth/refresh_token', queryParameters);

      var response = await http.post(uri, headers: headers);
      print(response.statusCode);
      if (response.statusCode == 200) {
        print(response.body);
        final json = jsonDecode(response.body);
        var access_token = json['access_token'];
        var refresh_token = json['refresh_token'];

        // updating the access token and refresh token
        addStringToSP("access_token", access_token, "refresh_token", refresh_token);


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
