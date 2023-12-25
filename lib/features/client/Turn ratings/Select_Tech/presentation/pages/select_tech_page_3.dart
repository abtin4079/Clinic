import 'package:clinic/features/client/Home/presentation/pages/home.dart';
import 'package:clinic/features/client/NavigationBar/navigation_bar.dart';
import 'package:clinic/features/client/Technicians/Controller/search_tech_controller.dart';
import 'package:clinic/features/client/Turn%20ratings/Controllers/create_new_process_controller.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:numberpicker/numberpicker.dart';

import '../../../../../../themes/colors.dart';
import '../../../../Home/presentation/pages/master_page.dart';
import '../../../../NavigationBar/Icons/navigation_bar_icons.dart';

class SelectTechPage3 extends StatefulWidget {
  const SelectTechPage3({Key? key}) : super(key: key);

  @override
  State<SelectTechPage3> createState() => _SelectTechPage3State();
}

class _SelectTechPage3State extends State<SelectTechPage3> {
  final SearchTechController searchTechController =
  Get.put(SearchTechController());
  final CreateNewProcessController createNewProcessController =
  Get.put(CreateNewProcessController());

  String? value1;
  String? value2;

  final items = ['برداشت مو', 'کاشت مو', 'تیغ مو', 'پانچ مو', 'کاشت ابرو', 'برداشت ابرو'];
  var hour1 = 0;
  var minute1 = 0;

  var hour2 = 0;
  var minute2 = 0;


