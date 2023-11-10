import 'package:clinic/features/client/Home/presentation/pages/home.dart';
import 'package:clinic/features/technicians/Home/presentation/pages/home_for_tech.dart';
import 'package:clinic/features/technicians/NavigationBar/Icons/tech_navigation_icons.dart';
import 'package:clinic/features/technicians/NobatDehy/presentation/pages/nobat_dehy_page_1.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

import '../../../themes/colors.dart';
import '../../client/NavigationBar/Icons/navigation_bar_icons.dart';
import '../Profile/presentation/pages/profile_for_tech.dart';
import '../ZibajoyanMan/presentation/pages/zibajo_page_1.dart';

class Techpages extends StatefulWidget {
  const Techpages({Key? key}) : super(key: key);

  @override
  State<Techpages> createState() => _TechpagesState();
}

class _TechpagesState extends State<Techpages> {
  int currenttab = Get.arguments == null ? 3 : Get.arguments;
  List<Widget> screens = [
    ProfileForTech(),
    NobatDehyPage1(),
    ZibajoPage1(),
    HomeForTech(),
  ];

  final PageStorageBucket bucket = PageStorageBucket();
//  Widget currentscreen = currenttab == 0 ? ProfileForTech() : HomeForTech();

  @override
  Widget build(BuildContext context) {
    final screenheight = MediaQuery.of(context).size.height;
    final height_figma = 926;
    final screenwidth = MediaQuery.of(context).size.width;
    final width_figma = 428;

    return Scaffold(
      body: PageStorage(
        child: currenttab == 0
            ? ProfileForTech()
            : currenttab == 1
                ? NobatDehyPage1()
                : currenttab == 2
                    ? ZibajoPage1()
                    : HomeForTech(),
        bucket: bucket,
      ),
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        child: Container(
          height: screenheight / height_figma * 96,
          child: Center(
            child: Padding(
              padding: EdgeInsets.only(
                  // left: screenwidth / width_figma * 24,
                  // right: screenwidth / width_figma * 23,
                  ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  currenttab == 0
                      ? MaterialButton(
                          minWidth: screenwidth / width_figma * 40,
                          onPressed: () {
                            setState(() {
                              //   currentscreen = ProfileForTech();
                              currenttab = 0;
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
                                  color: currenttab == 0
                                      ? Colors.white
                                      : phonecolor,
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
                        )
                      : MaterialButton(
                          minWidth: screenwidth / width_figma * 40,
                          onPressed: () {
                            setState(() {
                              //   currentscreen = ProfileForTech();
                              currenttab = 0;
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
                                  color: currenttab == 0
                                      ? Colors.blue
                                      : Colors.grey,
                                ),
                              ),
                              Text(
                                "پروفایل من",
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  color: currenttab == 0
                                      ? Colors.blue
                                      : Colors.grey,
                                ),
                              )
                            ],
                          ),
                        ),
                  currenttab == 1
                      ? MaterialButton(
                          minWidth: screenwidth / width_figma * 40,
                          onPressed: () {
                            setState(() {
                              //  currentscreen = NobatDehyPage1();
                              currenttab = 1;
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
                                  color: currenttab == 1
                                      ? Colors.white
                                      : phonecolor,
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
                        )
                      : MaterialButton(
                          minWidth: screenwidth / width_figma * 40,
                          onPressed: () {
                            setState(() {
                              //    currentscreen = NobatDehyPage1();
                              currenttab = 1;
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
                                  color: currenttab == 1
                                      ? Colors.blue
                                      : Colors.grey,
                                ),
                              ),
                              Text(
                                "نوبت دهی",
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  color: currenttab == 1
                                      ? Colors.blue
                                      : Colors.grey,
                                ),
                              )
                            ],
                          ),
                        ),
                  currenttab == 2
                      ? MaterialButton(
                          minWidth: screenwidth / width_figma * 40,
                          onPressed: () {
                            setState(() {
                              //   currentscreen = ZibajoPage1();
                              currenttab = 2;
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
                                  color: currenttab == 2
                                      ? Colors.white
                                      : phonecolor,
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
                        )
                      : MaterialButton(
                          minWidth: screenwidth / width_figma * 40,
                          onPressed: () {
                            setState(() {
                              //   currentscreen = ZibajoPage1();
                              currenttab = 2;
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
                                  color: currenttab == 2
                                      ? Colors.blue
                                      : Colors.grey,
                                  size: 22,
                                ),
                              ),
                              Text(
                                "زیباجویان من",
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  color: currenttab == 2
                                      ? Colors.blue
                                      : Colors.grey,
                                ),
                              )
                            ],
                          ),
                        ),
                  currenttab == 3
                      ? MaterialButton(
                          minWidth: screenwidth / width_figma * 40,
                          onPressed: () {
                            setState(() {
                              //    currentscreen = HomeForTech();
                              currenttab = 3;
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
                                  color: currenttab == 3
                                      ? Colors.white
                                      : phonecolor,
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
                        )
                      : MaterialButton(
                          minWidth: screenwidth / width_figma * 40,
                          onPressed: () {
                            setState(() {
                              //    currentscreen = HomeForTech();
                              currenttab = 3;
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
                                  color: currenttab == 3
                                      ? Colors.blue
                                      : Colors.grey,
                                  size: 22,
                                ),
                              ),
                              Text(
                                "خانه",
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  color: currenttab == 3
                                      ? Colors.blue
                                      : Colors.grey,
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
