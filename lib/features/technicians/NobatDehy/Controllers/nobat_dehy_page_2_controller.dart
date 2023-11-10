import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'package:clinic/features/technicians/utils/token_check.dart';

import '../presentation/pages/nobat_dehy_page_1.dart';
import 'package:clinic/features/technicians/NobatDehy/Models/each_nobat.dart';

class NobatDehiSecondPageController extends GetxController {
  Future<EachNobat?> getFullDataOnAppointment(String nobatId) async {
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

      // creating out url
      var uri = Uri.http(
        '185.221.237.51',
        '/clinic/technecian_appointments/get_process_by_id/$nobatId/',
      );

      var response = await http.get(
        uri,
        headers: headers,
      );

      if (response.statusCode == 200) {
        print(response.body);
        return convertJsonToItem(response.body);
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

  Future<bool> acceptOrRejectProcess(bool state, String nobatId) async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    try {
      tokenCheckBeforeRequest();
    } catch (e) {
      return false;
    }
    try {
      // getting token from share preferences
      var state_to_request = '';
      if (state == false) {
        state_to_request = 'false';
      } else {
        state_to_request = 'true';
      }

      String? accessToken = pref.getString('access_token');

      // initialize the header
      var headers = {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $accessToken'
      };

      // creating out url
      var uri = Uri.http(
        '185.221.237.51',
        '/clinic/technecian_appointments/approve_reject_process/$nobatId/$state_to_request/',
      );

      var response = await http.put(
        uri,
        headers: headers,
      );

      if (response.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      return false;
    }
  }
}
