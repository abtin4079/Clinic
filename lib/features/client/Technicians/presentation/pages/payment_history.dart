import 'dart:ui';

import 'package:clinic/features/client/Technicians/presentation/pages/salary_payment.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../../../themes/colors.dart';
import '../../../Home/domain/entity.dart';

class PaymentHistory extends StatefulWidget {
  const PaymentHistory({Key? key}) : super(key: key);

  @override
  State<PaymentHistory> createState() => _PaymentHistoryState();
}

class _PaymentHistoryState extends State<PaymentHistory> {
  @override
  Widget build(BuildContext context) {
    final screenheight = MediaQuery.of(context).size.height;
    final height_figma = 926;
    final screenwidth = MediaQuery.of(context).size.width;
    final width_figma = 428;

    //  var items2 = Get.arguments;

    return Scaffold(
      backgroundColor: backgroundHome,
      appBar: AppBar(
        // Add your page title here
        backgroundColor: backgroundHome,
        iconTheme: IconThemeData(color: Color(0xff999999)),
        automaticallyImplyLeading: true,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context); // Handle back navigation here
          },
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
                height: screenheight / height_figma * 320,
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
                      child: Directionality(
                        textDirection: TextDirection.ltr,
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
                                      fontSize:
                                          14 * screenheight / height_figma,
                                      fontWeight: FontWeight.w400,
                                      color: grayColorHome,
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
                                    color: grayColorHome,
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
                                      fontSize:
                                          14 * screenheight / height_figma,
                                      fontWeight: FontWeight.w500,
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
                                        fontWeight: FontWeight.w500,
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
                        "تاریخچه پرداخت ها",
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                            color: fontcolor),
                      ),
                    ],
                  ),
                )),
            FutureBuilder(
              future: ReadJsonData(),
              builder: (context, data) {
                if (data.hasError) {
                  return Text("${data.error}");
                } else if (data.hasData) {
                  var items = data.data as List<EntityHome>;
                  return ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
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
                                            // width: 100,
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
          ],
        ),
      ),
    );
  }
}
