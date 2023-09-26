import 'dart:ui';

import 'package:clinic/features/technicians/NobatDehy/presentation/pages/nobat_dehy_page_2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../../../themes/colors.dart';
import '../../../../client/Home/domain/entity.dart';

class NobatDehyPage1 extends StatefulWidget {
  const NobatDehyPage1({Key? key}) : super(key: key);

  @override
  State<NobatDehyPage1> createState() => _NobatDehyPage1State();
}

class _NobatDehyPage1State extends State<NobatDehyPage1> {
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
          "نوبت دهی",
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w700,
            color: fontcolor,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: FutureBuilder(
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
                    onTap: () {
                      Get.to(NobatDehyPage2());
                    },
                    child: Padding(
                      padding: EdgeInsets.only(
                        right: screenwidth / width_figma * 16,
                        left: screenwidth / width_figma * 16,
                        top: screenheight / height_figma * 4,
                        bottom: screenheight / height_figma * 4,
                      ),
                      child: Container(
                        width: screenwidth / width_figma * 396,
                        height: 174,                                              // inja man as context estefade nakardam
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            color: Colors.white),
                        child: Directionality(
                          textDirection: TextDirection.rtl,
                          child: Padding(
                            padding: EdgeInsets.only(
                              right: screenwidth / width_figma * 16,
                              left: screenwidth / width_figma * 16,
                              top: screenheight / height_figma * 16,
                              bottom: screenheight / height_figma * 16,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Image.asset("lib/features/technicians/ZibajoyanMan/Images/nobat.png"),
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
                                          Text(
                                            "کاشت مو",
                                            style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w700,
                                                color: fontcolor,
                                                fontFeatures: [FontFeature('ss01', 1),]
                                            ),
                                          ),
                                          SizedBox(
                                            height: screenheight /
                                                height_figma *
                                                16,
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
                                            height: screenheight /
                                                height_figma *
                                                4,
                                          ),
                                          Text(
                                            items[index].zibajo.toString(),
                                            style: TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w500,
                                                color: fontcolor,
                                                fontFeatures: [FontFeature('ss01', 1),]),
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      width: screenwidth / width_figma * 64,
                                    ),
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          width: screenwidth / width_figma * 100,
                                          height: screenheight /height_figma * 24,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(16),
                                            color: processColor
                                          ),
                                          child: Center(
                                            child: Text("در انتظار تایید", style: TextStyle(
                                              fontWeight: FontWeight.w800,
                                              fontSize: 14,
                                              color: Colors.white,
                                                fontFeatures: [FontFeature('ss01', 1),]
                                            ),),
                                          ),
                                        ),
                                        SizedBox(
                                          height: screenheight /
                                              height_figma *
                                              16,
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
                                          height: screenheight /
                                              height_figma *
                                              4,
                                        ),
                                        Text(
                                          "دوشنبه 12 آذر",
                                          style: TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w500,
                                              color: fontcolor),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: screenheight / height_figma * 16,
                                ),
                                Row(
                                  children: [
                                    GestureDetector(
                                      onTap: (){},
                                      child: Container(
                                        width: screenwidth / width_figma * 213,
                                        height: screenheight / height_figma * 36,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(48),
                                          gradient: LinearGradient(
                                            begin: Alignment.topRight,
                                            end: Alignment.bottomLeft,
                                            colors: [
                                              LightBlue,
                                              White
                                            ]
                                          ),
                                        ),
                                        child: Center(
                                          child: Text("قبول نوبت", style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w800,
                                            color: Colors.white,
                                          ),),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: screenwidth / width_figma * 50,
                                    ),
                                    MaterialButton(
                                      onPressed: (){},
                                      child: Text("رد نوبت", style: TextStyle(
                                        fontWeight: FontWeight.w800,
                                        fontSize: 14,
                                        color: germeztiz
                                      ),),
                                    )
                                  ],
                                ),
                              ],
                            )
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
      ),
    );
  }
}
