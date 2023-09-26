import 'dart:ui';

import 'package:clinic/features/technicians/Shoroefarayand/presentation/pages/shoroe_farayand_page_2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

import '../../../../../themes/colors.dart';
import '../../../../client/NavigationBar/Icons/navigation_bar_icons.dart';
import '../../../Home/presentation/pages/home_for_tech.dart';
import '../../../NavigationBar/Icons/tech_navigation_icons.dart';
import '../../../NavigationBar/navigation_bar_for_tech.dart';
import '../../../Profile/presentation/pages/profile_for_tech.dart';
import '../../../ZibajoyanMan/presentation/pages/zibajo_page_1.dart';

class ShoroyeFarayandPage1 extends StatefulWidget {
  const ShoroyeFarayandPage1({Key? key}) : super(key: key);

  @override
  State<ShoroyeFarayandPage1> createState() => _ShoroyeFarayandPage1State();
}

class _ShoroyeFarayandPage1State extends State<ShoroyeFarayandPage1> {

  int currenttab = 2;
  List<Widget> screens = [
    HomeForTech(),
    ProfileForTech(),
    ZibajoPage1(),
  ];

  final PageStorageBucket bucket = PageStorageBucket();
  Widget currentscreen = ShoroyeFarayandPage1();

  @override
  Widget build(BuildContext context) {
    final screenheight = MediaQuery.of(context).size.height;
    final height_figma = 926;
    final screenwidth = MediaQuery.of(context).size.width;
    final width_figma = 428;

    return Scaffold(
      backgroundColor: backgroundHome,
      appBar: AppBar(
        backgroundColor: backgroundHome,
        elevation: 0,
        centerTitle: true,
        title: Text(
          "زیباجویان من",
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w700,
            color: fontcolor,
          ),
        ),
      ),
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: Padding(
          padding: EdgeInsets.only(
            right: screenwidth / width_figma * 16,
            left: screenwidth / width_figma * 16,
            top: screenheight / screenwidth * 16,
            bottom: screenheight / height_figma * 16,
          ),
          child: Container(
            width: screenwidth / width_figma * 396,
            height: screenheight / height_figma * 659,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16), color: Colors.white),
            child: Padding(
              padding: EdgeInsets.only(
                right: screenwidth / width_figma * 16,
                left: screenwidth / width_figma * 16,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: screenheight / height_figma * 16,
                  ),
                  Center(
                    child: Image.asset(
                        "lib/features/technicians/ZibajoyanMan/Images/gol.png"),
                  ),
                  SizedBox(
                    height: screenheight / height_figma * 8,
                  ),
                  Center(
                    child: Text(
                      "کاشت مو",
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          color: fontcolor,
                          fontFeatures: [FontFeature('ss01', 1),]
                      ),
                    ),
                  ),
                  SizedBox(
                    height: screenheight / height_figma * 8,
                  ),
                  Container(
                    width: screenwidth / width_figma * 364,
                    height: screenheight / height_figma * 36,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(36),
                      gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            LightBlue.withOpacity(0.1),
                            White.withOpacity(0.1)
                          ]),
                    ),
                    child: Center(
                      child: GradientText(
                        "دوشنبه 12 آذر 1402 ساعت 14:30",
                        style: TextStyle(
                            fontWeight: FontWeight.w700, fontSize: 14),
                        colors: [LightBlue, LightBlue],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: screenheight / height_figma * 32,
                  ),
                  Center(
                    child: Text(
                      "تار موی مورد نیاز برای کاشت: 3000 تار مو",
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          color: fontcolor,
                          fontFeatures: [FontFeature('ss01', 1),]
                      ),
                    ),
                  ),
                  SizedBox(
                    height: screenheight / height_figma * 48,
                  ),
                  Text(
                    "افزودن تصویر قبل از کاشت:",
                    style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 14,
                        color: Colors.black,
                        fontFeatures: [FontFeature('ss01', 1),]
                    ),
                  ),
                  SizedBox(
                    height: screenheight / height_figma * 16,
                  ),
                  // Inja bayad Imgage picker bezari
                  SizedBox(
                    height: screenheight / height_figma * 24,
                  ),
                  Text(
                    "افزودن تصویر بعد از کاشت:",
                    style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 14,
                        color: Colors.black,
                        fontFeatures: [FontFeature('ss01', 1),]
                    ),
                  ),
                  SizedBox(
                    height: screenheight / height_figma * 16,
                  ),
                  // Inja bayad Imgage picker bezari
                  SizedBox(
                    height: screenheight / height_figma * 48,
                  ),
                  GestureDetector(
                    onTap: (){
                      Get.to(ShoroyeFarayandPage2());
                    },
                    child: Container(
                      width: screenwidth / width_figma * 364,
                      height: screenheight / height_figma * 36,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(48),
                        gradient:
                        LinearGradient(
                            begin: Alignment.topRight,
                            end: Alignment.bottomLeft,
                            colors: [rediligal, whiteiligal]),
                      ),
                      child: Center(
                        child: Text(
                          "پایان فرایند کاشت",
                          style: TextStyle(
                            fontWeight: FontWeight.w800,
                            fontSize: 14,
                            color: Colors.white,
                              fontFeatures: [FontFeature('ss01', 1),]
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),

      ),
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        child: Container(
          height: screenheight / height_figma * 96,
          child: Center(
            child: Padding(
              padding:  EdgeInsets.only(
                left: screenwidth / width_figma * 24,
                right: screenwidth / width_figma * 23,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  currenttab == 0 ? MaterialButton(
                    minWidth: screenwidth / width_figma * 40,
                    onPressed: () {
                      setState(() {
                        currentscreen = ProfileForTech();
                        currenttab = 0;
                        Get.to(Techpages(),
                          arguments: currenttab,
                        );
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 36,
                          height: 36,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            gradient: LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              colors: [LightBlue, White],
                            ),
                          ),
                          child: Icon(
                            TechNavigation.profile,
                            color: currenttab == 0 ? Colors.white : phonecolor,
                            size: 22,
                          ),
                        ),
                        GradientText(
                          "پروفایل من",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                          ),
                          colors: [
                            LightBlue,
                            White,
                          ],
                        )
                      ],
                    ),
                  ):MaterialButton(
                    minWidth: screenwidth / width_figma * 40,
                    onPressed: () {
                      setState(() {
                        currentscreen = ProfileForTech();
                        currenttab = 0;
                        Get.to(Techpages(),
                          arguments: currenttab,
                        );
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 36,
                          height: 36,
                          child: Icon(
                            TechNavigation.profile,
                            color: currenttab == 0 ? Colors.blue : Colors.grey,
                          ),
                        ),
                        Text(
                          "پروفایل من",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: currenttab == 0 ? Colors.blue : Colors.grey,
                          ),
                        )
                      ],
                    ),
                  ),
                  currenttab ==1 ?  MaterialButton(
                    minWidth: screenwidth / width_figma * 40,
                    onPressed: () {
                      setState(() {
                        currentscreen = HomeForTech();
                        currenttab = 1;
                        Get.to(Techpages(),
                          arguments: currenttab,
                        );
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 36,
                          height: 36,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            gradient: LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              colors: [LightBlue, White],
                            ),
                          ),
                          child: Icon(
                            TechNavigation.nobat_dehi,
                            color: currenttab == 1 ? Colors.white : phonecolor,
                            size: 22,
                          ),
                        ),
                        GradientText(
                          "نوبت دهی",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                          ),
                          colors: [
                            LightBlue,
                            White,
                          ],
                        )
                      ],
                    ),
                  ):MaterialButton(
                    minWidth: screenwidth / width_figma * 40,
                    onPressed: () {
                      setState(() {
                        currentscreen = HomeForTech();
                        currenttab = 1;
                        Get.to(Techpages(),
                          arguments: currenttab,
                        );
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 36,
                          height: 36,
                          child: Icon(
                            TechNavigation.nobat_dehi,
                            color: currenttab == 1 ? Colors.blue : Colors.grey,
                          ),
                        ),
                        Text(
                          "نوبت دهی",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: currenttab == 1 ? Colors.blue : Colors.grey,
                          ),
                        )
                      ],
                    ),
                  ),
                  currenttab == 2 ?  MaterialButton(
                    minWidth: screenwidth / width_figma * 40,
                    onPressed: () {
                      setState(() {
                        currentscreen = ZibajoPage1();
                        currenttab = 2;
                        Get.to(Techpages(),
                          arguments: currenttab,
                        );
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 36,
                          height: 36,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            gradient: LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              colors: [LightBlue, White],
                            ),
                          ),
                          child: Icon(
                            NavigationBarIcons.tech,
                            color: currenttab == 2 ? Colors.white : phonecolor,
                            size: 22,
                          ),
                        ),
                        GradientText(
                          "زیباجویان من",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                          ),
                          colors: [
                            LightBlue,
                            White,
                          ],
                        )
                      ],
                    ),
                  ):MaterialButton(
                    minWidth: screenwidth / width_figma * 40,
                    onPressed: () {
                      setState(() {
                        currentscreen = ZibajoPage1();
                        currenttab = 2;
                        Get.to(Techpages(),
                          arguments: currenttab,
                        );
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 36,
                          height: 36,
                          child: Icon(
                            NavigationBarIcons.tech,
                            color: currenttab == 2 ? Colors.blue : Colors.grey,
                            size: 22,
                          ),
                        ),
                        Text(
                          "زیباجویان من",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: currenttab == 2 ? Colors.blue : Colors.grey,
                          ),
                        )
                      ],
                    ),
                  ),
                  currenttab == 3 ?  MaterialButton(
                    minWidth: screenwidth / width_figma * 40,
                    onPressed: () {
                      setState(() {
                        currentscreen = HomeForTech();
                        currenttab = 3;
                        Get.to(Techpages(),
                          arguments: currenttab,
                        );
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 36,
                          height: 36,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            gradient: LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              colors: [LightBlue, White],
                            ),
                          ),
                          child: Icon(
                            NavigationBarIcons.khane,
                            color: currenttab == 3 ? Colors.white : phonecolor,
                            size: 22,
                          ),
                        ),
                        GradientText(
                          "خانه",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                          ),
                          colors: [
                            LightBlue,
                            White,
                          ],
                        )
                      ],
                    ),
                  ):MaterialButton(
                    minWidth: screenwidth / width_figma * 40,
                    onPressed: () {
                      setState(() {
                        currentscreen = HomeForTech();
                        currenttab = 3;
                        Get.to(Techpages(),
                          arguments: currenttab,
                        );
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 36,
                          height: 36,
                          child: Icon(
                            NavigationBarIcons.khane,
                            color: currenttab == 3 ? Colors.blue : Colors.grey,
                            size: 22,
                          ),
                        ),
                        Text(
                          "خانه",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: currenttab == 3 ? Colors.blue : Colors.grey,
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
