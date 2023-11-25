import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:get/get.dart';
import 'package:clinic/features/technicians/ZibajoyanMan/models/approved_appointments.dart';
import 'package:clinic/features/technicians/ZibajoyanMan/controllers/zinajo_middle_page_controller.dart';
import 'package:clinic/features/technicians/ZibajoyanMan/models/each_approved_appointment.dart';
import 'package:clinic/features/technicians/ZibajoyanMan/presentation/pages/zibajo_page_2.dart';
import 'package:clinic/features/technicians/Shoroefarayand/presentation/pages/shoroe_farayand_page_1.dart';
import 'package:clinic/features/technicians/Shoroefarayand/presentation/pages/shoroe_farayand_page_2.dart';

class MiddleZibajoPage extends StatefulWidget {
  @override
  _MiddleZibajoPage createState() => _MiddleZibajoPage();
}

class _MiddleZibajoPage extends State<MiddleZibajoPage> {
  ZibajoyanManMiddlePageController zibajoyanManMiddlePageController =
      Get.put(ZibajoyanManMiddlePageController());

  @override
  void initState() {
    super.initState();
    navigateBasedOnStatus();
  }

  void navigateBasedOnStatus() async {
    ApprovedAppointment approvedAppointment =
        Get.arguments as ApprovedAppointment;

    try {
      EachApprovedAppointments? result = await zibajoyanManMiddlePageController
          .getEachAppointment(approvedAppointment.id.toString());

      if (result != null) {
        switch (result.status) {
          case 'created':
            Get.off(ZibajoPage2(), arguments: result);
            break;
          case 'started':
            Get.off(ShoroyeFarayandPage1(), arguments: result);
            break;
          case 'ended':
            Get.off(ShoroyeFarayandPage2(), arguments: result);
            break;
          default:
          // Handle other cases if needed
        }
      }
    } catch (e) {
      print('Error navigating: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
