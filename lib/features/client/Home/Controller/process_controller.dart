import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:clinic/features/technicians/utils/token_check.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:clinic/features/client/Home/Models/full_process.dart';
import 'dart:convert';

class ProcessController extends GetxController {
  Future<FullProcess?> getProcessById(String processID) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return tokenCheckBeforeRequest().then((value) async {
      try {
        // getting token from share preferences
        String? accessToken = prefs.getString('access_token');

        // initialize the header
        var headers = {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $accessToken'
        };
        var host = dotenv.env['HOST'];
        // creating out url
        var uri = Uri.http(host!,
            '/clinic/supervisor_home_page/get_process_by_id/$processID/');

        var response = await http.get(uri, headers: headers);
        print(response.body);
        if (response.statusCode == 200) {
          var jsonString = json.decode(response.body);
          final process = FullProcess.fromJson(jsonString);
          return process;
        } else {
          print(response.body);
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

  Future<bool> changeHairCount(String processId, String hairCount) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return tokenCheckBeforeRequest().then((value) async {
      try {
        // getting token from share preferences
        String? accessToken = prefs.getString('access_token');

        // initialize the header
        var headers = {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $accessToken'
        };
        var host = dotenv.env['HOST'];
        // creating out url
        var uri = Uri.http(host!,
            '/clinic/supervisor_home_page/update_hair_count/$processId/$hairCount/');

        var response = await http.put(uri, headers: headers);
        print(response.body);
        if (response.statusCode == 200) {
          return true;
        } else {
          print(response.body);
          return false;
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
        return false;
      }
    });
  }

  Future<bool> acceptProcess(String processId) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return tokenCheckBeforeRequest().then((value) async {
      try {
        // getting token from share preferences
        String? accessToken = prefs.getString('access_token');

        // initialize the header
        var headers = {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $accessToken'
        };
        var host = dotenv.env['HOST'];
        // creating out url
        var uri = Uri.http(
            host!, '/clinic/supervisor_home_page/confirm_process/$processId/');

        var response = await http.put(uri, headers: headers);
        print(response.body);
        if (response.statusCode == 200) {
          return true;
        } else {
          print(response.body);
          return false;
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
        return false;
      }
    });
  }
}
