import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'package:clinic/features/technicians/utils/token_check.dart';

import 'package:clinic/features/technicians/ZibajoyanMan/models/approved_appointments.dart';

class ZibajoyanManFirstPage extends GetxController {
  Future<List<ApprovedAppointment>?> getTechApprovedAppointments() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    try {
      tokenCheckBeforeRequest();
    } catch (e) {
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
    try {
      // getting token from share preferences

      String? accessToken = pref.getString('access_token');

      // initialize the header
      var headers = {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $accessToken'
      };

      final queryParameters = {
        'page': '1',
        'per_page': '10',
      };

      // creating out url
      var uri = Uri.http('185.221.237.51',
          '/clinic/technecian_approved_appointments', queryParameters);

      var response = await http.get(
        uri,
        headers: headers,
      );

      if (response.statusCode == 200) {
        print(response.body);
        return convertJsonToList(response.body);
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
    }
  }
}
