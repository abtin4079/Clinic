import 'package:clinic/features/client/NavigationBar/navigation_bar.dart';
import 'package:clinic/features/client/Turn%20ratings/New_Client/presentation/pages/new_client_page_1.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../../../../themes/colors.dart';
import '../../../../NavigationBar/Icons/navigation_bar_icons.dart';

class SelectClientPage2 extends StatefulWidget {
  const SelectClientPage2({Key? key}) : super(key: key);

  @override
  State<SelectClientPage2> createState() => _SelectClientPage2State();
}

class _SelectClientPage2State extends State<SelectClientPage2> {
  bool status = false;

  @override
  Widget build(BuildContext context) {
    final screenheight = MediaQuery.of(context).size.height;
    final height_figma = 926;
    final screenwidth = MediaQuery.of(context).size.width;
    final width_figma = 428;

    return Scaffold(
      body: Column(
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
                              color: LightBlue),
                          child: Center(
                            child: Text(
                              "1",
                              style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 16,
                                color: Colors.white,
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
                          padding:  EdgeInsets.only(
                            left: screenwidth / width_figma * 85,
                            right: screenwidth / width_figma * 5,
                          ),
                          child: Container(
                            width: 40,
                            height: 40,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(100),
                                color: LightBlue.withOpacity(0.31)),
                            child: Center(
                              child: Text(
                                "2",
                                style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 16,
                                  color: Colors.white.withOpacity(0.51),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding:  EdgeInsets.only(
                      top: screenheight / height_figma * 120,
                      right: screenwidth / width_figma * 49,
                    ),
                    child: Text(
                      "انتخاب و ثبت مشتری",
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Padding(
                    padding:  EdgeInsets.only(
                      top: screenheight / height_figma * 120,
                      right: screenwidth / width_figma * 290,
                    ),
                    child: Text(
                      "انتخاب تکنسین",
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: graycoloranjamnashode.withOpacity(0.6),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: screenheight / height_figma * 50,
          ),
          Directionality(
            textDirection: TextDirection.rtl,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: screenwidth / width_figma * 31,
                ),
                Text(
                  "زیبا جو",
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                    color: meshki,
                  ),
                ),
                SizedBox(
                  width: screenwidth / width_figma * 186,
                ),
                Text(
                  "ثبت زیبا جوی جدید ",
                  style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 12,
                      color: meshki.withOpacity(0.9)),
                ),
                SizedBox(
                  width: screenwidth / width_figma * 5,
                ),
                FlutterSwitch(
                  width: 32,
                  height: 15,
                  toggleSize: 10,
                  showOnOff: false,
                  inactiveColor: toggleColor,
                  activeColor: LightBlue,
                  value: status,
                  onToggle: (value) {
                    setState(() {
                      status = value;
                    });
                    Get.to(NewClientPage1());
                  },
                ),
              ],
            ),
          ),
          SizedBox(
            height: screenheight / height_figma * 26,
          ),
          Container(
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
                hintText: "جستجو در بین زیباجویان",
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
            height: screenheight / height_figma * 37,
          ),
          Directionality(
            textDirection: TextDirection.rtl,
            child: Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(
                    top: screenheight / height_figma * 37,
                    right: screenwidth / width_figma * 31,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: screenwidth / width_figma * 116,
                        height: screenheight / height_figma * 32,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: LightBlue),
                        child: Center(
                          child: Text(
                            "پوریا تیموری",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: screenheight / height_figma * 53,
                      ),
                      Text(
                        "عکس های زیبا جو",
                        style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 15,
                            color: meshki),
                      ),
                      SizedBox(
                        height: screenheight / height_figma * 11,
                      ),
                      Text(
                        "اضافه کردن عکس در این قسمت اختیاری میباشد",
                        style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 12,
                            color: meshki.withOpacity(0.9)),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: screenheight / height_figma * 26,
          ),
          GestureDetector(
            onTap: (){},
            child: Container(
              width: screenwidth / width_figma * 256,
              height: screenheight / height_figma * 33,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4), color: LightBlue),
              child: Directionality(
                textDirection: TextDirection.rtl,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "اضافه کردن عکس",
                      style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: Colors.white),
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    Icon(
                      Icons.add,
                      size: 18,
                      color: Colors.white,
                    )
                  ],
                ),
              ),
            ),
          ),
          SizedBox(
            height: screenheight / height_figma * 11,
          ),
          Directionality(
            textDirection: TextDirection.rtl,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset("lib/features/client/Turn ratings/Images/punk.png"),
                SizedBox(
                  width: 6,
                ),
                Text("شما عکسی اضافه نکردید" , style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 10,
                  color: meshki.withOpacity(0.6)
                ),)
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              top: screenheight / height_figma * 250,
              right: screenwidth / width_figma * 212,
            ),
            child: GestureDetector(
              onTap: () {},
              child: Container(
                width: screenwidth / width_figma * 187,
                height: screenheight / height_figma * 44,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4), color: LightBlue),
                child: Center(
                  child: Text(
                    "مرحله بعدی",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: lightwhite,
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
