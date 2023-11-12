import 'dart:async';

import 'package:clinic/features/auth/presentation/pages/login_first_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../../themes/colors.dart';
import '../../controller/initial_check.dart';

class StartingPage extends StatefulWidget {
  const StartingPage({Key? key}) : super(key: key);

  @override
  State<StartingPage> createState() => _StartingPageState();
}

class _StartingPageState extends State<StartingPage> {

  int _delaySecond = 3;

  @override
  void initState() {
    super.initState();
    _delayPage();
    // Simulating a 2-second delay before navigating to the main screen
  }
  _delayPage() async{
    var _duration = Duration(seconds: _delaySecond);
    return Timer(_duration, () => initialCheck());
  }


  @override
  Widget build(BuildContext context) {
    final screenheight = MediaQuery.of(context).size.height;
    final height_figma = 926;
    final screenwidth = MediaQuery.of(context).size.width;
    final width_figma = 428;
    return Container(
      decoration:  BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.centerRight,
          end: Alignment.centerLeft,
          colors: [LightBlue, White],
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Container(
          width: double.maxFinite,
          height: double.maxFinite,
          child: Directionality(
            textDirection: TextDirection.rtl,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 120,
                  height: 120,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(24),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(24),
                    child: Image.asset(
                      "lib/features/auth/presentation/images/a-neur.png",
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                SizedBox(
                  height: screenheight / height_figma * 16,
                ),
                Padding(
                  padding: EdgeInsets.only(
                    right: screenwidth / width_figma * 52
                  ),
                  child: Text("به سامانه مدیریت تکنسین های جدید خوش آمدید", style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 20,
                    color: Colors.white
                  ),),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
