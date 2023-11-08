import 'dart:html';
import 'package:clinic/features/Calender/calnerder.dart';
import 'package:clinic/features/auth/controller/initial_check.dart';
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
import 'features/client/Turn ratings/Select_Tech/presentation/pages/select_tech_page_3.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    // Call super.initState() first.
    super.initState();
    initialCheck();
    // Your one-time initialization code for the root widget goes here.
    // This code will run when the app is first launched.
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
       // colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
       // useMaterial3: true,
        fontFamily: 'peyda',

      ),
      home: LoginFirstPage(),
    );
  }
}
