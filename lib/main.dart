import 'dart:io';
import 'package:clinic/features/auth/presentation/pages/login_first_page.dart';
import 'package:clinic/features/auth/presentation/pages/sarting_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'themes/http_certificate_maneger.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

Future<void> main() async {
  await dotenv.load(fileName: "lib/.env");
  WidgetsFlutterBinding.ensureInitialized();
  HttpOverrides.global = new MyHttpOverrides();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

// testing the pushing to git hub
class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
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
