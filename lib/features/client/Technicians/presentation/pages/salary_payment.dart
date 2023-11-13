import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../../../themes/colors.dart';

class SalaryPayment extends StatefulWidget {
  const SalaryPayment({Key? key}) : super(key: key);

  @override
  State<SalaryPayment> createState() => _SalaryPaymentState();
}

class _SalaryPaymentState extends State<SalaryPayment> {
  @override
  Widget build(BuildContext context) {
    final screenheight = MediaQuery.of(context).size.height;
    final height_figma = 926;
    final screenwidth = MediaQuery.of(context).size.width;
    final width_figma = 428;

    int _historyIndex = 0;
    int _paymentReady = 0;
    // var items2 = Get.arguments;

    return Scaffold(
      backgroundColor: backgroundHome,
      appBar: AppBar(
        backgroundColor: backgroundHome,
        elevation: 0,
        centerTitle: true,
        title: Text(
          "پرداخت حقوق",
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
                height: screenheight / height_figma * 370,
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
                            fontFeatures: [
                              FontFeature('ss01', 1),
                            ],
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
                              Text(
                               "09124587458",
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
                               "0025478549",
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
                                "5875486599887548",
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  color: fontcolor,
                                ),
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
                                SizedBox(
                                  height: screenheight / height_figma * 24,
                                ),
                                Text(
                                  "شماره کارت:",
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
              height: screenheight / height_figma * 40,
            ),
            Text(
              "انتخاب تاریخ پرداخت",
              style: TextStyle(
                  fontSize: 20, fontWeight: FontWeight.w700, color: fontcolor),
            ),
            SizedBox(
              height: screenheight / height_figma * 27,
            ),
            Container(
              width: screenwidth / width_figma * 396,
              height: screenheight / height_figma * 340,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16), color: Colors.white),
              child: Directionality(
                textDirection: TextDirection.rtl,
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                        top: screenheight / height_figma * 28,
                        right: screenwidth / width_figma * 16,
                        left: screenheight / height_figma * 17.5,
                      ),
                      child: _historyIndex == 0
                          ? Directionality(
                              textDirection: TextDirection.rtl,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Image.asset(
                                      "lib/features/client/Home/presentation/images/information-line.png"),
                                  SizedBox(
                                    width: screenwidth / width_figma * 60,
                                  ),
                                  Text(
                                    "از تاریخ",
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w700,
                                        color: phonecolor),
                                  ),
                                  SizedBox(
                                    width: screenwidth / width_figma * 63,
                                  ),
                                  Center(
                                    child: Container(
                                      width: screenwidth / width_figma * 122,
                                      height: screenheight / height_figma * 17,
                                      child: Text(
                                        "سه شنبه 13 آذر",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 14,
                                            color: fontcolor),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: screenwidth / width_figma * 22,
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        _historyIndex = 1;
                                      });
                                    },
                                    child: Container(
                                      width: screenwidth / width_figma * 31,
                                      height: 31,
                                      child: ClipRRect(
                                        child: Image.asset(
                                            "lib/features/client/Technicians/presentation/images/edit_pencil.png"),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            )
                          : Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Image.asset(
                                    "lib/features/client/Home/presentation/images/information-line.png"),
                                SizedBox(
                                  width: screenwidth / width_figma * 60,
                                ),
                                Text(
                                  "از تاریخ",
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w700,
                                      color: phonecolor),
                                ),
                                SizedBox(
                                  width: screenwidth / width_figma * 63,
                                ),
                                GestureDetector(
                                  onTap: () {
                                    _historyIndex = 0;
                                  },
                                  child: Container(
                                    width: screenwidth / width_figma * 178,
                                    height: screenheight / height_figma * 36,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(48),
                                      gradient: LinearGradient(
                                          begin: Alignment.topCenter,
                                          end: Alignment.bottomCenter,
                                          colors: [rediligal, whiteiligal]),
                                    ),
                                    child: Center(
                                      child: Text(
                                        "انتخاب تاریخ",
                                        style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w700,
                                            color: Colors.white),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        top: screenheight / height_figma * 30.5,
                        right: screenwidth / width_figma * 16,
                        left: screenheight / height_figma * 14,
                      ),
                      child: _historyIndex == 1
                          ? Directionality(
                              textDirection: TextDirection.rtl,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Image.asset(
                                      "lib/features/client/Home/presentation/images/information-line.png"),
                                  SizedBox(
                                    width: screenwidth / width_figma * 60,
                                  ),
                                  Text(
                                    "تا تاریخ",
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w700,
                                        color: phonecolor),
                                  ),
                                  SizedBox(
                                    width: screenwidth / width_figma * 63,
                                  ),
                                  Center(
                                    child: Container(
                                      width: screenwidth / width_figma * 122,
                                      height: screenheight / height_figma * 17,
                                      child: Text(
                                        "سه شنبه 13 آذر",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 14,
                                            color: fontcolor),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: screenwidth / width_figma * 22,
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        _historyIndex = 1;
                                      });
                                    },
                                    child: Container(
                                      width: screenwidth / width_figma * 31,
                                      height: 31,
                                      child: ClipRRect(
                                        child: Image.asset(
                                            "lib/features/client/Technicians/presentation/images/edit_pencil.png"),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            )
                          : Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Image.asset(
                                    "lib/features/client/Home/presentation/images/information-line.png"),
                                SizedBox(
                                  width: screenwidth / width_figma * 60,
                                ),
                                Text(
                                  "تا تاریخ",
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w700,
                                      color: phonecolor),
                                ),
                                SizedBox(
                                  width: screenwidth / width_figma * 63,
                                ),
                                GestureDetector(
                                  onTap: () {
                                    _historyIndex = 0;
                                  },
                                  child: Container(
                                    width: screenwidth / width_figma * 178,
                                    height: screenheight / height_figma * 36,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(48),
                                      gradient: LinearGradient(
                                          begin: Alignment.topCenter,
                                          end: Alignment.bottomCenter,
                                          colors: [rediligal, whiteiligal]),
                                    ),
                                    child: Center(
                                      child: Text(
                                        "انتخاب تاریخ",
                                        style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w700,
                                            color: Colors.white),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        top: screenheight / height_figma * 29,
                        right: screenwidth / width_figma * 18,
                        left: screenheight / height_figma * 18,
                      ),
                      child: Directionality(
                        textDirection: TextDirection.rtl,
                        child: Row(
                          children: [
                            Text(
                              "تعداد تار مو:",
                              style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 16,
                                  color: phonecolor),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        top: screenheight / height_figma * 29,
                        right: screenwidth / width_figma * 18,
                        left: screenheight / height_figma * 18,
                      ),
                      child: Directionality(
                        textDirection: TextDirection.rtl,
                        child: Row(
                          children: [
                            Text(
                              "هزینه به ازای هر تار مو:",
                              style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 16,
                                  color: phonecolor),
                            ),
                            SizedBox(
                              width: screenwidth / width_figma * 28,
                            ),
                            Container(
                                width: screenwidth / width_figma * 170,
                                height: screenheight / height_figma * 48,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(32),
                                  color: backgroundHome,
                                ),
                                child: TextField(
                                  textAlign: TextAlign.center,
                                  decoration: InputDecoration(
                                    hintText: 'هزینه به ریال',
                                    hintStyle: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 14,
                                      color: phonecolor,
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.black),
                                      borderRadius: BorderRadius.circular(48),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: outlineborder, width: 2),
                                      borderRadius: BorderRadius.circular(32),
                                    ),
                                    border: OutlineInputBorder(),
                                  ),
                                  keyboardType: TextInputType.number,
                                )),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        top: screenheight / height_figma * 29,
                        right: screenwidth / width_figma * 17.5,
                        left: screenheight / height_figma * 17.5,
                        bottom: screenheight / height_figma * 14,
                      ),
                      child: Center(
                        child: Text(
                          "0 ریال",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                            color: fontcolor,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: screenheight / height_figma * 22,
            ),
            GestureDetector(
              onTap: (){

              },
              child: Container(
                height: screenheight / height_figma * 48,
                width: screenwidth / width_figma * 328,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color:
                        _paymentReady == 1 ? LightBlue : graycoloranjamnashode),
                child: Center(
                  child: Text(
                    "پرداخت از کیف پول",
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 14,
                        color: _paymentReady == 1 ? lightwhite : fontcolor),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: screenheight / height_figma * 45,
            ),
          ],
        ),
      ),
    );
  }
}
