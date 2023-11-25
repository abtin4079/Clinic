import 'package:clinic/features/auth/presentation/pages/login_first_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:clinic/features/auth/controller/shared_preference.dart';

import '../../../../../themes/colors.dart';
import '../../../../auth/controller/shared_preference.dart';

class Setting extends StatefulWidget {
  const Setting({Key? key}) : super(key: key);

  @override
  State<Setting> createState() => _SettingState();
}

class _SettingState extends State<Setting> {
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
          "تنظیمات",
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
                height: 359,
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
                          "سوپروایزر کلینیک",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: fontcolor,
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
                                    "کلینیک تست 1",
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                      color: grayColorHome,
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
                                    "09999999999",
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                      color: grayColorHome,
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
                                  "نام کلینیک",
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                    color: fontcolor,
                                  ),
                                ),
                                SizedBox(
                                  height: screenheight / height_figma * 24,
                                ),
                                Text(
                                  "شماره تماس:",
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                    color: fontcolor,
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
              height: 24,
            ),
            Container(
              width: screenwidth / width_figma * 393,
              height: 224,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(32), color: Colors.white),
              child: Directionality(
                textDirection: TextDirection.rtl,
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                        top: screenheight / height_figma * 18,
                        right: screenwidth / width_figma * 8,
                      ),
                      child: Row(
                        children: [
                          Image.asset(
                              "lib/features/client/Setting/presentation/Images/wallet_info.png"),
                          Text(
                            "اطلاعات کیف پول",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                            ),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        top: screenheight / height_figma * 24,
                        right: screenwidth / width_figma * 40,
                      ),
                      child: Directionality(
                        textDirection: TextDirection.rtl,
                        child: Row(
                          children: [
                            Container(
                              width: screenwidth / width_figma * 105,
                              height: screenheight / height_figma * 30,
                              child: Center(
                                child: Text(
                                  "اعتبار:",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 16,
                                      color: grayColorHome),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: screenwidth / width_figma * 10,
                            ),
                            Text(
                              "15،000،000،000 ریال",
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black),
                            )
                          ],
                        ),
                      ),
                    ),
                    Center(
                      child: Padding(
                        padding: EdgeInsets.only(
                          top: screenheight / height_figma * 25,
                        ),
                        child: GestureDetector(
                          onTap: () {},
                          child: Container(
                            width: screenwidth / width_figma * 328,
                            height: screenheight / height_figma * 48,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: LightBlue,
                            ),
                            child: Center(
                              child: Text(
                                "افزایش اعتبار کیف پول",
                                style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 14,
                                    color: lightwhite),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 11,
            ),
            Container(
              width: screenwidth / width_figma * 393,
              height: 501,
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
                          height: 40,
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
                                width: screenwidth / width_figma * 120,
                                child: Text(
                                  "تاریخچه تراکنش ها",
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.black),
                                ),
                              ),
                              SizedBox(
                                width: screenwidth / width_figma * 130,
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
                          height: 40,
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
                                width: screenwidth / width_figma * 150,
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
                          height: 40,
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
                                      color: Colors.black),
                                ),
                              ),
                              SizedBox(
                                width: screenwidth / width_figma * 150,
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
                          height: 40,
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
                                      color: Colors.black),
                                ),
                              ),
                              SizedBox(
                                width: screenwidth / width_figma * 150,
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
                          height: 40,
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
                                      color: Colors.black),
                                ),
                              ),
                              SizedBox(
                                width: screenwidth / width_figma * 160,
                              ),
                              Directionality(
                                textDirection: TextDirection.ltr,
                                child: Container(
                                  width: screenwidth / width_figma * 32,
                                  height: 14,
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
                      GestureDetector(
                        onTap: () {
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
                                          onTap: () {
                                            removeValues('access_token');
                                            removeValues('refresh_token');
                                            Get.back(result: false);
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
                                            removeValues("access_token");
                                            Get.to(LoginFirstPage());
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
                        child: Padding(
                          padding: EdgeInsets.only(
                            top: screenheight / height_figma * 16,
                          ),
                          child: Container(
                            width: screenwidth / width_figma * 356,
                            height: 40,
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
                                  width: screenwidth / width_figma * 150,
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
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          top: screenheight / height_figma * 16,
                        ),
                        child: Container(
                          width: screenwidth / width_figma * 356,
                          height: 40,
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
                                      color: Colors.black),
                                ),
                              ),
                              SizedBox(
                                width: screenwidth / width_figma * 150,
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
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                                "lib/features/client/Setting/presentation/Images/a-neur.png"),
                            Text(
                              "طراحی و توسعه توسط a-neur انجام میشود",
                              style: TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: 12,
                                color: fontcolor,
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
            SizedBox(
              height: 9,
            ),
          ],
        ),
      ),
    );
  }
}
