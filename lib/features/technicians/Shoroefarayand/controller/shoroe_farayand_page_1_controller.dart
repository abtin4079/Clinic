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

class ShoroFarayandFirstPageController extends GetxController {
  final RxList<String> beforeProcessImages = <String>[].obs;
  final RxList<String> afterProcessImages = <String>[].obs;

  Future endProcess(EachApprovedAppointments approvedAppointment) async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    tokenCheckBeforeRequest().then((value) async {
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
          '/clinic/technecian_approved_appointments/end_process/$processId/');

      var response = await http.put(
        uri,
        headers: headers,
      );
      if (response.statusCode == 200) {
        print(response.body);
       // Get.to(ShoroyeFarayandPage2(), arguments: approvedAppointment);
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
      }
    });
  }

  Future<String> addImage(
      File imageFile, bool isBeforeProcess, String processId2) async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    return tokenCheckBeforeRequest().then((value) async {
      String? accessToken = pref.getString('access_token');

      // Initialize the headers
      var headers = {
        'Content-Type': 'multipart/form-data',
        'Authorization': 'Bearer $accessToken',
      };

      var processId = processId2;
      var processType = isBeforeProcess ? 'before_process' : 'after_process';

      // Creating our URL
      var host = dotenv.env['HOST'];
      var uri = Uri.http(host!,
          '/clinic/technecian_approved_appointments/add_process_photo/$processType/$processId/');

      var request = http.MultipartRequest('POST', uri);
      request.headers.addAll(headers);
      request.files.add(
        await http.MultipartFile.fromPath('images', imageFile.path),
      );

      try {
        var response = await request.send();
        var responseData = await response.stream.bytesToString();

        if (response.statusCode == 200) {
          final json = jsonDecode(responseData);
          // Update the state based on process type
          return json["items"][0]["filename"];
        } else {
          print(responseData);
          _showErrorDialog('Error uploading image: $responseData');
          return "";
        }
      } catch (error) {
        print('Error uploading image: $error');
        _showErrorDialog('Error uploading image: $error');
        return "";
      }
    });
  }

  Future<bool> deleteImage(
      String imageFilename, bool isBeforeProcess, String processId2) async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    return tokenCheckBeforeRequest().then((value) async {
      String? accessToken = pref.getString('access_token');

      // Initialize the headers
      var headers = {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $accessToken',
      };

      var processId = processId2;
      var processType = isBeforeProcess ? 'before_process' : 'after_process';

      // Creating our URL
      var host = dotenv.env['HOST'];
      var uri = Uri.http(host!,
          '/clinic/technecian_approved_appointments/delete_process_photo/$processType/$processId/$imageFilename/');

      var response = await http.delete(
        uri,
        headers: headers,
      );
      if (response.statusCode == 200) {
        print(response);
        return true;
      } else {
        print(response.body.toString());
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
        return false; // Return false in case of an error
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
