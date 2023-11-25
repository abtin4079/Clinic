import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'package:clinic/features/technicians/utils/token_check.dart';

import 'package:clinic/features/technicians/ZibajoyanMan/models/approved_appointments.dart';
import 'package:clinic/features/technicians/Profile/models/profile.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class ProfileController extends GetxController {
  Future<TechProfile?> getTechnecianProfile() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();

    return tokenCheckBeforeRequest().then((value) async {
      try {
        // getting token from share preferences

        String? accessToken = pref.getString('access_token');

        // initialize the header
        var headers = {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $accessToken'
        };

        var host = dotenv.env['HOST'];
        // creating out url
        var uri = Uri.http(host!, '/auth/get_technecian_profile');

        var response = await http.get(
          uri,
          headers: headers,
        );

        if (response.statusCode == 200) {
          final decodedJson = jsonDecode(response.body);
          return TechProfile.fromJson(decodedJson);
        } else {
          showDialog(
              context: Get.context!,
              builder: (context) {
                return SimpleDialog(
                  title: Text('Error'),
                  contentPadding: EdgeInsets.all(20),
                  children: [Text(response.statusCode.toString())],
                );
              });
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
