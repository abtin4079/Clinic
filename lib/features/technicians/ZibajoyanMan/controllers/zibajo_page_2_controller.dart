import 'dart:async';
import 'dart:convert';
import 'package:clinic/features/technicians/ZibajoyanMan/models/each_approved_appointment.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'package:clinic/features/technicians/utils/token_check.dart';
import 'package:clinic/features/technicians/Shoroefarayand/presentation/pages/shoroe_farayand_page_1.dart';

import 'package:clinic/features/technicians/ZibajoyanMan/models/approved_appointments.dart';

class ZibajoyanManSecondPage extends GetxController {
  Future startTheProcess(EachApprovedAppointments approvedAppointment) async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    tokenCheckBeforeRequest().then((value) async {
      String? accessToken = pref.getString('access_token');

      // initialize the header
      var headers = {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $accessToken'
      };

      var processId = approvedAppointment.id.toString();

      var host = dotenv.env['HOST'];
      // creating out url
      var uri = Uri.http(host! ,
          '/clinic/technecian_approved_appointments/start_process/$processId/');

      var response = await http.put(
        uri,
        headers: headers,
      );
      if (response.statusCode == 200) {
        print(response.body);
        // Get.to(ShoroyeFarayandPage1(), arguments: approvedAppointment);
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
    });
  }
}
