import 'dart:io';
import 'package:clinic/features/auth/controller/initial_check.dart';
import 'package:clinic/features/auth/presentation/pages/sarting_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'features/auth/presentation/pages/login_first_page.dart';
import 'themes/http_certificate_maneger.dart';
void main() {
  HttpOverrides.global = new MyHttpOverrides();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // @override
  // void initState() {
  //   Call super.initState() first.
   // Future.delayed(const Duration(seconds: 5), () {});
   // super.initState();
   // initialCheck();
  // Your one-time initialization code for the root widget goes here.
    // This code will run when the app is first launched.
  // }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
       // colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
       // useMaterial3: true,
        fontFamily: 'peyda',

      ),
      home: StartingPage(),
    );
  }
}
