import 'package:clinic/features/client/NavigationBar/navigation_bar.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../../../../themes/colors.dart';
import '../../../../NavigationBar/Icons/navigation_bar_icons.dart';

class SelectTechPage1 extends StatefulWidget {
  const SelectTechPage1({Key? key}) : super(key: key);

  @override
  State<SelectTechPage1> createState() => _SelectTechPage1State();
}

class _SelectTechPage1State extends State<SelectTechPage1> {
  @override
  Widget build(BuildContext context) {
    final screenheight = MediaQuery.of(context).size.height;
    final height_figma = 926;
    final screenwidth = MediaQuery.of(context).size.width;
    final width_figma = 428;

    return Scaffold(
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: screenheight / height_figma * 159,
              width: screenwidth / width_figma * 428,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ),
                color: darkBlue,
              ),
              child: Directionality(
                textDirection: TextDirection.rtl,
                child: Stack(
                  alignment: Alignment.topRight,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                        top: screenheight / height_figma * 10,
                        right: screenwidth / width_figma * 25,
                      ),
                      child: GestureDetector(
                        onTap: () {
                          Get.to(ClientPage());
                        },
                        child: Image.asset(
                            "lib/features/client/Turn ratings/Images/zab_dar.png"),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        top: screenheight / height_figma * 25,
                        right: screenwidth / width_figma * 175,
                      ),
                      child: Text(
                        "ثبت نوبت",
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 18,
                            color: graycoloranjamnashode),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        top: screenheight / height_figma * 75,
                        right: screenwidth / width_figma * 80,
                      ),
                      child: Row(
                        children: [
                          Container(
                            width: 40,
                            height: 40,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(100),
                                color: LightBlue.withOpacity(0.31)),
                            child: Center(
                              child: Text(
                                "1",
                                style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 16,
                                  color: Colors.white.withOpacity(0.6),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: screenwidth / width_figma * 5,
                          ),
                          Expanded(
                            child: Container(
                              child: DottedLine(
                                lineThickness: 2,
                                dashGapLength: 9,
                                dashColor: dashlineColor.withOpacity(0.31),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                              left: screenwidth / width_figma * 85,
                              right: screenwidth / width_figma * 5,
                            ),
                            child: Container(
                              width: 40,
                              height: 40,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(100),
                                color: LightBlue,
                              ),
                              child: Center(
                                child: Text(
                                  "2",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 16,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        top: screenheight / height_figma * 120,
                        right: screenwidth / width_figma * 49,
                      ),
                      child: Text(
                        "انتخاب و ثبت مشتری",
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: Colors.white.withOpacity(0.6),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        top: screenheight / height_figma * 120,
                        right: screenwidth / width_figma * 290,
                      ),
                      child: Text(
                        "انتخاب تکنسین",
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: graycoloranjamnashode,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: screenheight / height_figma * 43,
            ),
            Directionality(
              textDirection: TextDirection.ltr,
              child: Container(
                width: screenwidth / width_figma * 396,
                height: screenheight / height_figma * 48,
                margin: EdgeInsets.only(
                  left: screenwidth / width_figma * 15,
                  right: screenwidth / width_figma * 15,
                ),
                child: TextField(
                  textAlign: TextAlign.right,
                  decoration: InputDecoration(
                    suffixIcon: Icon(
                      Search.search,
                      color: phonecolor,
                      size: 20,
                    ),
                    hintText: "جستجو در بین تکنسین ها",
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
            ),
            SizedBox(
              height: screenheight / height_figma * 600,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    Get.back();
                  },
                  child: Text(
                    "بازگشت",
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 14,
                        color: meshki),
                  ),
                ),
                SizedBox(
                  width: screenwidth / width_figma * 60,
                ),
                GestureDetector(
                  onTap: () {
                    Get.to(SelectTechPage1());
                  },
                  child: Container(
                    width: screenwidth / width_figma * 187,
                    height: screenheight / height_figma * 44,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4), color: LightBlue),
                    child: Center(
                      child: Text(
                        "ثبت نوبت",
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
          ],
        ),
      ),
    );
  }
}
