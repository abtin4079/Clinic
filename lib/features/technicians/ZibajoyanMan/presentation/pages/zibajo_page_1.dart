import 'dart:ui';

import 'package:clinic/features/technicians/ZibajoyanMan/presentation/pages/zibajo_page_2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

import '../../../../../themes/colors.dart';
import '../../../../client/Home/domain/entity.dart';
import '../../../../client/NavigationBar/Icons/navigation_bar_icons.dart';
import 'package:clinic/features/technicians/ZibajoyanMan/controllers/zibajo_page_1_controller.dart';
import 'package:clinic/features/technicians/ZibajoyanMan/models/approved_appointments.dart';
import 'package:clinic/features/technicians/ZibajoyanMan/presentation/pages/zibajo_middle_page.dart';

class ZibajoPage1 extends StatefulWidget {
  const ZibajoPage1({Key? key}) : super(key: key);

  @override
  State<ZibajoPage1> createState() => _ZibajoPage1State();
}

class _ZibajoPage1State extends State<ZibajoPage1> {
  ZibajoyanManFirstPage zibajoyanManFirstPage =
      Get.put(ZibajoyanManFirstPage());
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
          "زیباجویان من",
          style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w700,
              color: fontcolor,
              fontFeatures: [
                FontFeature('ss01', 1),
              ]),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: screenwidth / width_figma * 396,
              height: 48,
              margin: EdgeInsets.only(
                left: screenwidth / width_figma * 15,
                right: screenwidth / width_figma * 15,
              ),
              child: TextField(
                textAlign: TextAlign.right,
                decoration: InputDecoration(
                  suffixIcon: Icon(
                    Search.search,
                    size: 24,
                    color: phonecolor,
                  ),
                  hintText: "متن مورد نظر خود را جستجو کنید",
                  hintStyle: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 14,
                    color: phonecolor,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(32),
                    borderSide: BorderSide(
                      color: SendagainColorwhite,
                      width: 2,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: outlineborder, width: 2),
                    borderRadius: BorderRadius.circular(48),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            FutureBuilder(
              future: zibajoyanManFirstPage.getTechApprovedAppointments(),
              builder: (context, data) {
                if (data.hasError) {
                  return Text("${data.error}");
                } else if (data.hasData) {
                  var items = data.data as List<ApprovedAppointment>;
                  return ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    itemCount: items == null ? 0 : items.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          Get.to(
                            MiddleZibajoPage(),
                            arguments: items[index],
                          );
                        },
                        child: Padding(
                          padding: EdgeInsets.only(
                            // right: screenwidth / width_figma * 16,
                            // left: screenwidth / width_figma * 16,
                            top: 4,
                            bottom: 4,
                          ),
                          child: Container(
                            width: screenwidth / width_figma * 396,
                            height: 156,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(16),
                                color: Colors.white),
                            child: Directionality(
                              textDirection: TextDirection.rtl,
                              child: Padding(
                                padding: EdgeInsets.only(
                                  right: screenwidth / width_figma * 16,
                                  left: screenwidth / width_figma * 16,
                                  top: 16,
                                  bottom: 16,
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Image.asset(
                                            "lib/features/technicians/ZibajoyanMan/Images/gol.png"),
                                        SizedBox(
                                          width: screenwidth / width_figma * 10,
                                        ),
                                        Container(
                                          width:
                                              screenwidth / width_figma * 110,
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                items[index].operation!,
                                                style: TextStyle(
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.w700,
                                                    color: fontcolor,
                                                    fontFeatures: [
                                                      FontFeature('ss01', 1),
                                                    ]),
                                              ),
                                              SizedBox(
                                                height: 8,
                                              ),
                                              Text(
                                                "زیباجو:",
                                                style: TextStyle(
                                                    fontWeight: FontWeight.w500,
                                                    fontSize: 14,
                                                    color: grayColorHome,
                                                    fontFeatures: [
                                                      FontFeature('ss01', 1),
                                                    ]),
                                              ),
                                              SizedBox(
                                                height: 4,
                                              ),
                                              Text(
                                                items[index].pationt_name!,
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
                                          width: screenwidth / width_figma * 95,
                                        ),
                                        Container(
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              SizedBox(
                                                height: 27,
                                              ),
                                              Text(
                                                "تعداد تار مو:",
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
                                                items[index].hair_count! +
                                                    " تارمو",
                                                style: TextStyle(
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.w500,
                                                    color: fontcolor),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 8,
                                    ),
                                    Container(
                                      width: screenwidth / width_figma * 364,
                                      height: 36,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(36),
                                        gradient: LinearGradient(
                                            begin: Alignment.topCenter,
                                            end: Alignment.bottomCenter,
                                            colors: [
                                              LightBlue.withOpacity(0.1),
                                              White.withOpacity(0.1)
                                            ]),
                                      ),
                                      child: Center(
                                        child: GradientText(
                                          items[index].visit_date!,
                                          style: TextStyle(
                                              fontWeight: FontWeight.w700,
                                              fontSize: 14),
                                          colors: [LightBlue, LightBlue],
                                        ),
                                      ),
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
          ],
        ),
      ),
    );
  }
}
