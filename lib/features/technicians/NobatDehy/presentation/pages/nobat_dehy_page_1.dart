import 'dart:ui';
import 'package:clinic/features/technicians/NobatDehy/presentation/pages/nobat_dehy_page_2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../../../../../themes/colors.dart';
import '../../../../client/Home/domain/entity.dart';
import 'package:clinic/features/technicians/NobatDehy/Controllers/nobat_dehy_main_controller.dart';
import 'package:clinic/features/technicians/NobatDehy/Models/nobat_tech.dart';
import 'package:clinic/features/technicians/NobatDehy/Controllers/nobat_dehy_page_2_controller.dart';
import '../../../NavigationBar/navigation_bar_for_tech.dart';

class NobatDehyPage1 extends StatefulWidget {
  const NobatDehyPage1({Key? key}) : super(key: key);

  @override
  State<NobatDehyPage1> createState() => _NobatDehyPage1State();
}

class _NobatDehyPage1State extends State<NobatDehyPage1> {
  NobatDehiMainController listOfAppointmentController =
      Get.put(NobatDehiMainController());

  NobatDehiSecondPageController eachAppointment =
      Get.put(NobatDehiSecondPageController());

  @override
  Widget build(BuildContext context) {
    final screenheight = MediaQuery.of(context).size.height;
    final height_figma = 926;
    final screenwidth = MediaQuery.of(context).size.width;
    final width_figma = 428;
    final CoefficientHeight = screenheight / height_figma;

    return Scaffold(
      backgroundColor: backgroundHome,
      appBar: AppBar(
        backgroundColor: backgroundHome,
        elevation: 0,
        centerTitle: true,
        title: Text(
          "نوبت دهی",
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w700,
            color: fontcolor,
          ),
        ),
      ),
      body:
          // SingleChildScrollView(
          // child:
          FutureBuilder(
        future: listOfAppointmentController.getTechAppointments(),
        builder: (context, data) {
          if (data.hasError) {
            return Text("${data.error}");
          } else if (data.hasData) {
            var items = data.data as List<NobatTech>;
            if (items.length == 0) {
              return Center(
                child: Text("نوبتی در حال حاضر وجود ندارد"),
              );
            } else {
              return ListView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount: items == null ? 0 : items.length,
                itemBuilder: (context, index) {
                  NobatTech nobat = items[index];
                  return GestureDetector(
                    onTap: () {
                      Get.to(
                        NobatDehyPage2(),
                        arguments: nobat,
                      );
                    },
                    child: Padding(
                      padding: EdgeInsets.only(
                        right: screenwidth / width_figma * 16,
                        left: screenwidth / width_figma * 16,
                        top: 4,
                        bottom: 4,
                      ),
                      child: Container(
                        // width: screenwidth / width_figma * 396,
                        // height: 180, // inja man as context estefade nakardam
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            color: Colors.white),
                        child: Directionality(
                          textDirection: TextDirection.rtl,
                          child: Padding(
                              padding: EdgeInsets.only(
                                // right: screenwidth / width_figma * 16,
                                // left: screenwidth / width_figma * 16,
                                top: 16,
                                bottom: 16,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    // width: screenwidth / width_figma * 364,
                                    height: 100,
                                    child: Row(
                                      children: [
                                        Image.asset(
                                            "lib/features/technicians/ZibajoyanMan/Images/nobat.png"),
                                        SizedBox(
                                          width: screenwidth / width_figma * 8,
                                        ),
                                        Container(
                                          width:
                                              screenwidth / width_figma * 110,
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              SizedBox(
                                                height: 5,
                                              ),
                                              Text(
                                                nobat.operation!,
                                                style: TextStyle(
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.w700,
                                                    color: fontcolor,
                                                    fontFeatures: [
                                                      FontFeature('ss01', 1),
                                                    ]),
                                              ),
                                              SizedBox(
                                                height: 16,
                                              ),
                                              Text(
                                                "زیباجو:",
                                                style: TextStyle(
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 14,
                                                  color: grayColorHome,
                                                ),
                                              ),
                                              SizedBox(
                                                height: 4,
                                              ),
                                              Text(
                                                nobat.pationt_name!,
                                                style: TextStyle(
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.w500,
                                                    color: fontcolor,
                                                    fontFeatures: [
                                                      FontFeature('ss01', 1),
                                                    ]),
                                              ),
                                            ],
                                          ),
                                        ),
                                        SizedBox(
                                          width: screenwidth / width_figma * 64,
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                              width: screenwidth /
                                                  width_figma *
                                                  100,
                                              height: 24,
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(16),
                                                  color: processColor),
                                              child: Center(
                                                child: Text(
                                                  "در انتظار تایید",
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.w800,
                                                      fontSize: 14,
                                                      color: Colors.white,
                                                      fontFeatures: [
                                                        FontFeature('ss01', 1),
                                                      ]),
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              height: 16,
                                            ),
                                            Text(
                                              "تاریخ:",
                                              style: TextStyle(
                                                fontWeight: FontWeight.w500,
                                                fontSize: 14,
                                                color: grayColorHome,
                                              ),
                                            ),
                                            SizedBox(
                                              height: 4,
                                            ),
                                            Text(
                                              nobat.visit_date!.substring(
                                                  0,
                                                  nobat.visit_date!.length -
                                                      10),
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w500,
                                                  color: fontcolor),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                      // height: 10,
                                      ),
                                  Row(
                                    children: [
                                      GestureDetector(
                                        onTap: () {
                                          showDialog(
                                              context: context,
                                              builder: (BuildContext context) {
                                                return FutureBuilder<bool>(
                                                    future: eachAppointment
                                                        .acceptOrRejectProcess(
                                                            true,
                                                            nobat.id
                                                                .toString()),
                                                    builder: (context, data) {
                                                      if (data.connectionState ==
                                                          ConnectionState
                                                              .waiting) {
                                                        // Display a loading indicator while waiting for the future to complete
                                                        return Center(
                                                          child:
                                                              CircularProgressIndicator(),
                                                        );
                                                      } else if (data
                                                          .hasError) {
                                                        // Handle any errors that might occur during the asynchronous call
                                                        return Dialog(
                                                          child: Text(
                                                              "مشکلی به وجود آمد: ${data.error}"),
                                                        );
                                                      } else {
                                                        // Future has completed, check the result
                                                        bool result =
                                                            data.data!;
                                                        if (result == false) {
                                                          // Show the dialog if there is an issue
                                                          return Dialog(
                                                            child: Text(
                                                                "مشکلی به وجود آمد"),
                                                          );
                                                        } else {
                                                          // Return a custom designed Dialog if the result is true
                                                          return Dialog(
                                                            child: Container(
                                                              width: screenwidth /
                                                                  width_figma *
                                                                  356,
                                                              height: 232,
                                                              decoration:
                                                                  BoxDecoration(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            50),
                                                                color: Colors
                                                                    .white,
                                                              ),
                                                              child: Padding(
                                                                padding:
                                                                    EdgeInsets
                                                                        .only(),
                                                                child: Column(
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .center,
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .center,
                                                                  children: [
                                                                    SizedBox(
                                                                      height:
                                                                          40,
                                                                    ),
                                                                    Image.asset(
                                                                        "lib/features/technicians/ZibajoyanMan/Images/popped_up.png"),
                                                                    SizedBox(
                                                                      height: 8,
                                                                    ),
                                                                    Directionality(
                                                                      textDirection:
                                                                          TextDirection
                                                                              .rtl,
                                                                      child:
                                                                          Center(
                                                                        child:
                                                                            Text(
                                                                          "نوبت کاشت مو با موفقیت به لیست زیباجویان شما اضافه شد",
                                                                          style:
                                                                              TextStyle(
                                                                            color:
                                                                                fontcolor,
                                                                            fontSize:
                                                                                16,
                                                                            fontWeight:
                                                                                FontWeight.w500,
                                                                            fontFeatures: [
                                                                              FontFeature('ss01', 1)
                                                                            ],
                                                                          ),
                                                                          maxLines:
                                                                              null,
                                                                          textAlign:
                                                                              TextAlign.center,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    SizedBox(
                                                                      height:
                                                                          24,
                                                                    ),
                                                                    Center(
                                                                      child:
                                                                          Row(
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.center,
                                                                        children: [
                                                                          GestureDetector(
                                                                            onTap:
                                                                                () {
                                                                              setState(() {
                                                                                Get.to(
                                                                                  Techpages(),
                                                                                  arguments: 2,
                                                                                );
                                                                              });
                                                                            },
                                                                            child:
                                                                                Container(
                                                                              height: 36,
                                                                              width: screenwidth / width_figma * 142,
                                                                              decoration: BoxDecoration(
                                                                                  borderRadius: BorderRadius.circular(
                                                                                      48),
                                                                                  gradient: LinearGradient(begin: Alignment.topRight, end: Alignment.bottomLeft, colors: [
                                                                                    rediligal,
                                                                                    whiteiligal
                                                                                  ])),
                                                                              child: Center(
                                                                                child: Text(
                                                                                  "مشاهده زیباجویان من",
                                                                                  style: TextStyle(
                                                                                    fontWeight: FontWeight.w700,
                                                                                    fontSize: 12,
                                                                                    color: Colors.white,
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                          SizedBox(
                                                                            width: screenwidth /
                                                                                width_figma *
                                                                                8,
                                                                          ),
                                                                          GestureDetector(
                                                                            onTap:
                                                                                () {
                                                                              setState(() {
                                                                                items.removeAt(index);
                                                                                Get.back(result: true);
                                                                              });
                                                                            },
                                                                            child:
                                                                                Container(
                                                                              height: 36,
                                                                              width: screenwidth / width_figma * 152,
                                                                              decoration: BoxDecoration(
                                                                                  borderRadius: BorderRadius.circular(
                                                                                      48),
                                                                                  gradient: LinearGradient(begin: Alignment.topRight, end: Alignment.bottomLeft, colors: [
                                                                                    LightBlue,
                                                                                    White
                                                                                  ])),
                                                                              child: Center(
                                                                                child: Text(
                                                                                  "!متوجه شدم",
                                                                                  style: TextStyle(
                                                                                    fontWeight: FontWeight.w700,
                                                                                    fontSize: 12,
                                                                                    color: Colors.white,
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                            ),
                                                          );
                                                        }
                                                      }
                                                    });
                                              });
                                        },
                                        child: Container(
                                          width:
                                              screenwidth / width_figma * 213,
                                          height: 36,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(48),
                                            gradient: LinearGradient(
                                                begin: Alignment.topRight,
                                                end: Alignment.bottomLeft,
                                                colors: [LightBlue, White]),
                                          ),
                                          child: Center(
                                            child: Text(
                                              "قبول نوبت",
                                              style: TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w800,
                                                color: Colors.white,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: screenwidth / width_figma * 50,
                                      ),
                                      MaterialButton(
                                        onPressed: () {
                                          showDialog(
                                            context: context,
                                            builder: (context) => Dialog(
                                              child: Container(
                                                width: screenwidth /
                                                    width_figma *
                                                    356,
                                                height: 170,
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(28),
                                                  color: Colors.white,
                                                ),
                                                child: Column(
                                                  children: [
                                                    SizedBox(
                                                      height: 41,
                                                    ),
                                                    Directionality(
                                                      textDirection:
                                                          TextDirection.rtl,
                                                      child: Center(
                                                        child: Text(
                                                          "آیا از رد نوبت  مطمعن هستید؟",
                                                          style: TextStyle(
                                                              color: fontcolor,
                                                              fontSize: 16,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w700,
                                                              fontFeatures: [
                                                                FontFeature(
                                                                    'ss01', 1),
                                                              ]),
                                                        ),
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      height: 39,
                                                    ),
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        GestureDetector(
                                                          onTap: () {
                                                            Get.back(
                                                                result: false);
                                                            showDialog(
                                                                context:
                                                                    context,
                                                                builder:
                                                                    (BuildContext
                                                                        context) {
                                                                  return FutureBuilder<
                                                                          bool>(
                                                                      future: eachAppointment.acceptOrRejectProcess(
                                                                          false,
                                                                          nobat
                                                                              .id
                                                                              .toString()),
                                                                      builder:
                                                                          (context,
                                                                              data) {
                                                                        if (data.connectionState ==
                                                                            ConnectionState
                                                                                .waiting) {
                                                                          // Display a loading indicator while waiting for the future to complete
                                                                          return Center(
                                                                            child:
                                                                                CircularProgressIndicator(),
                                                                          );
                                                                        } else if (data
                                                                            .hasError) {
                                                                          // Handle any errors that might occur during the asynchronous call
                                                                          return Dialog(
                                                                            child:
                                                                                Text("مشکلی به وجود آمد: ${data.error}"),
                                                                          );
                                                                        } else {
                                                                          // Future has completed, check the result
                                                                          bool
                                                                              result =
                                                                              data.data!;
                                                                          if (result ==
                                                                              false) {
                                                                            // Show the dialog if there is an issue
                                                                            return Dialog(
                                                                              child: Text("مشکلی به وجود آمد"),
                                                                            );
                                                                          } else {
                                                                            // Return a custom designed Dialog if the result is true
                                                                            return Dialog(
                                                                              child: Container(
                                                                                width: screenwidth / width_figma * 356,
                                                                                height: 232,
                                                                                decoration: BoxDecoration(
                                                                                  borderRadius: BorderRadius.circular(50),
                                                                                  color: Colors.white,
                                                                                ),
                                                                                child: Padding(
                                                                                  padding: EdgeInsets.only(),
                                                                                  child: Column(
                                                                                    crossAxisAlignment: CrossAxisAlignment.center,
                                                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                                                    children: [
                                                                                      SizedBox(
                                                                                        height: 40,
                                                                                      ),
                                                                                      Image.asset("lib/features/technicians/ZibajoyanMan/Images/popped_up.png"),
                                                                                      SizedBox(
                                                                                        height: 8,
                                                                                      ),
                                                                                      Directionality(
                                                                                        textDirection: TextDirection.rtl,
                                                                                        child: Center(
                                                                                          child: Text(
                                                                                            "با موفقیت حذف شد",
                                                                                            style: TextStyle(
                                                                                              color: fontcolor,
                                                                                              fontSize: 16,
                                                                                              fontWeight: FontWeight.w500,
                                                                                              fontFeatures: [
                                                                                                FontFeature('ss01', 1)
                                                                                              ],
                                                                                            ),
                                                                                            maxLines: null,
                                                                                            textAlign: TextAlign.center,
                                                                                          ),
                                                                                        ),
                                                                                      ),
                                                                                      SizedBox(
                                                                                        height: 24,
                                                                                      ),
                                                                                      Center(
                                                                                        child: Row(
                                                                                          mainAxisAlignment: MainAxisAlignment.center,
                                                                                          children: [
                                                                                            GestureDetector(
                                                                                              onTap: () {
                                                                                                setState(() {
                                                                                                  Get.back(result: false);
                                                                                                  items.removeAt(index);
                                                                                                });
                                                                                              },
                                                                                              child: Container(
                                                                                                height: 36,
                                                                                                width: screenwidth / width_figma * 142,
                                                                                                decoration: BoxDecoration(borderRadius: BorderRadius.circular(48), gradient: LinearGradient(begin: Alignment.topRight, end: Alignment.bottomLeft, colors: [rediligal, whiteiligal])),
                                                                                                child: Center(
                                                                                                  child: Text(
                                                                                                    "باشه",
                                                                                                    style: TextStyle(
                                                                                                      fontWeight: FontWeight.w700,
                                                                                                      fontSize: 12,
                                                                                                      color: Colors.white,
                                                                                                    ),
                                                                                                  ),
                                                                                                ),
                                                                                              ),
                                                                                            ),
                                                                                          ],
                                                                                        ),
                                                                                      ),
                                                                                    ],
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            );
                                                                          }
                                                                        }
                                                                      });
                                                                });
                                                          },
                                                          child: Container(
                                                            height: 36,
                                                            width: screenwidth /
                                                                width_figma *
                                                                100,
                                                            decoration: BoxDecoration(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            48),
                                                                gradient: LinearGradient(
                                                                    begin: Alignment
                                                                        .topRight,
                                                                    end: Alignment.bottomLeft,
                                                                    colors: [
                                                                      rediligal,
                                                                      whiteiligal
                                                                    ])),
                                                            child: Center(
                                                              child: Text(
                                                                "رد نوبت",
                                                                style:
                                                                    TextStyle(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w700,
                                                                  fontSize: 14,
                                                                  color: Colors
                                                                      .white,
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          width: screenwidth /
                                                              width_figma *
                                                              8,
                                                        ),
                                                        GestureDetector(
                                                          onTap: () {
                                                            Get.back(
                                                                result: true);
                                                          },
                                                          child: Container(
                                                            height: 36,
                                                            width: screenwidth /
                                                                width_figma *
                                                                100,
                                                            decoration: BoxDecoration(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            48),
                                                                gradient: LinearGradient(
                                                                    begin: Alignment
                                                                        .topRight,
                                                                    end: Alignment.bottomLeft,
                                                                    colors: [
                                                                      LightBlue,
                                                                      White
                                                                    ])),
                                                            child: Center(
                                                              child: Text(
                                                                "انصراف",
                                                                style:
                                                                    TextStyle(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w700,
                                                                  fontSize: 14,
                                                                  color: Colors
                                                                      .white,
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
                                        child: Text(
                                          "رد نوبت",
                                          style: TextStyle(
                                              fontWeight: FontWeight.w800,
                                              fontSize: 14,
                                              color: germeztiz),
                                        ),
                                      )
                                    ],
                                  ),
                                ],
                              )),
                        ),
                      ),
                    ),
                  );
                },
              );
            }
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
      // ),
    );
  }
}
