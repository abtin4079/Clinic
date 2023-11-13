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
  String _value = '';

  Future _selectDate() async {
    String? picked = await jalaliCalendarPicker(
        context: context,
        convertToGregorian: true,
        showTimePicker: false,
        hore24Format: true);
    if (picked != null) setState(() => _value = picked);
  }

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
              fontFeatures: [
                FontFeature('ss01', 1),
              ]),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
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
            ElevatedButton(
              onPressed: _selectDate,
              child: const Text('نمایش تقویم'),
            ),
            Text(
              _value,
              textAlign: TextAlign.center,
            ),
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
                        height: screenheight / height_figma * 170,
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
                              width: screenwidth / width_figma * 80,
                              height: screenheight / height_figma * 69,
                              padding: EdgeInsets.only(top: 10),
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
    );
  }
}
