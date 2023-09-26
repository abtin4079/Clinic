import 'dart:ui';

import 'package:clinic/features/client/Technicians/presentation/pages/activity_history.dart';
import 'package:clinic/features/client/Technicians/presentation/pages/payment_history.dart';
import 'package:clinic/features/client/Technicians/presentation/pages/salary_payment.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../../../themes/colors.dart';
import '../../../Home/domain/entity.dart';

class TechProfile extends StatefulWidget {
  const TechProfile({Key? key}) : super(key: key);

  @override
  State<TechProfile> createState() => _TechProfileState();
}

class _TechProfileState extends State<TechProfile> {
  @override
  Widget build(BuildContext context) {
    final screenheight = MediaQuery.of(context).size.height;
    final height_figma = 926;
    final screenwidth = MediaQuery.of(context).size.width;
    final width_figma = 428;

    var items2 = Get.arguments;

    return Scaffold(
      backgroundColor: backgroundHome,
      appBar: AppBar(
        backgroundColor: backgroundHome,
        elevation: 0,
        centerTitle: true,
        title: Text(
          "پروفایل تکنسین",
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
                height: screenheight / height_figma * 359,
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
                          items2[1].toString(),
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
                              Text(
                                items2[2].toString(),
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
                                items2[3].toString(),
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
                                      fontFeatures: [FontFeature('ss01', 1),]
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
              height: screenheight / height_figma * 37,
            ),
            Directionality(
                textDirection: TextDirection.rtl,
                child: Padding(
                  padding: EdgeInsets.only(
                    left: screenwidth / width_figma * 22,
                    right: screenwidth / width_figma * 31,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "تاریخچه فعالیت ها",
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                            color: fontcolor),
                      ),
                      MaterialButton(
                        onPressed: () {
                          Get.to(ActivityHistory(), arguments: [
                            items2[0],
                            items2[1],
                            items2[2],
                            items2[3]
                          ]);
                        },
                        child: Directionality(
                          textDirection: TextDirection.rtl,
                          child: Row(
                            children: [
                              Text(
                                "مشاهده همه فعالیت ها",
                                style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 14,
                                    color: grayColorHome),
                              ),
                              SizedBox(
                                width: screenwidth / width_figma * 8,
                              ),
                              Icon(
                                Icons.arrow_back_ios_rounded,
                                textDirection: TextDirection.ltr,
                                size: 12,
                                color: grayColorHome,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                )),
            SizedBox(
              height: screenheight / height_figma * 21,
            ),
            FutureBuilder(
              future: ReadJsonData(),
              builder: (context, data) {
                if (data.hasError) {
                  return Text("${data.error}");
                } else if (data.hasData) {
                  var items = data.data as List<EntityHome>;
                  return ListView.builder(
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    itemCount: items == null ? 0 : items.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {},
                        child: Center(
                          child: Card(
                            child: Container(
                              width: screenwidth / width_figma * 396,
                              height: screenheight / height_figma * 152,
                              padding: EdgeInsets.only(
                                right: screenwidth / width_figma * 19,
                                left: screenwidth / width_figma * 19,
                              ),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(16),
                                  color: Colors.white),
                              child: Padding(
                                padding: EdgeInsets.only(
                                  right: screenwidth / width_figma * 12,
                                  left: screenwidth / width_figma * 12,
                                  top: screenheight / height_figma * 14,
                                  bottom: screenheight / height_figma * 14,
                                ),
                                child: Directionality(
                                  textDirection: TextDirection.rtl,
                                  child: Row(
                                    children: [
                                      Image.asset(
                                          "lib/features/client/Home/presentation/images/gol.png"),
                                      SizedBox(
                                        width: screenwidth / width_figma * 10,
                                      ),
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "کاشت مو",
                                            style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w700,
                                                color: fontcolor,
                                                fontFeatures: [FontFeature('ss01', 1),]),
                                          ),
                                          SizedBox(
                                            height:
                                                screenheight / height_figma * 6,
                                          ),
                                          Text(
                                            "تاریخ:",
                                            style: TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w500,
                                                color: grayColorHome),
                                          ),
                                          SizedBox(
                                            height:
                                                screenheight / height_figma * 4,
                                          ),
                                          Text(
                                            "سه شنبه 13 آذر",
                                            style: TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w500,
                                                color: fontcolor),
                                          ),
                                          SizedBox(
                                            height:
                                                screenheight / height_figma * 6,
                                          ),
                                          Text(
                                            "زیباجو:",
                                            style: TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w500,
                                                color: grayColorHome),
                                          ),
                                          SizedBox(
                                            height:
                                                screenheight / height_figma * 4,
                                          ),
                                          Container(
                                            width:
                                                screenwidth / width_figma * 110,
                                            child: Text(
                                              items[index].zibajo.toString(),
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w500,
                                                  color: grayColorHome,
                                                  fontFeatures: [FontFeature('ss01', 1),]),
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        width: screenwidth / width_figma * 53,
                                      ),
                                      Column(
                                        children: [
                                          SizedBox(
                                            height: screenheight /
                                                height_figma *
                                                27,
                                          ),
                                          Container(
                                            child: Text(
                                              "تعداد تار مو:",
                                              style: TextStyle(
                                                fontWeight: FontWeight.w500,
                                                fontSize: 14,
                                                color: grayColorHome,
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            height:
                                                screenheight / height_figma * 4,
                                          ),
                                          Container(
                                            child: Text(
                                              items[index]
                                                  .number_of_hairs
                                                  .toString(),
                                              style: TextStyle(
                                                fontWeight: FontWeight.w400,
                                                fontSize: 14,
                                                color: fontcolor,
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            height:
                                                screenheight / height_figma * 8,
                                          ),
                                          Container(
                                            child: Text(
                                              "وضعیت:",
                                              style: TextStyle(
                                                fontWeight: FontWeight.w500,
                                                fontSize: 14,
                                                color: grayColorHome,
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            height:
                                                screenheight / height_figma * 4,
                                          ),
                                          Container(
                                            width:
                                                screenwidth / width_figma * 97,
                                            height: screenheight /
                                                height_figma *
                                                21,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(16),
                                                color: items[index].situation ==
                                                        "completed"
                                                    ? LightBlue
                                                    : items[index].situation ==
                                                            "Expectation"
                                                        ? processColor
                                                        : rediligal),
                                            child: items[index].situation ==
                                                    "completed"
                                                ? Center(
                                                    child: Text(
                                                    "تایید شده",
                                                    style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.w800,
                                                      fontSize: 14,
                                                      color: Colors.white,
                                                    ),
                                                  ))
                                                : items[index].situation ==
                                                        "Expectation"
                                                    ? Center(
                                                        child: Text(
                                                        "در انتظار تایید",
                                                        style: TextStyle(
                                                          fontSize: 14,
                                                          fontWeight:
                                                              FontWeight.w800,
                                                          color: Colors.white,
                                                        ),
                                                      ))
                                                    : Center(
                                                        child: Text(
                                                        "در حال انجام",
                                                        style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.w800,
                                                          fontSize: 14,
                                                          color: Colors.white,
                                                        ),
                                                      )),
                                          )
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  );
                } else {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
              },
            ),
            SizedBox(
              height: screenheight / height_figma * 40,
            ),
            Directionality(
                textDirection: TextDirection.rtl,
                child: Padding(
                  padding: EdgeInsets.only(
                    left: screenwidth / width_figma * 22,
                    right: screenwidth / width_figma * 31,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "تاریخچه پرداخت ها",
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                            color: fontcolor),
                      ),
                      MaterialButton(
                        onPressed: () {
                          Get.to(PaymentHistory(), arguments: [
                            items2[0],
                            items2[1],
                            items2[2],
                            items2[3]
                          ]);
                        },
                        child: Directionality(
                          textDirection: TextDirection.rtl,
                          child: Row(
                            children: [
                              Text(
                                "مشاهده همه پرداخت ها",
                                style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 14,
                                    color: grayColorHome),
                              ),
                              SizedBox(
                                width: screenwidth / width_figma * 8,
                              ),
                              Icon(
                                Icons.arrow_back_ios_rounded,
                                textDirection: TextDirection.ltr,
                                size: 12,
                                color: grayColorHome,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                )),
            SizedBox(
              height: screenheight / height_figma * 21,
            ),
            FutureBuilder(
              future: ReadJsonData(),
              builder: (context, data) {
                if (data.hasError) {
                  return Text("${data.error}");
                } else if (data.hasData) {
                  var items = data.data as List<EntityHome>;
                  return ListView.builder(
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    itemCount: items == null ? 0 : items.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {},
                        child: Center(
                          child: Card(
                            child: Container(
                              width: screenwidth / width_figma * 396,
                              height: screenheight / height_figma * 108,
                              padding: EdgeInsets.only(
                                left: screenwidth / width_figma * 19,
                                right: screenwidth / width_figma * 19,
                              ),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(16),
                                  color: Colors.white),
                              child: Directionality(
                                textDirection: TextDirection.rtl,
                                child: Stack(
                                  alignment: Alignment.topRight,
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(
                                        top: screenheight / height_figma * 7,
                                        right: screenwidth / width_figma * 170,
                                      ),
                                      child: Text(
                                        "15000000 ریال",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w700,
                                            fontSize: 16,
                                            color: fontcolor),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(
                                        top: screenheight / height_figma * 41,
                                        right: screenwidth / width_figma * 16,
                                      ),
                                      child: Text(
                                        "از تاریخ:",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 14,
                                            color: grayColorHome),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(
                                        top: screenheight / height_figma * 62,
                                        right: screenwidth / width_figma * 16,
                                      ),
                                      child: Text(
                                        "سه شنبه 13 آذر",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 14,
                                            color: fontcolor),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(
                                        top: screenheight / height_figma * 41,
                                        right: screenwidth / width_figma * 144,
                                      ),
                                      child: Text(
                                        "تا تاریخ:",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 14,
                                            color: grayColorHome),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(
                                        top: screenheight / height_figma * 62,
                                        right: screenwidth / width_figma * 144,
                                      ),
                                      child: Text(
                                        "سه شنبه 13 آذر ",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 14,
                                            color: fontcolor),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(
                                        top: screenheight / height_figma * 41,
                                        right: screenwidth / width_figma * 272,
                                      ),
                                      child: Text(
                                        "وضعیت:",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 14,
                                            color: grayColorHome),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(
                                        top: screenheight / height_figma * 41,
                                        right: screenwidth / width_figma * 16,
                                      ),
                                      child: Text(
                                        "از تاریخ:",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 14,
                                            color: grayColorHome),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(
                                        top: screenheight / height_figma * 62,
                                        right:
                                            screenheight / height_figma * 330,
                                      ),
                                      child: Container(
                                        width: screenwidth / width_figma * 97,
                                        height:
                                            screenheight / height_figma * 24,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(16),
                                            color: LightBlue),
                                        child: items[index].situation ==
                                                "completed"
                                            ? Center(
                                                child: Text(
                                                "پرداخت شده",
                                                style: TextStyle(
                                                  fontWeight: FontWeight.w800,
                                                  fontSize: 14,
                                                  color: Colors.white,
                                                ),
                                              ))
                                            : items[index].situation ==
                                                    "Expectation"
                                                ? Center(
                                                    child: Text(
                                                    "پرداخت شده",
                                                    style: TextStyle(
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.w800,
                                                      color: Colors.white,
                                                    ),
                                                  ))
                                                : Center(
                                                    child: Text(
                                                    "پرداخت نشده",
                                                    style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.w800,
                                                      fontSize: 14,
                                                      color: Colors.white,
                                                    ),
                                                  )),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  );
                } else {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
              },
            ),
            SizedBox(
              height: screenheight / height_figma * 39,
            ),
            Padding(
              padding: EdgeInsets.only(
                right: screenwidth / width_figma * 37,
                left: screenwidth / width_figma * 37,
              ),
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
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
                                  Directionality(
                                    textDirection: TextDirection.rtl,
                                    child: Center(
                                      child: Text(
                                        "آیا از حذف تکنسین انتخاب شده مطمعن هستید؟"
                                        "\n         تمامی اطلاعات شخص پاک خواهد شد!",
                                        style: TextStyle(
                                          color: fontcolor,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w700,
                                            fontFeatures: [FontFeature('ss01', 1),]
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: screenheight / height_figma * 39,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      GestureDetector(
                                        onTap: () {
                                          Get.back(result: false);
                                        },
                                        child: Container(
                                          height:
                                              screenheight / height_figma * 36,
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
                                          Get.back(result: true);
                                        },
                                        child: Container(
                                          height:
                                              screenheight / height_figma * 36,
                                          width:
                                              screenwidth / width_figma * 100,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(48),
                                              gradient: LinearGradient(
                                                  begin: Alignment.topRight,
                                                  end: Alignment.bottomLeft,
                                                  colors: [LightBlue, White])),
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
                      child: Container(
                        width: screenwidth / width_figma * 120,
                        height: screenheight / height_figma * 48,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            color: rediligal,
                            width: 2,
                          ),
                        ),
                        child: Center(
                          child: Text(
                            "حذف تکنسین",
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: rediligal,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: screenwidth / width_figma * 14,
                    ),
                    GestureDetector(
                      onTap: () {
                        Get.to(SalaryPayment(), arguments: [
                          items2[0],
                          items2[1],
                          items2[2],
                          items2[3],
                        ]);
                      },
                      child: Container(
                        width: screenwidth / width_figma * 120,
                        height: screenheight / height_figma * 48,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: LightBlue),
                        child: Center(
                          child: Text(
                            "پرداخت حق الزحمه",
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: lightwhite,
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
              height: screenheight / height_figma * 33,
            ),
          ],
        ),
      ),
    );
  }
}
