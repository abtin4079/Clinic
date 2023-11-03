import 'dart:html';
import 'package:clinic/features/Calender/calnerder.dart';
import 'package:clinic/features/auth/presentation/pages/login_second_page.dart';
import 'package:clinic/features/client/Technicians/presentation/pages/tech_profile.dart';
import 'package:clinic/features/client/Turn%20ratings/Select_Tech/presentation/pages/select_tech_page_2.dart';
import 'package:clinic/features/technicians/NavigationBar/navigation_bar_for_tech.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'features/Calender/calender_v2.dart';
import 'features/auth/presentation/pages/login_first_page.dart';
import 'features/client/Home/presentation/pages/plant_info.dart';
import 'features/client/NavigationBar/navigation_bar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});




  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
       // colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
       // useMaterial3: true,
        fontFamily: 'peyda',

      ),
      home: SelectTechPage2(),
    );
  }
}
