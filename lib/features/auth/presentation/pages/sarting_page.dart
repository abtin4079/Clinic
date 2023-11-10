import 'package:flutter/material.dart';

import '../../../../themes/colors.dart';
import '../../controller/initial_check.dart';

class StartingPage extends StatefulWidget {
  const StartingPage({Key? key}) : super(key: key);

  @override
  State<StartingPage> createState() => _StartingPageState();
}

class _StartingPageState extends State<StartingPage> {
  @override
  void initState() {
    // Call super.initState() first.
    Future.delayed(const Duration(seconds: 5), () {});
    super.initState();
    initialCheck();
    // Your one-time initialization code for the root widget goes here.
    // This code will run when the app is first launched.
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
