import 'package:clinic/features/auth/presentation/pages/login_second_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'features/auth/presentation/pages/login_first_page.dart';
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





        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: ClientPage(),
    );
  }
}
