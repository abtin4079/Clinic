import 'package:flutter/material.dart';
import 'package:clinic/features/Calender/jalali_table_calendar.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'dart:ui';

import '../../../../../themes/colors.dart';

class HomeForTech extends StatefulWidget {
  const HomeForTech({Key? key}) : super(key: key);

  @override
  State<HomeForTech> createState() => _HomeForTechState();
}

DateTime today = DateTime.now();

class _HomeForTechState extends State<HomeForTech> {
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
          "خانه",
          style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w700,
              color: fontcolor,
              fontFeatures: [
                FontFeature('ss01', 1),
              ]),
        ),
      ),
      body: SingleChildScrollView(
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: Column(
            children: [
              Padding(
                  padding: EdgeInsets.only(
                    left: screenwidth / width_figma * 16,
                    right: screenwidth / width_figma * 16,
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      color: Colors.white,
                    ),
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(
                            top: screenheight / height_figma * 24,
                            right: screenwidth / width_figma * 24,
                          ),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Image.asset(
                                      "lib/features/client/Home/presentation/images/calender.png"),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    "تقویم ماهانه",
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w700,
                                      color: fontcolor,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.all(20),
                          child: JalaliTableCalendar(
                            showTimePicker: false,
                            context: context,
                            locale: Locale('fa'),
                            // adding dates as rooz haye nobat
                            events: {
                              today: [],
                              today.add(Duration(days: 1)): [],
                              today.add(Duration(days: 2)): []
                            },
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            // top: screenheight / height_figma * 24,
                            right: screenwidth / width_figma * 24,
                            bottom: screenwidth / width_figma * 24,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 1, right: 1),
                                child: Container(
                                  padding: EdgeInsets.all(1),
                                  decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                      colors: [
                                        Color(0xFFF34363), // Start color
                                        Color(0xFFFFA3A3), // End color
                                      ],
                                      begin: Alignment.topCenter,
                                      end: Alignment.bottomCenter,
                                    ),
                                    borderRadius: BorderRadius.circular(5.0),
                                  ),
                                  child: Stack(
                                    children: [
                                      Center(
                                        child: Semantics(
                                          child: ExcludeSemantics(
                                            child: Text(
                                              "           ",
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: screenwidth / width_figma * 8,
                              ),
                              Text(
                                "نوبت پر",
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  color: fontcolor,
                                  fontFeatures: [
                                    FontFeature('ss01', 1),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          width: screenwidth / width_figma * 20,
                        ),
                      ],
                    ),
                  )),
              SizedBox(
                height: screenheight / height_figma * 16,
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: screenwidth / width_figma * 16,
                  right: screenwidth / width_figma * 16,
                ),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: Colors.white,
                  ),
                  child: Directionality(
                    textDirection: TextDirection.rtl,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(
                            top: screenheight / height_figma * 24,
                            right: screenwidth / width_figma * 24,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Image.asset(
                                  "lib/features/client/Home/presentation/images/copy.png"),
                              SizedBox(
                                width: screenwidth / width_figma * 8,
                              ),
                              Text(
                                "فعالیت های اخیر",
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w700,
                                  color: fontcolor,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: screenheight / height_figma * 20,
                        ),
                        Container(
                          height: (screenheight / height_figma * 170),
                          padding: EdgeInsets.only(
                            right: screenwidth / width_figma * 24,
                            left: screenwidth / width_figma * 28,
                          ),
                          child: MasonryGridView.count(
                            itemCount: 6,
                            crossAxisCount: 4,
                            mainAxisSpacing: 8,
                            crossAxisSpacing: 8,
                            itemBuilder: (context, index) {
                              return Container(
                                // width: screenwidth / width_figma * 80,
                                // height: screenheight / height_figma * 69,
                                // padding: EdgeInsets.only(top: 10),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(13.91),
                                  color: activites,
                                ),
                                child: Directionality(
                                  textDirection: TextDirection.rtl,
                                  child: Padding(
                                    padding: EdgeInsets.only(
                                      right: screenwidth / width_figma * 8,
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "2",
                                          style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.w800,
                                              color: fontcolor),
                                        ),
                                        Text(
                                          "برداشت مو",
                                          style: TextStyle(
                                              fontFeatures: [
                                                FontFeature('ss01', 1),
                                              ],
                                              fontSize: 14,
                                              fontWeight: FontWeight.w700,
                                              color: blackwhite),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                        SizedBox(
                          height: screenheight / height_figma * 20,
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            bottom: screenheight / height_figma * 24,
                            right: screenwidth / width_figma * 24,
                          ),
                          child: Container(
                            width: screenwidth / width_figma * 339,
                            height: screenheight / height_figma * 48,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              gradient: LinearGradient(
                                begin: Alignment.bottomCenter,
                                end: Alignment.topCenter,
                                colors: [moneywhite, moneygreen],
                              ),
                            ),
                            child: Directionality(
                              textDirection: TextDirection.rtl,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    width: screenwidth / width_figma * 39,
                                  ),
                                  Image.asset(
                                      "lib/features/technicians/Home/image/money.png"),
                                  Text(
                                    "مانده حساب شما:",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w700,
                                        fontSize: 14,
                                        color: fontcolor),
                                  ),
                                  SizedBox(
                                    width: screenwidth / width_figma * 10,
                                  ),
                                  Directionality(
                                    textDirection: TextDirection.ltr,
                                    child: Text(
                                      "12'000'000",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w700,
                                          fontSize: 16,
                                          color: fontcolor),
                                    ),
                                  ),
                                  SizedBox(
                                    width: screenwidth / width_figma * 5,
                                  ),
                                  Text(
                                    "تومان",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w700,
                                        fontSize: 12,
                                        color: grayColorHome),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
