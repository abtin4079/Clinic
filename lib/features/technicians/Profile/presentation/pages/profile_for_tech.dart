import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';

import '../../../../../themes/colors.dart';

class ProfileForTech extends StatefulWidget {
  const ProfileForTech({Key? key}) : super(key: key);

  @override
  State<ProfileForTech> createState() => _ProfileForTechState();
}

class _ProfileForTechState extends State<ProfileForTech> {

  bool switchValue = false;

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
          "پروفایل من",
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w700,
            color: fontcolor,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: screenheight / height_figma * 14,
            ),
            Center(
              child: Container(
                width: screenwidth / width_figma * 396,
                height: screenheight / height_figma * 304,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(32),
                    color: Colors.white),
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                        top: screenheight / height_figma * 40,
                      ),
                      child: Center(
                        child: Container(
                          width: 100,
                          height: 100,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100),
                              color: Colors.red),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        top: screenheight / height_figma * 8,
                      ),
                      child: Center(
                        child: Text(
                          "کیانا رضایی",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                            color: fontcolor,
                              fontFeatures: [FontFeature('ss01', 1),]
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        top: screenheight / height_figma * 8,
                      ),
                      child: Center(
                        child: Text(
                          "تکنسین کاشت مو و ابرو",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: fontcolor,
                              fontFeatures: [FontFeature('ss01', 1),]
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: screenheight / height_figma * 27,
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        left: screenwidth / width_figma * 31,
                        right: screenwidth / width_figma * 31,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Icon(
                                    Icons.arrow_back_ios_rounded,
                                    color: grayColorHome,
                                    size: 13,
                                  ),
                                  SizedBox(
                                    width: screenwidth / width_figma * 16,
                                  ),
                                  Text(
                                    "09999999999",
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                      color: grayColorHome,
                                        fontFeatures: [FontFeature('ss01', 1),]
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: screenheight / height_figma * 24,
                              ),
                              Row(
                                children: [
                                  Icon(
                                    Icons.arrow_back_ios_rounded,
                                    color: grayColorHome,
                                    size: 13,
                                  ),
                                  SizedBox(
                                    width: screenwidth / width_figma * 16,
                                  ),
                                  Text(
                                    "0015248568",
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                      color: grayColorHome,
                                        fontFeatures: [FontFeature('ss01', 1),]
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Directionality(
                            textDirection: TextDirection.rtl,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "شماره تماس:",
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                    color: fontcolor,
                                      fontFeatures: [FontFeature('ss01', 1),]
                                  ),
                                ),
                                SizedBox(
                                  height: screenheight / height_figma * 24,
                                ),
                                Text(
                                  "کد ملی:",
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                    color: fontcolor,
                                      fontFeatures: [FontFeature('ss01', 1),]
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: screenheight / height_figma * 24,
            ),
            Container(
              width: screenwidth / width_figma * 393,
              height: screenheight / height_figma * 564,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(32), color: Colors.white),
              child: Directionality(
                textDirection: TextDirection.rtl,
                child: Padding(
                  padding: EdgeInsets.only(
                    right: screenwidth / width_figma * 16,
                  ),
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                          top: screenheight / height_figma * 24,
                        ),
                        child: Container(
                          width: screenwidth / width_figma * 356,
                          height: screenheight / height_figma * 40,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: backgroundHome),
                          child: Row(
                            children: [
                              Image.asset(
                                  "lib/features/technicians/Profile/presentation/Images/acount_info.png"),
                              SizedBox(
                                width: screenwidth / width_figma * 6,
                              ),
                              Container(
                                width: screenwidth / width_figma * 100,
                                child: Text(
                                  "اطلاعات حساب",
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.black),
                                ),
                              ),
                              SizedBox(
                                width: screenwidth / width_figma * 177,
                              ),
                              Directionality(
                                textDirection: TextDirection.ltr,
                                child: IconButton(
                                  onPressed: () {},
                                  icon: Icon(
                                    Icons.arrow_back_ios_rounded,
                                    size: 12,
                                    color: phonecolor,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          top: screenheight / height_figma * 16,
                        ),
                        child: Container(
                          width: screenwidth / width_figma * 356,
                          height: screenheight / height_figma * 40,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: backgroundHome),
                          child: Row(
                            children: [
                              Image.asset(
                                  "lib/features/client/Setting/presentation/Images/transaction.png"),
                              SizedBox(
                                width: screenwidth / width_figma * 6,
                              ),
                              Container(
                                width: screenwidth / width_figma * 100,
                                child: Text(
                                  "تاریخچه تراکنش ها",
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.black,
                                      fontFeatures: [FontFeature('ss01', 1),]
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: screenwidth / width_figma * 177,
                              ),
                              Directionality(
                                textDirection: TextDirection.ltr,
                                child: IconButton(
                                  onPressed: () {},
                                  icon: Icon(
                                    Icons.arrow_back_ios_rounded,
                                    size: 12,
                                    color: phonecolor,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          top: screenheight / height_figma * 16,
                        ),
                        child: Container(
                          width: screenwidth / width_figma * 356,
                          height: screenheight / height_figma * 40,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: backgroundHome),
                          child: Row(
                            children: [
                              Image.asset(
                                  "lib/features/client/Setting/presentation/Images/rules.png"),
                              SizedBox(
                                width: screenwidth / width_figma * 6,
                              ),
                              Container(
                                width: screenwidth / width_figma * 100,
                                child: Text(
                                  "قوانین و مقررات",
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.black),
                                ),
                              ),
                              SizedBox(
                                width: screenwidth / width_figma * 177,
                              ),
                              Directionality(
                                textDirection: TextDirection.ltr,
                                child: IconButton(
                                  onPressed: () {},
                                  icon: Icon(
                                    Icons.arrow_back_ios_rounded,
                                    size: 12,
                                    color: phonecolor,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          top: screenheight / height_figma * 16,
                        ),
                        child: Container(
                          width: screenwidth / width_figma * 356,
                          height: screenheight / height_figma * 40,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: backgroundHome),
                          child: Row(
                            children: [
                              Image.asset(
                                  "lib/features/client/Setting/presentation/Images/language.png"),
                              SizedBox(
                                width: screenwidth / width_figma * 6,
                              ),
                              Container(
                                width: screenwidth / width_figma * 100,
                                child: Text(
                                  "زبان اپلیکیشن",
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.black,
                                      fontFeatures: [FontFeature('ss01', 1),]
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: screenwidth / width_figma * 177,
                              ),
                              Directionality(
                                textDirection: TextDirection.ltr,
                                child: IconButton(
                                  onPressed: () {},
                                  icon: Icon(
                                    Icons.arrow_back_ios_rounded,
                                    size: 12,
                                    color: phonecolor,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          top: screenheight / height_figma * 16,
                        ),
                        child: Container(
                          width: screenwidth / width_figma * 356,
                          height: screenheight / height_figma * 40,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: backgroundHome),
                          child: Row(
                            children: [
                              Image.asset(
                                  "lib/features/client/Setting/presentation/Images/notification.png"),
                              SizedBox(
                                width: screenwidth / width_figma * 6,
                              ),
                              Container(
                                width: screenwidth / width_figma * 100,
                                child: Text(
                                  "تنظیمات اعلانات",
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.black,
                                      fontFeatures: [FontFeature('ss01', 1),]),
                                ),
                              ),
                              SizedBox(
                                width: screenwidth / width_figma * 177,
                              ),
                              Directionality(
                                textDirection: TextDirection.ltr,
                                child: IconButton(
                                  onPressed: () {},
                                  icon: Icon(
                                    Icons.arrow_back_ios_rounded,
                                    size: 12,
                                    color: phonecolor,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          top: screenheight / height_figma * 16,
                        ),
                        child: Container(
                          width: screenwidth / width_figma * 356,
                          height: screenheight / height_figma * 40,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: backgroundHome),
                          child: Row(
                            children: [
                              Image.asset(
                                  "lib/features/client/Setting/presentation/Images/night_mode.png"),
                              SizedBox(
                                width: screenwidth / width_figma * 6,
                              ),
                              Container(
                                width: screenwidth / width_figma * 100,
                                child: Text(
                                  "حالت تاریک",
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.black,
                                      fontFeatures: [FontFeature('ss01', 1),]
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: screenwidth / width_figma * 175,
                              ),
                              Directionality(
                                textDirection: TextDirection.ltr,
                                child: Container(
                                  width: screenwidth / width_figma * 32,
                                  height: screenheight / height_figma * 14,
                                  child: FlutterSwitch(
                                    width: 32,
                                    height: 15,
                                    toggleSize: 10,
                                    activeColor: LightBlue,
                                    showOnOff: false,
                                    inactiveColor: toggleColor,
                                    value: switchValue,
                                    onToggle: (value) {
                                      setState(() {
                                        switchValue = value;
                                      });
                                    },
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          top: screenheight / height_figma * 16,
                        ),
                        child: Container(
                          width: screenwidth / width_figma * 356,
                          height: screenheight / height_figma * 40,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: backgroundHome),
                          child: Row(
                            children: [
                              Image.asset(
                                  "lib/features/client/Setting/presentation/Images/on_off.png"),
                              SizedBox(
                                width: screenwidth / width_figma * 6,
                              ),
                              Container(
                                width: screenwidth / width_figma * 100,
                                child: Text(
                                  "خروج از حساب",
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.black),
                                ),
                              ),
                              SizedBox(
                                width: screenwidth / width_figma * 177,
                              ),
                              Directionality(
                                textDirection: TextDirection.ltr,
                                child: IconButton(
                                  onPressed: () {},
                                  icon: Icon(
                                    Icons.arrow_back_ios_rounded,
                                    size: 12,
                                    color: phonecolor,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          top: screenheight / height_figma * 16,
                        ),
                        child: Container(
                          width: screenwidth / width_figma * 356,
                          height: screenheight / height_figma * 40,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: backgroundHome),
                          child: Row(
                            children: [
                              Image.asset(
                                  "lib/features/client/Setting/presentation/Images/about_app.png"),
                              SizedBox(
                                width: screenwidth / width_figma * 6,
                              ),
                              Container(
                                width: screenwidth / width_figma * 100,
                                child: Text(
                                  "درباره اپلیکیشن",
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.black,
                                      fontFeatures: [FontFeature('ss01', 1),]
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: screenwidth / width_figma * 177,
                              ),
                              Directionality(
                                textDirection: TextDirection.ltr,
                                child: IconButton(
                                  onPressed: () {},
                                  icon: Icon(
                                    Icons.arrow_back_ios_rounded,
                                    size: 12,
                                    color: phonecolor,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          top: screenheight / height_figma * 31,
                          right: screenwidth / width_figma * 73.34,
                          left: screenwidth / width_figma * 86,
                        ),
                        child: Container(
                          width: screenwidth / width_figma * 236.66,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset("lib/features/client/Setting/presentation/Images/a-neur.png"),
                              Text("طراحی و توسعه توسط a-neur انجام میشود", style: TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: 12,
                                color: fontcolor,
                              ),)
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: screenheight / height_figma * 9,
            ),
          ],
        ),
      ),
    );
  }
}
