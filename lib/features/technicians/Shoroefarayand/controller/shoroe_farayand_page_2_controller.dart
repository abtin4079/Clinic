import 'dart:async';
import 'dart:convert';
import 'package:clinic/features/technicians/ZibajoyanMan/models/each_approved_appointment.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'package:clinic/features/technicians/utils/token_check.dart';
import 'package:clinic/features/technicians/Shoroefarayand/presentation/pages/shoroe_farayand_page_2.dart';
import 'dart:io';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class ShoroFarayandSecondPageController extends GetxController {
  Future<bool> saveProcess(EachApprovedAppointments approvedAppointment) async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    return tokenCheckBeforeRequest().then((value) async {
      String? accessToken = pref.getString('access_token');

      // Initialize the headers
      var headers = {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $accessToken',
      };

      var processId = approvedAppointment.id.toString();
      // Creating our URL
      var host = dotenv.env['HOST'];
      var uri = Uri.http(host!,
          '/clinic/technecian_approved_appointments/save_process/$processId/');

      var response = await http.put(
        uri,
        headers: headers,
      );
      if (response.statusCode == 200) {
        // Get.to(ShoroyeFarayandPage2(), arguments: approvedAppointment);
        return true;
      } else {
        showDialog(
          context: Get.context!,
          builder: (context) {
            return SimpleDialog(
              title: Text('Error'),
              contentPadding: EdgeInsets.all(20),
              children: [Text(response.statusCode.toString())],
            );
          },
        );
        return false;
      }
    });
  }

  void _showErrorDialog(String errorMessage) {
    showDialog(
      context: Get.context!,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Error'),
          content: Text(errorMessage),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }
}
