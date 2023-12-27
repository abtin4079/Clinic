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
import '../domain/mission_model.dart';

class TechProfile extends StatefulWidget {
  const TechProfile({Key? key}) : super(key: key);

  @override
  State<TechProfile> createState() => _TechProfileState();
}

class _TechProfileState extends State<TechProfile> {
  @override
  int road = 0;
  bool isvisible = false;
  bool tar_mission = false;
  bool tar_mission_2 = false;
  double total_amount = 0;
  double first_item = 0;
  double second_item = 0;
  TextEditingController _controller = TextEditingController();

  Widget build(BuildContext context) {
    final screenheight = MediaQuery.of(context).size.height;
    final height_figma = 926;
    final screenwidth = MediaQuery.of(context).size.width;
    final width_figma = 428;

    bool day = false;
    bool week = false;
    bool month = false;
    // var items2 = Get.arguments;

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
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
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
                                      fontSize:
                                          14 * screenheight / height_figma,
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
              Row(
                children: [
                  SizedBox(
                    width: screenwidth / width_figma * 31,
                  ),
                  Text(
                    "انتخاب شیوه پرداخت",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                        color: fontcolor),
                  ),
                ],
              ),
              SizedBox(
                height: screenheight / height_figma * 26,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        road = 1;
                        isvisible = true;
                      });
                    },
                    child: Container(
                      width: screenwidth / width_figma * 110,
                      height: screenheight / height_figma * 80,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(20),
                            bottomRight: Radius.circular(20)),
                        color: road == 1 ? SendagainColorblue : whiteblue,
                      ),
                      child: Center(
                        child: Text(
                          "روزانه",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                            color: road == 1 ? Colors.white : Colors.black,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: screenwidth / width_figma * 2,
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        road = 2;
                        isvisible = true;
                      });
                    },
                    child: Container(
                      width: screenwidth / width_figma * 110,
                      height: screenheight / height_figma * 80,
                      decoration: BoxDecoration(
                        color: road == 2 ? SendagainColorblue : whiteblue,
                      ),
                      child: Center(
                        child: Text(
                          "هفتگی",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                            color: road == 2 ? Colors.white : Colors.black,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: screenwidth / width_figma * 2,
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        road = 3;
                        isvisible = true;
                      });
                    },
                    child: Container(
                      width: screenwidth / width_figma * 110,
                      height: screenheight / height_figma * 80,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            bottomLeft: Radius.circular(20)),
                        color: road == 3 ? SendagainColorblue : whiteblue,
                      ),
                      child: Center(
                        child: Text(
                          "ماهانه",
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w700,
                              color: road == 3 ? Colors.white : Colors.black),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: screenheight / height_figma * 19,
              ),
              isvisible
                  ? Center(
                      child: Container(
                        width: screenwidth / width_figma * 396,
                        //  height: screenheight / height_figma * 1024,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            color: Colors.white),
                        child: Padding(
                          padding: EdgeInsets.only(
                            //right: screenwidth / width_figma * 34,
                            top: screenheight / height_figma * 26,
                          ),
                          child: Column(
                            // crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  SizedBox(
                                    width: screenwidth / width_figma * 43,
                                  ),
                                  Image.asset(
                                      "lib/features/client/Technicians/presentation/images/information-line.png"),
                                  SizedBox(
                                    width: screenwidth / width_figma * 63,
                                  ),
                                  Text(
                                    "از تاریخ",
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w700,
                                        color: phonecolor),
                                  ),
                                  SizedBox(
                                    width: screenwidth / width_figma * 63,
                                  ),
                                  SizedBox(
                                    width: screenwidth / width_figma * 122,
                                    child: Text(
                                      "سه شنبه 13 آذر",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 14,
                                          color: fontcolor),
                                    ),
                                  )
                                ],
                              ),
                              SizedBox(
                                height: screenheight / height_figma * 42,
                              ),
                              Row(
                                children: [
                                  SizedBox(
                                    width: screenwidth / width_figma * 43,
                                  ),
                                  Image.asset(
                                      "lib/features/client/Technicians/presentation/images/information-line.png"),
                                  SizedBox(
                                    width: screenwidth / width_figma * 63,
                                  ),
                                  Text(
                                    "تا تاریخ",
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w700,
                                        color: phonecolor),
                                  ),
                                  SizedBox(
                                    width: screenwidth / width_figma * 63,
                                  ),
                                  SizedBox(
                                    width: screenwidth / width_figma * 122,
                                    child: Text(
                                      "چهار شنبه 13 آذر",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 14,
                                          color: fontcolor),
                                    ),
                                  )
                                ],
                              ),
                              SizedBox(
                                height: screenheight / height_figma * 45,
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                    // right: screenwidth / width_figma * 34,
                                    ),
                                child: Text(
                                  "عملیات ها",
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w700,
                                      color: fontcolor),
                                ),
                              ),
                              FutureBuilder(
                                future: ReadMissionData(),
                                builder: (context, data) {
                                  if (data.hasError) {
                                    return Center(child: Text("${data.error}"));
                                  } else if (data.hasData) {
                                    var items = data.data as List<MissionModel>;

                                    return ListView.builder(
                                        itemCount: items.length,
                                        shrinkWrap: true,
                                        physics: NeverScrollableScrollPhysics(),
                                        scrollDirection: Axis.vertical,
                                        itemBuilder: (context, index) {
                                          return Padding(
                                            padding: EdgeInsets.only(
                                              top: screenheight /
                                                  height_figma *
                                                  20,
                                              bottom: screenheight /
                                                  height_figma *
                                                  20,
                                            ),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                SizedBox(
                                                  height: screenheight /
                                                      height_figma *
                                                      21,
                                                ),
                                                Center(
                                                  child: Text(
                                                    items[index]
                                                        .amaliat
                                                        .toString(),
                                                    style: TextStyle(
                                                        fontSize: 16,
                                                        fontWeight:
                                                            FontWeight.w700,
                                                        fontFeatures: const [
                                                          FontFeature(
                                                              'ss01', 1),
                                                        ],
                                                        color: fontcolor),
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: screenheight /
                                                      height_figma *
                                                      8,
                                                ),
                                                Row(
                                                  children: [
                                                    Padding(
                                                      padding: EdgeInsets.only(
                                                          right: screenwidth /
                                                              width_figma *
                                                              47),
                                                      child: Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Text(
                                                            "تاریخ:",
                                                            style: TextStyle(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                              fontSize: 14,
                                                              color:
                                                                  grayColorHome,
                                                            ),
                                                          ),
                                                          SizedBox(
                                                            height: screenheight /
                                                                height_figma *
                                                                4,
                                                          ),
                                                          Text(
                                                            items[index]
                                                                .date
                                                                .toString(),
                                                            style: TextStyle(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                              fontSize: 14,
                                                              color: fontcolor,
                                                            ),
                                                          ),
                                                          SizedBox(
                                                            height: screenheight /
                                                                height_figma *
                                                                7.5,
                                                          ),
                                                          Text(
                                                            "زیباجو:",
                                                            style: TextStyle(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                              fontSize: 14,
                                                              color:
                                                                  grayColorHome,
                                                            ),
                                                          ),
                                                          SizedBox(
                                                            height: screenheight /
                                                                height_figma *
                                                                4,
                                                          ),
                                                          Text(
                                                            items[index]
                                                                .zibajo
                                                                .toString(),
                                                            style: TextStyle(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                              fontSize: 14,
                                                              color: fontcolor,
                                                            ),
                                                          ),
                                                          SizedBox(
                                                            height: screenheight /
                                                                height_figma *
                                                                7.5,
                                                          ),
                                                          Text(
                                                            "تعداد تار مو:",
                                                            style: TextStyle(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                              fontSize: 14,
                                                              color:
                                                                  grayColorHome,
                                                            ),
                                                          ),
                                                          SizedBox(
                                                            height: screenheight /
                                                                height_figma *
                                                                4,
                                                          ),
                                                          Text(
                                                            items[index]
                                                                .tar_mo
                                                                .toString(),
                                                            style: TextStyle(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                              fontSize: 14,
                                                              color: fontcolor,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      width: screenwidth /
                                                          width_figma *
                                                          50,
                                                    ),
                                                    Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .center,
                                                      children: [
                                                        Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .start,
                                                          children: [
                                                            GestureDetector(
                                                              onTap: () {
                                                                index == 0
                                                                    ? setState(
                                                                        () {
                                                                        tar_mission =
                                                                            true;
                                                                      })
                                                                    : setState(
                                                                        () {
                                                                        tar_mission_2 =
                                                                            true;
                                                                      });
                                                              },
                                                              child: Container(
                                                                width: screenwidth /
                                                                    width_figma *
                                                                    80,
                                                                height: screenheight /
                                                                    height_figma *
                                                                    45,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  borderRadius: BorderRadius.only(
                                                                      topRight:
                                                                          Radius.circular(
                                                                              20),
                                                                      bottomRight:
                                                                          Radius.circular(
                                                                              20)),
                                                                  color: index ==
                                                                          0
                                                                      ? !tar_mission
                                                                          ? toggleColor
                                                                          : SendagainColorblue
                                                                      : !tar_mission_2
                                                                          ? toggleColor
                                                                          : SendagainColorblue,
                                                                ),
                                                                child: Center(
                                                                  child: Text(
                                                                    "به ازای تار مو",
                                                                    style: TextStyle(
                                                                        fontSize: 12,
                                                                        fontWeight: FontWeight.w700,
                                                                        color: index == 0
                                                                            ? !tar_mission
                                                                                ? fontcolor
                                                                                : Colors.white
                                                                            : !tar_mission_2
                                                                                ? fontcolor
                                                                                : Colors.white),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                            SizedBox(
                                                              width: screenwidth /
                                                                  width_figma *
                                                                  2,
                                                            ),
                                                            GestureDetector(
                                                              onTap: () {
                                                                index == 0
                                                                    ? setState(
                                                                        () {
                                                                        tar_mission =
                                                                            false;
                                                                      })
                                                                    : setState(
                                                                        () {
                                                                        tar_mission_2 =
                                                                            false;
                                                                      });
                                                              },
                                                              child: Container(
                                                                width: screenwidth /
                                                                    width_figma *
                                                                    80,
                                                                height: screenheight /
                                                                    height_figma *
                                                                    45,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  borderRadius: BorderRadius.only(
                                                                      topLeft: Radius
                                                                          .circular(
                                                                              20),
                                                                      bottomLeft:
                                                                          Radius.circular(
                                                                              20)),
                                                                  color: index ==
                                                                          0
                                                                      ? tar_mission
                                                                          ? toggleColor
                                                                          : SendagainColorblue
                                                                      : tar_mission_2
                                                                          ? toggleColor
                                                                          : SendagainColorblue,
                                                                ),
                                                                child: Center(
                                                                  child: Text(
                                                                    "به ازای عملیات",
                                                                    style: TextStyle(
                                                                        fontSize: 12,
                                                                        fontWeight: FontWeight.w700,
                                                                        color: index == 0
                                                                            ? tar_mission
                                                                                ? fontcolor
                                                                                : Colors.white
                                                                            : tar_mission_2
                                                                                ? fontcolor
                                                                                : Colors.white),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                        SizedBox(
                                                          height: screenheight /
                                                              height_figma *
                                                              18,
                                                        ),
                                                        index == 0
                                                            ? tar_mission
                                                                ? Text(
                                                                    "هزینه به ازای تار مو (ریال)",
                                                                    style: TextStyle(
                                                                        fontWeight:
                                                                            FontWeight
                                                                                .w500,
                                                                        fontSize:
                                                                            12,
                                                                        color: Colors
                                                                            .black),
                                                                  )
                                                                : Text(
                                                                    "هزینه به ازای عملیات (ریال)",
                                                                    style: TextStyle(
                                                                        fontWeight:
                                                                            FontWeight
                                                                                .w500,
                                                                        fontSize:
                                                                            12,
                                                                        color: Colors
                                                                            .black),
                                                                  )
                                                            : tar_mission_2
                                                                ? Text(
                                                                    "هزینه به ازای تار مو (ریال)",
                                                                    style: TextStyle(
                                                                        fontWeight:
                                                                            FontWeight
                                                                                .w500,
                                                                        fontSize:
                                                                            12,
                                                                        color: Colors
                                                                            .black),
                                                                  )
                                                                : Text(
                                                                    "هزینه به ازای عملیات (ریال)",
                                                                    style: TextStyle(
                                                                        fontWeight:
                                                                            FontWeight
                                                                                .w500,
                                                                        fontSize:
                                                                            12,
                                                                        color: Colors
                                                                            .black),
                                                                  ),
                                                        Container(
                                                          width: MediaQuery.of(
                                                                      context)
                                                                  .size
                                                                  .width /
                                                              3,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: Color(
                                                                0xFFFAFAFA), // Background color
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        12.0), // Adjust the radius as needed
                                                            border: Border.all(
                                                              color: Color(
                                                                  0xFFD7D7D7), // Border color
                                                            ),
                                                          ),
                                                          child: TextField(
                                                            onSubmitted:
                                                                (value) {
                                                              if (index == 0) {
                                                                if (tar_mission) {
                                                                  try {
                                                                    int intValue =
                                                                        int.parse(
                                                                            value);
                                                                    // Now you can use intValue as an integer

                                                                    setState(
                                                                        () {
                                                                      first_item =
                                                                          intValue *
                                                                              2000;
                                                                    });

                                                                    setState(
                                                                        () {
                                                                      total_amount =
                                                                          first_item +
                                                                              second_item;
                                                                    });
                                                                  } catch (e) {
                                                                    // Handle the case where the conversion fails
                                                                    print(
                                                                        'Invalid input. Please enter a valid integer.');
                                                                  }
                                                                } else {
                                                                  try {
                                                                    int intValue =
                                                                        int.parse(
                                                                            value);
                                                                    // Now you can use intValue as an integer

                                                                    setState(
                                                                        () {
                                                                      first_item =
                                                                          intValue *
                                                                              1;
                                                                    });

                                                                    setState(
                                                                        () {
                                                                      total_amount =
                                                                          first_item +
                                                                              second_item;
                                                                    });
                                                                  } catch (e) {
                                                                    // Handle the case where the conversion fails
                                                                    print(
                                                                        'Invalid input. Please enter a valid integer.');
                                                                  }
                                                                }
                                                              } else {
                                                                if (tar_mission) {
                                                                  try {
                                                                    int intValue =
                                                                        int.parse(
                                                                            value);
                                                                    // Now you can use intValue as an integer

                                                                    setState(
                                                                        () {
                                                                      second_item =
                                                                          intValue *
                                                                              3000;
                                                                    });
                                                                    setState(
                                                                        () {
                                                                      total_amount =
                                                                          first_item +
                                                                              second_item;
                                                                    });
                                                                  } catch (e) {
                                                                    // Handle the case where the conversion fails
                                                                    print(
                                                                        'Invalid input. Please enter a valid integer.');
                                                                  }
                                                                } else {
                                                                  try {
                                                                    int intValue =
                                                                        int.parse(
                                                                            value);
                                                                    // Now you can use intValue as an integer

                                                                    setState(
                                                                        () {
                                                                      second_item =
                                                                          intValue *
                                                                              1;
                                                                    });
                                                                    setState(
                                                                        () {
                                                                      total_amount =
                                                                          first_item +
                                                                              second_item;
                                                                    });
                                                                  } catch (e) {
                                                                    // Handle the case where the conversion fails
                                                                    print(
                                                                        'Invalid input. Please enter a valid integer.');
                                                                  }
                                                                }
                                                              }
                                                            },
                                                            // controller: _controller,
                                                            keyboardType:
                                                                TextInputType
                                                                    .number,
                                                            textAlign: TextAlign
                                                                .center,
                                                            decoration:
                                                                InputDecoration(
                                                              // hintText: 'Enter a number',
                                                              border:
                                                                  InputBorder
                                                                      .none,
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          );
                                        });
                                  } else {
                                    return Center(
                                      child: CircularProgressIndicator(),
                                    );
                                  }
                                },
                              ),
                              Center(
                                child: Text(
                                  total_amount.toString() + " ریال ",
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.black),
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
                                          "پرداخت از کیف پول",
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
                              SizedBox(
                                height: screenheight / height_figma * 29,
                              ),
                            ],
                          ),
                        ),
                      ),
                    )
                  : SizedBox(),
              Padding(
                padding: EdgeInsets.only(
                    // left: screenwidth / width_figma * 22,
                    // right: screenwidth / width_figma * 31,
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
              ),
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
                              items[index].tech,
                              items[index].zibajo,
                              items[index].situation,
                              items[index].number_of_hairs.toString(),
                            ]);
                          },
                          child: Padding(
                            padding: EdgeInsets.all(10
                                // top: screenheight / height_figma * 10,
                                // right: screenwidth / width_figma * 17,
                                // left: screenwidth / width_figma * 19,
                                // bottom: screenheight / height_figma * 10,
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
                                              height: screenheight /
                                                  height_figma *
                                                  6,
                                            ),
                                            Text(
                                              "تکنسین:",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 14,
                                                  color: grayColorHome),
                                            ),
                                            SizedBox(
                                              height: screenheight /
                                                  height_figma *
                                                  3,
                                            ),
                                            Text(
                                              items[index].tech.toString(),
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w500,
                                                  color: fontcolor),
                                            ),
                                            SizedBox(
                                              height: screenheight /
                                                  height_figma *
                                                  6,
                                            ),
                                            Text(
                                              "زیباجو:",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 14,
                                                  color: grayColorHome),
                                            ),
                                            SizedBox(
                                              height: screenheight /
                                                  height_figma *
                                                  3,
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
                                            height: screenheight /
                                                height_figma *
                                                32,
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
                                          items[index].situation ==
                                                  "Expectation"
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
                                                                  FontWeight
                                                                      .w800,
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
                                                                  FontWeight
                                                                      .w800,
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
                        // left: screenwidth / width_figma * 22,
                        // right: screenwidth / width_figma * 31,
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
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
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
                                              height: screenheight /
                                                  height_figma *
                                                  4,
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
                                              height: screenheight /
                                                  height_figma *
                                                  4,
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
                                              width: screenwidth /
                                                  width_figma *
                                                  97,
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
      ),
    );
  }
}