  @override
  Widget build(BuildContext context) {
    final screenheight = MediaQuery.of(context).size.height;
    final height_figma = 926;
    final screenwidth = MediaQuery.of(context).size.width;
    final width_figma = 428;

    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Directionality(
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
                                Get.to(MasterPage());
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
                                      dashColor:
                                      dashlineColor.withOpacity(0.31),
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
                    height: 35,
                  ),
                  Center(
                    child: Container(
                      height: 526,
                      width: screenwidth / width_figma * 396,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(32),
                        color: Colors.white,
                      ),
                      child: Directionality(
                        textDirection: TextDirection.rtl,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: 40,
                            ),
                            Container(
                              width: 100,
                              height: 100,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(100),
                                  color: Colors.blue),
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            Text(
                              createNewProcessController.full_name_tech
                                  .toString(),
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w700,
                                color: fontcolor,
                              ),
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            Text(
                              "تکنسین کاشت مو و ابرو",
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                color: fontcolor,
                              ),
                            ),
                            SizedBox(
                              height: 30,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Directionality(
                                  textDirection: TextDirection.rtl,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          Image.asset(
                                              "lib/features/client/Turn ratings/Images/punk.png"),
                                          SizedBox(
                                            width:
                                            screenwidth / width_figma * 11,
                                          ),
                                          Text(
                                            "روز نوبت",
                                            style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w700,
                                                color: fontcolor),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 48,
                                      ),
                                      Row(
                                        children: [
                                          Image.asset(
                                              "lib/features/client/Turn ratings/Images/punk.png"),
                                          SizedBox(
                                            width:
                                            screenwidth / width_figma * 11,
                                          ),
                                          Text(
                                            "ساعت نوبت",
                                            style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w700,
                                                color: fontcolor),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 48,
                                      ),
                                      Row(
                                        children: [
                                          Image.asset(
                                              "lib/features/client/Turn ratings/Images/punk.png"),
                                          SizedBox(
                                            width:
                                            screenwidth / width_figma * 11,
                                          ),
                                          Text(
                                            "عملیات مورد نیاز",
                                            style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w700,
                                                color: fontcolor),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 48,
                                      ),
                                      Row(
                                        children: [
                                          Image.asset(
                                              "lib/features/client/Turn ratings/Images/punk.png"),
                                          SizedBox(
                                            width:
                                            screenwidth / width_figma * 11,
                                          ),
                                          Text(
                                            "تعداد تار مو",
                                            style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w700,
                                                color: fontcolor),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                Directionality(
                                  textDirection: TextDirection.ltr,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    children: [
                                      GestureDetector(
                                        onTap: () {},
                                        child: Container(
                                          height: 36,
                                          width:
                                          screenwidth / width_figma * 161,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                            BorderRadius.circular(48),
                                            gradient: LinearGradient(
                                                begin: Alignment.topRight,
                                                end: Alignment.bottomLeft,
                                                colors: [
                                                  rediligal,
                                                  whiteiligal
                                                ]),
                                          ),
                                          child: Center(
                                            child: Text(
                                              "انتخاب تاریخ",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w700,
                                                  fontSize: 14,
                                                  color: Colors.white),
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 33,
                                      ),
                                      Container(
                                          width:
                                          screenwidth / width_figma * 190,
                                          height: 49,
                                          decoration: BoxDecoration(
                                            border: Border.all(
                                              color: outlineborder,
                                              width: 2,
                                            ),
                                            borderRadius:
                                            BorderRadius.circular(10),
                                            color: backgroundHome,
                                          ),
                                          child: Row(
                                            mainAxisAlignment:
                                            MainAxisAlignment.start,
                                            crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                            children: [
                                              NumberPicker(
                                                  minValue: 0,
                                                  maxValue: 23,
                                                  value: hour1,
                                                  zeroPad: true,
                                                  infiniteLoop: true,
                                                  itemWidth: 80,
                                                  itemHeight: 15,
                                                  selectedTextStyle:
                                                  TextStyle(
                                                      fontSize: 16,
                                                      fontWeight:
                                                      FontWeight.w700,
                                                      color: fontcolor),
                                                  textStyle: TextStyle(
                                                      fontSize: 16,
                                                      fontWeight:
                                                      FontWeight.w100,
                                                      color: Colors.black),
                                                  onChanged: (value) {
                                                    setState(() {
                                                      hour1 = value;
                                                    });
                                                  }),
                                              Text(
                                                ":",
                                                style: TextStyle(
                                                    fontWeight:
                                                    FontWeight.w700,
                                                    fontSize: 16,
                                                    color: Colors.black),
                                              ),
                                              NumberPicker(
                                                  minValue: 0,
                                                  maxValue: 59,
                                                  value: minute1,
                                                  zeroPad: true,
                                                  infiniteLoop: true,
                                                  itemWidth: 80,
                                                  itemHeight: 15,
                                                  selectedTextStyle:
                                                  TextStyle(
                                                      fontSize: 16,
                                                      fontWeight:
                                                      FontWeight.w700,
                                                      color: fontcolor),
                                                  textStyle: TextStyle(
                                                      fontSize: 16,
                                                      fontWeight:
                                                      FontWeight.w100,
                                                      color: Colors.black),
                                                  onChanged: (value) {
                                                    setState(() {
                                                      minute1 = value;
                                                    });
                                                  }),
                                            ],
                                          )),
                                      SizedBox(
                                        height: 26,
                                      ),
                                      Container(
                                        padding: EdgeInsets.only(
                                            left: screenwidth / width_figma * 15,
                                            right:
                                            screenwidth / width_figma * 50),
                                        width: screenwidth / width_figma * 178,
                                        height: 38,
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                              color: PinputColor, width: 1),
                                          borderRadius:
                                          BorderRadius.circular(10),
                                          color: backgroundHome,
                                        ),
                                        child: Directionality(
                                          textDirection: TextDirection.rtl,
                                          child: DropdownButtonHideUnderline(
                                            child: DropdownButton<String>(
                                              value: value1,
                                              onChanged: (value) =>
                                                  setState(() {
                                                    this.value1 = value;
                                                  }),
                                              items: items
                                                  .map(buildMenuItem)
                                                  .toList(),
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 33,
                                      ),
                                      Container(
                                          width:
                                          screenwidth / width_figma * 170,
                                          height: 38,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                            BorderRadius.circular(10),
                                            color: backgroundHome,
                                          ),
                                          child: TextField(
                                            controller: createNewProcessController.tarmo1Controller,
                                            textAlign: TextAlign.center,
                                            textAlignVertical: TextAlignVertical(y: 0.5),
                                            decoration: InputDecoration(
                                              hintText: 'تعداد تار مو',
                                              hintStyle: TextStyle(
                                                fontWeight: FontWeight.w500,
                                                fontSize: 14,
                                                color: phonecolor,
                                              ),
                                              focusedBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: Colors.black),
                                                borderRadius:
                                                BorderRadius.circular(10),
                                              ),
                                              enabledBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: outlineborder,
                                                    width: 2),
                                                borderRadius:
                                                BorderRadius.circular(10),
                                              ),
                                              border: OutlineInputBorder(),
                                            ),
                                            keyboardType: TextInputType.number,
                                          )),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 24,
                  ),
                  Center(
                    child: Container(
                      height: 526,
                      width: screenwidth / width_figma * 396,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(32),
                        color: Colors.white,
                      ),
                      child: Directionality(
                        textDirection: TextDirection.rtl,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: 40,
                            ),
                            Container(
                              width: 100,
                              height: 100,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(100),
                                  color: Colors.blue),
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            Text(
                              createNewProcessController.full_name_tech_2
                                  .toString(),
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w700,
                                color: fontcolor,
                              ),
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            Text(
                              "تکنسین کاشت مو و ابرو",
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                color: fontcolor,
                              ),
                            ),
                            SizedBox(
                              height: 30,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Directionality(
                                  textDirection: TextDirection.rtl,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          Image.asset(
                                              "lib/features/client/Turn ratings/Images/punk.png"),
                                          SizedBox(
                                            width:
                                            screenwidth / width_figma * 11,
                                          ),
                                          Text(
                                            "روز نوبت",
                                            style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w700,
                                                color: fontcolor),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 48,
                                      ),
                                      Row(
                                        children: [
                                          Image.asset(
                                              "lib/features/client/Turn ratings/Images/punk.png"),
                                          SizedBox(
                                            width:
                                            screenwidth / width_figma * 11,
                                          ),
                                          Text(
                                            "ساعت نوبت",
                                            style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w700,
                                                color: fontcolor),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 48,
                                      ),
                                      Row(
                                        children: [
                                          Image.asset(
                                              "lib/features/client/Turn ratings/Images/punk.png"),
                                          SizedBox(
                                            width:
                                            screenwidth / width_figma * 11,
                                          ),
                                          Text(
                                            "عملیات مورد نیاز",
                                            style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w700,
                                                color: fontcolor),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 48,
                                      ),
                                      Row(
                                        children: [
                                          Image.asset(
                                              "lib/features/client/Turn ratings/Images/punk.png"),
                                          SizedBox(
                                            width:
                                            screenwidth / width_figma * 11,
                                          ),
                                          Text(
                                            "تعداد تار مو",
                                            style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w700,
                                                color: fontcolor),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                Directionality(
                                  textDirection: TextDirection.ltr,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    children: [
                                      GestureDetector(
                                        onTap: () {},
                                        child: Container(
                                          height: 36,
                                          width:
                                          screenwidth / width_figma * 161,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                            BorderRadius.circular(48),
                                            gradient: LinearGradient(
                                                begin: Alignment.topRight,
                                                end: Alignment.bottomLeft,
                                                colors: [
                                                  rediligal,
                                                  whiteiligal
                                                ]),
                                          ),
                                          child: Center(
                                            child: Text(
                                              "انتخاب تاریخ",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w700,
                                                  fontSize: 14,
                                                  color: Colors.white),
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 33,
                                      ),
                                      Container(
                                          width:
                                          screenwidth / width_figma * 190,
                                          height: 49,
                                          decoration: BoxDecoration(
                                            border: Border.all(
                                              color: outlineborder,
                                              width: 2,
                                            ),
                                            borderRadius:
                                            BorderRadius.circular(10),
                                            color: backgroundHome,
                                          ),
                                          child: Row(
                                            mainAxisAlignment:
                                            MainAxisAlignment.center,
                                            crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                            children: [
                                              NumberPicker(
                                                  minValue: 0,
                                                  maxValue: 23,
                                                  value: hour2,
                                                  zeroPad: true,
                                                  infiniteLoop: true,
                                                  itemWidth: 80,
                                                  itemHeight: 15,
                                                  selectedTextStyle:
                                                  TextStyle(
                                                      fontSize: 16,
                                                      fontWeight:
                                                      FontWeight.w700,
                                                      color: fontcolor),
                                                  textStyle: TextStyle(
                                                      fontSize: 16,
                                                      fontWeight:
                                                      FontWeight.w100,
                                                      color: Colors.black),
                                                  onChanged: (value) {
                                                    setState(() {
                                                      hour2 = value;
                                                    });
                                                  }),
                                              Text(
                                                ":",
                                                style: TextStyle(
                                                    fontWeight:
                                                    FontWeight.w700,
                                                    fontSize: 16,
                                                    color: Colors.black),
                                              ),
                                              NumberPicker(
                                                  minValue: 0,
                                                  maxValue: 59,
                                                  value: minute2,
                                                  zeroPad: true,
                                                  infiniteLoop: true,
                                                  itemWidth: 80,
                                                  itemHeight: 15,
                                                  selectedTextStyle:
                                                  TextStyle(
                                                      fontSize: 16,
                                                      fontWeight:
                                                      FontWeight.w700,
                                                      color: fontcolor),
                                                  textStyle: TextStyle(
                                                      fontSize: 16,
                                                      fontWeight:
                                                      FontWeight.w100,
                                                      color: Colors.black),
                                                  onChanged: (value) {
                                                    setState(() {
                                                      minute2 = value;
                                                    });
                                                  }),
                                            ],
                                          )),
                                      SizedBox(
                                        height: 26,
                                      ),
                                      Container(
                                        padding: EdgeInsets.only(
                                            left: screenwidth / width_figma * 15,
                                            right:
                                            screenwidth / width_figma * 50),
                                        width: screenwidth / width_figma * 178,
                                        height: screenheight / height_figma * 38,
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                              color: PinputColor, width: 1),
                                          borderRadius:
                                          BorderRadius.circular(10),
                                          color: backgroundHome,
                                        ),
                                        child: Directionality(
                                          textDirection: TextDirection.rtl,
                                          child: DropdownButtonHideUnderline(
                                            child: DropdownButton<String>(
                                              value: value2,
                                              onChanged: (value) =>
                                                  setState(() {
                                                    this.value2 = value;
                                                  }),
                                              items: items
                                                  .map(buildMenuItem)
                                                  .toList(),
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 33,
                                      ),
                                      Container(
                                          width:
                                          screenwidth / width_figma * 170,
                                          height: screenheight / height_figma * 38,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                            BorderRadius.circular(10),
                                            color: backgroundHome,
                                          ),
                                          child: TextField(
                                            controller: createNewProcessController.tarmo2Controller,
                                            textAlign: TextAlign.center,
                                            textAlignVertical: TextAlignVertical(y: 0.5),
                                            decoration: InputDecoration(
                                              hintText: 'تعداد تار مو',
                                              hintStyle: TextStyle(
                                                fontWeight: FontWeight.w500,
                                                fontSize: 14,
                                                color: phonecolor,
                                              ),
                                              focusedBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: Colors.black),
                                                borderRadius:
                                                BorderRadius.circular(10),
                                              ),
                                              enabledBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: outlineborder,
                                                    width: 2),
                                                borderRadius:
                                                BorderRadius.circular(10),
                                              ),
                                              border: OutlineInputBorder(),
                                            ),
                                            keyboardType: TextInputType.number,
                                          )),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 120,
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
                          createNewProcessController.registerNewProcess2(value1, value2);
                        },
                        child: Container(
                          width: screenwidth / width_figma * 187,
                          height: screenheight / height_figma * 44,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4),
                              color: LightBlue),
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
                  SizedBox(
                    height: 30,
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                left: screenwidth / width_figma * 380,
                top: 195,
              ),
              child: GestureDetector(
                onTap: () {
                  Get.back();
                },
                child: Image.asset(
                    "lib/features/client/Turn ratings/Images/zabdar_red.png"),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                left: screenwidth / width_figma * 380,
                top: 745,
              ),
              child: GestureDetector(
                onTap: () {
                  Get.back();
                },
                child: Image.asset(
                    "lib/features/client/Turn ratings/Images/zabdar_red.png"),
              ),
            ),
          ],
        ),
      ),
    );
  }

  DropdownMenuItem<String> buildMenuItem(String item) => DropdownMenuItem(
    value: item,
    child: Text(
      item,
      style: TextStyle(
          color: Colors.black, fontWeight: FontWeight.w500, fontSize: 16),
    ),
  );
}
