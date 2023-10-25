import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../Models/select_patient_model.dart';

class SelectPatientController extends GetxController {
  TextEditingController searchController = TextEditingController();

  RxList<Item> items = <Item>[].obs;

  void fetchPatient() async {
    var patient_feature =
        await RemoteSerice1.fetchPatients(searchController.text);

    print(patient_feature);
    if (patient_feature != null) {
      items.value = patient_feature as List<Item>;
    }
  }
}

class RemoteSerice1 {
  static var client = http.Client();

  static Future<List<Item>?> fetchPatients(String search) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    try {
      // getting token from share preferences
      String? accessToken = prefs.getString('access_token');

      // initialize the header
      var headers = {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $accessToken'
      };

      final queryParameters = {
        'search': search,
        'page': '1',
        'per_page': '10',
      };

      var uri = Uri.http('185.221.237.51', '/clinic/new_process/search_pationt',
          queryParameters);

      var response = await http.get(uri, headers: headers);
      print(response.body);
      if (response.statusCode == 200) {
        var jsonString = response.body;
        final patientFeature = selectPatientModelFromJson(jsonString);
        print(patientFeature.items);
        return patientFeature.items;
      }
      if (response == 400) {
        print(response.body);
        return null;
      }
      if (response == 403) {
        print(response.body);
        return null;
      }
      if (response == 500) {
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
    }
    return null;
  }
}
