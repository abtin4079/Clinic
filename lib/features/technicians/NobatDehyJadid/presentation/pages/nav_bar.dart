import 'dart:ui';
import 'package:clinic/features/auth/presentation/pages/login_first_page.dart';
import 'package:clinic/features/technicians/NobatDehyJadid/presentation/pages/tech_finance.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../../../themes/colors.dart';

class NavBar extends StatelessWidget {
  const NavBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenheight = MediaQuery.of(context).size.height;
    final height_figma = 926;
    final screenwidth = MediaQuery.of(context).size.width;
    final width_figma = 428;

    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          SizedBox(
            height: screenheight / height_figma * 50,
          ),
          CircleAvatar(
            radius: 48,
            child: ClipOval(
              child: Image.asset(
                "lib/features/technicians/NobatDehyJadid/images/frame40.png",
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(
            height: screenheight / height_figma * 8,
          ),
          Center(
            child: Text(
              "کیمیا کریمی",
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 16,
                color: fontcolor,
                  fontFeatures: [
                    FontFeature('ss01', 1),
                  ]
              ),
            ),
          ),
          SizedBox(
            height: screenheight / height_figma * 8,
          ),
          Center(
            child: Text(
              "تکنسین کاشت مو و ابرو",
              style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 14,
                color: fontcolor,
                  fontFeatures: [
                    FontFeature('ss01', 1),
                  ]
              ),
            ),
          ),
          SizedBox(
            height: screenheight / height_figma * 30,
          ),
          Directionality(
            textDirection: TextDirection.rtl,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "شماره تماس:",
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: fontcolor),
                    ),
                    SizedBox(
                      height: screenheight / height_figma * 19,
                    ),
                    Text(
                      "کد ملی:",
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: fontcolor, fontFeatures: [
                        FontFeature('ss01', 1),
                      ]),
                    ),
                  ],
                ),
                Directionality(
                  textDirection: TextDirection.ltr,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "09152451258",
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: grayColorHome),
                      ),
                      SizedBox(
                        height: screenheight / height_figma * 19,
                      ),
                      Text(
                        "0021548695",
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: grayColorHome),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: screenheight / height_figma * 25,
          ),
          Divider(
            color: Colors.black,
            thickness: 5,
          ),
          SizedBox(
            height: screenheight / height_figma * 27,
          ),
          GestureDetector(
            onTap: (){
              Get.to(TechFinance());
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  width: screenwidth / width_figma * 7,
                ),
                Image.asset("lib/features/technicians/NobatDehyJadid/images/Frame49.png"),
                SizedBox(
                  width: screenwidth / width_figma * 7,
                ),
                Text("اطلاعات حساب و مالی", style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 14,
                  color: Colors.black
                ),)
              ],
            ),
          ),
          Divider(
            color: grayColorHome,
            thickness: 1,
          ),
          SizedBox(
            height: screenheight / height_figma * 18,
          ),
          GestureDetector(
            onTap: (){
              showDialog(
                context: context,
                builder: (context) => Dialog(
                  child: Container(
                    width: screenwidth / width_figma * 356,
                    height: screenheight / height_figma * 170,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(28),
                      color: Colors.white,
                    ),
                    child: Column(
                      children: [
                        SizedBox(
                          height: screenheight / height_figma * 41,
                        ),
                        Text(
                          "آیا از خروج از حساب مطمعن هستید؟",
                          style: TextStyle(
                            color: fontcolor,
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        SizedBox(
                          height: screenheight / height_figma * 39,
                        ),
                        Row(
                          mainAxisAlignment:
                          MainAxisAlignment.center,
                          children: [
                            GestureDetector(
                              onTap: () {},
                              child: Container(
                                height: screenheight /
                                    height_figma *
                                    36,
                                width:
                                screenwidth / width_figma * 100,
                                decoration: BoxDecoration(
                                    borderRadius:
                                    BorderRadius.circular(48),
                                    gradient: LinearGradient(
                                        begin: Alignment.topRight,
                                        end: Alignment.bottomLeft,
                                        colors: [
                                          rediligal,
                                          whiteiligal
                                        ])),
                                child: Center(
                                  child: Text(
                                    "انصراف",
                                    style: TextStyle(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 14,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: screenwidth / width_figma * 8,
                            ),
                            GestureDetector(
                              onTap: () {
                                Get.to(() => LoginFirstPage());
                              },
                              child: Container(
                                height: screenheight /
                                    height_figma *
                                    36,
                                width:
                                screenwidth / width_figma * 100,
                                decoration: BoxDecoration(
                                    borderRadius:
                                    BorderRadius.circular(48),
                                    gradient: LinearGradient(
                                        begin: Alignment.topRight,
                                        end: Alignment.bottomLeft,
                                        colors: [
                                          LightBlue,
                                          White
                                        ])),
                                child: Center(
                                  child: Text(
                                    "تایید",
                                    style: TextStyle(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 14,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  width: screenwidth / width_figma * 7,
                ),
                Image.asset("lib/features/technicians/NobatDehyJadid/images/Frame47.png"),
                SizedBox(
                  width: screenwidth / width_figma * 7,
                ),
                Text("خروج از حساب", style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 14,
                    color: Colors.black
                ),)
              ],
            ),
          ),
        ],
      ),
    );
  }
}
