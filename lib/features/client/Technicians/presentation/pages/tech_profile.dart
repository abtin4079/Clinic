import 'dart:ui';

import 'package:clinic/features/client/Technicians/presentation/pages/activity_history.dart';
import 'package:clinic/features/client/Technicians/presentation/pages/payment_history.dart';
import 'package:clinic/features/client/Technicians/presentation/pages/salary_payment.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../../../themes/colors.dart';
import '../../../Home/domain/entity.dart';
import '../../../Home/presentation/pages/plant_info.dart';

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

   // var items2 = Get.arguments;

    return Scaffold(
      backgroundColor: backgroundHome,
      appBar: AppBar(
        backgroundColor: backgroundHome,
        elevation: 0,
        centerTitle: true,
        title: Text(
          "پروفایل تکنسین",
          style: TextStyle(
            fontSize: 24 * screenheight / height_figma,
            fontWeight: FontWeight.w700,
            fontFeatures: [
              FontFeature('ss01', 1),
            ],
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
                          width: 100 * screenheight / height_figma,
                          height: 100 * screenheight / height_figma,
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
                              fontSize: 16 * screenheight / height_figma,
                              fontWeight: FontWeight.w700,
                              color: fontcolor,
                              fontFeatures: [
                                FontFeature('ss01', 1),
                              ]),
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
                              fontSize: 14 * screenheight / height_figma,
                              fontWeight: FontWeight.w400,
                              color: fontcolor,
                              fontFeatures: [
                                FontFeature('ss01', 1),
                              ]),
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
                                "0024158759",
                                style: TextStyle(
                                    fontSize: 14 * screenheight / height_figma,
                                    fontWeight: FontWeight.w400,
                                    color: fontcolor,
                                    fontFeatures: [
                                      FontFeature('ss01', 1),
                                    ]),
                              ),
                              SizedBox(
                                height: screenheight / height_figma * 24,
                              ),
                              Text(
                               "01248579554",
                                style: TextStyle(
                                  fontSize: 14 * screenheight / height_figma,
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
                                  fontSize: 14 * screenheight / height_figma,
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
                                    fontSize: 14 * screenheight / height_figma,
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
                                      fontSize:
                                          14 * screenheight / height_figma,
                                      fontWeight: FontWeight.w400,
                                      color: fontcolor,
                                      fontFeatures: [
                                        FontFeature('ss01', 1),
                                      ]),
                                ),
                                SizedBox(
                                  height: screenheight / height_figma * 24,
                                ),
                                Text(
                                  "شماره کارت:",
                                  style: TextStyle(
                                      fontSize:
                                          14 * screenheight / height_figma,
                                      fontWeight: FontWeight.w400,
                                      color: fontcolor,
                                      fontFeatures: [
                                        FontFeature('ss01', 1),
                                      ]),
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
                          Get.to(ActivityHistory());
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
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: items == null ? 0 : items.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          Get.to(PlantInfo(), arguments: [
                            items[index].id,
                            items[index].tech,
                            items[index].zibajo,
                            items[index].situation,
                            items[index].number_of_hairs
                          ]);
                        },
                        child: Padding(
                          padding: EdgeInsets.only(
                            top: screenheight / height_figma * 10,
                            right: screenwidth / width_figma * 17,
                            left: screenwidth / width_figma * 19,
                            bottom: screenheight / height_figma * 10,
                          ),
                          child: Container(
                            width: screenwidth / width_figma * 396,
                            height: 164,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(16),
                                color: Colors.white),
                            child: Directionality(
                              textDirection: TextDirection.rtl,
                              child: Padding(
                                padding: EdgeInsets.only(
                                  top: screenheight / height_figma * 17,
                                  right: screenwidth / width_figma * 16,
                                  left: screenwidth / width_figma * 16,
                                  bottom: screenheight / height_figma * 17,
                                ),
                                child: Row(
                                  children: [
                                    Image.asset(
                                        "lib/features/client/Home/presentation/images/gol.png"),
                                    SizedBox(
                                      width: screenwidth / width_figma * 10,
                                    ),
                                    Container(
                                      width: screenwidth / width_figma * 110,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "کاشت مو",
                                            style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w700,
                                                color: fontcolor),
                                          ),
                                          SizedBox(
                                            height:
                                                screenheight / height_figma * 6,
                                          ),
                                          Text(
                                            "تکنسین:",
                                            style: TextStyle(
                                                fontWeight: FontWeight.w500,
                                                fontSize: 14,
                                                color: grayColorHome),
                                          ),
                                          SizedBox(
                                            height:
                                                screenheight / height_figma * 3,
                                          ),
                                          Text(
                                            items[index].tech.toString(),
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
                                                fontWeight: FontWeight.w500,
                                                fontSize: 14,
                                                color: grayColorHome),
                                          ),
                                          SizedBox(
                                            height:
                                                screenheight / height_figma * 3,
                                          ),
                                          Text(
                                            items[index].zibajo.toString(),
                                            style: TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w500,
                                                color: fontcolor),
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      width: screenwidth / width_figma * 53,
                                    ),
                                    Column(
                                      children: [
                                        SizedBox(
                                          height:
                                              screenheight / height_figma * 32,
                                        ),
                                        Text(
                                          "تار مو:",
                                          style: TextStyle(
                                              fontWeight: FontWeight.w500,
                                              fontSize: 14,
                                              color: grayColorHome),
                                        ),
                                        SizedBox(
                                          height:
                                              screenheight / height_figma * 3,
                                        ),
                                        Text(
                                          items[index]
                                              .number_of_hairs
                                              .toString(),
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
                                          "وضعیت:",
                                          style: TextStyle(
                                              fontWeight: FontWeight.w500,
                                              fontSize: 14,
                                              color: grayColorHome),
                                        ),
                                        SizedBox(
                                          height:
                                              screenheight / height_figma * 3,
                                        ),
                                        items[index].situation == "Expectation"
                                            ? Container(
                                                width: screenwidth /
                                                    width_figma *
                                                    97,
                                                height: 24,
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            16),
                                                    color: processColor),
                                                child: Center(
                                                  child: Text(
                                                    "در انتظار تایید",
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.w800,
                                                        fontSize: 14,
                                                        color: Colors.white),
                                                  ),
                                                ),
                                              )
                                            : items[index].situation ==
                                                    "completed"
                                                ? Container(
                                                    width: screenwidth /
                                                        width_figma *
                                                        97,
                                                    height: 24,
                                                    decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(16),
                                                        color: LightBlue),
                                                    child: Center(
                                                      child: Text(
                                                        "تایید شده",
                                                        style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.w800,
                                                            fontSize: 14,
                                                            color:
                                                                Colors.white),
                                                      ),
                                                    ),
                                                  )
                                                : Container(
                                                    width: screenwidth /
                                                        width_figma *
                                                        97,
                                                    height: 24,
                                                    decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(16),
                                                        color: rediligal),
                                                    child: Center(
                                                      child: Text(
                                                        "در حال انجام",
                                                        style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.w800,
                                                            fontSize: 14,
                                                            color:
                                                                Colors.white),
                                                      ),
                                                    ),
                                                  ),
                                      ],
                                    ),
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
                          Get.to(PaymentHistory());
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
                        child: Padding(
                          padding: EdgeInsets.only(
                            top: screenheight / height_figma * 10,
                            bottom: screenheight / height_figma * 10,
                            left: screenwidth / width_figma * 10,
                            right: screenwidth / width_figma * 8,
                          ),
                          child: Container(
                            width: screenwidth / width_figma * 396,
                            height: 108,
                            padding: EdgeInsets.only(
                              top: screenheight / height_figma * 7,
                              bottom: screenheight / height_figma * 7,
                              left: screenwidth / width_figma * 18,
                              right: screenwidth / width_figma * 16,
                            ),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(16),
                                color: Colors.white),
                            child: Directionality(
                              textDirection: TextDirection.rtl,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Center(
                                    child: Text(
                                      "15000000 ریال",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w700,
                                          fontSize: 16,
                                          color: fontcolor),
                                    ),
                                  ),
                                  SizedBox(
                                    height: screenheight / height_figma * 15,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "از تاریخ:",
                                            style: TextStyle(
                                                fontWeight: FontWeight.w500,
                                                fontSize: 14,
                                                color: grayColorHome),
                                          ),
                                          SizedBox(
                                            height:
                                                screenheight / height_figma * 4,
                                          ),
                                          Container(
                                            width: 100,
                                            child: Text(
                                              "سه شنبه 13 آذر",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 14,
                                                  color: fontcolor),
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        width: screenwidth / width_figma * 28,
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "تا تاریخ:",
                                            style: TextStyle(
                                                fontWeight: FontWeight.w500,
                                                fontSize: 14,
                                                color: grayColorHome),
                                          ),
                                          SizedBox(
                                            height:
                                                screenheight / height_figma * 4,
                                          ),
                                          Container(
                                            width: 100,
                                            child: Text(
                                              "سه شنبه 13 آذر",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 14,
                                                  color: fontcolor),
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        width: screenwidth / width_figma * 28,
                                      ),
                                      Column(
                                        children: [
                                          Text(
                                            "وضعیت:",
                                            style: TextStyle(
                                                fontWeight: FontWeight.w500,
                                                fontSize: 14,
                                                color: grayColorHome),
                                          ),
                                          Container(
                                            width:
                                                screenwidth / width_figma * 97,
                                            height: 24,
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
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
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
              height: screenheight / height_figma * 25,
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
                              height: screenheight / height_figma * 200,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(28),
                                color: Colors.white,
                              ),
                              child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SizedBox(
                                    height: screenheight / height_figma * 41,
                                  ),
                                  Directionality(
                                    textDirection: TextDirection.rtl,
                                    child: Center(
                                      child: Text(
                                        "آیا از حذف تکنسین انتخاب شده مطمعن هستید؟"
                                        "\n               تمامی اطلاعات شخص پاک خواهد شد!",
                                        style: TextStyle(
                                            color: fontcolor,
                                            fontSize: 14,
                                            fontWeight: FontWeight.w700,
                                            fontFeatures: [
                                              FontFeature('ss01', 1),
                                            ]),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: screenheight / height_figma * 30,
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
                        height: 48,
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
                        Get.to(SalaryPayment());
                      },
                      child: Container(
                        width: screenwidth / width_figma * 120,
                        height: 48,
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
              height: screenheight / height_figma * 40,
            ),
          ],
        ),
      ),
    );
  }
}
