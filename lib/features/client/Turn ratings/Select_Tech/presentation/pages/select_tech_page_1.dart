import 'package:clinic/features/client/Home/presentation/pages/home.dart';
import 'package:clinic/features/client/NavigationBar/navigation_bar.dart';
import 'package:clinic/features/client/Technicians/Controller/search_tech_controller.dart';
import 'package:clinic/features/client/Turn%20ratings/Controllers/create_new_process_controller.dart';
import 'package:clinic/features/client/Turn%20ratings/Select_Tech/presentation/pages/select_tech_page_2.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:numberpicker/numberpicker.dart';

import '../../../../../../themes/colors.dart';
import '../../../../Home/presentation/pages/master_page.dart';
import '../../../../NavigationBar/Icons/navigation_bar_icons.dart';

class SelectTechPage1 extends StatefulWidget {
  const SelectTechPage1({Key? key}) : super(key: key);

  @override
  State<SelectTechPage1> createState() => _SelectTechPage1State();
}

class _SelectTechPage1State extends State<SelectTechPage1> {
  final SearchTechController searchTechController =
      Get.put(SearchTechController());
  final CreateNewProcessController createNewProcessController =
      Get.put(CreateNewProcessController());
  String? value;
  bool status_of_page = false;
  bool status_of_page_2 = false;
  final items = [
    'برداشت مو',
    'کاشت مو',
    'تیغ مو',
    'پانچ مو',
    'کاشت ابرو',
    'برداشت ابرو'
  ];
  String? value2;
  var hour2 = 0;
  var minute2 = 0;
  var hour = 0;
  var minute = 0;
  final visitDate = DateTime.now().toIso8601String();

  @override
  Widget build(BuildContext context) {
    final screenheight = MediaQuery.of(context).size.height;
    final height_figma = 926;
    final screenwidth = MediaQuery.of(context).size.width;
    final width_figma = 428;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: darkBlue,
        iconTheme: IconThemeData(color: phonecolor),
        automaticallyImplyLeading: true,
        elevation: 0,
        centerTitle: true,
        title: Text("ثبت نوبت"),

        // backgroundColor: backgroundHome,
      ),
      body: SingleChildScrollView(
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 100,
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
                          top: 10,
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
                                    color: Colors.white.withOpacity(0.51),
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
                                    color: LightBlue),
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
                          top: 55,
                          right: screenwidth / width_figma * 49,
                        ),
                        child: Text(
                          "انتخاب و ثبت مشتری",
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            color: graycoloranjamnashode.withOpacity(0.6),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          top: 55,
                          right: screenwidth / width_figma * 290,
                        ),
                        child: Text(
                          "انتخاب تکنسین",
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            color: Colors.white,
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
                  child: TypeAheadField(
                    textFieldConfiguration: TextFieldConfiguration(
                      controller: searchTechController.searchController,
                      onChanged: (value) {
                        if (searchTechController
                            .searchController.text.isNotEmpty) {
                          searchTechController.fetchPatient();
                        }
                      },
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
                      ),
                    ),
                    suggestionsCallback: (pattern) async {
                      try {
                        // Handle the case where an exception might occur during the fetching of suggestions
                        return searchTechController.tech_list;
                      } catch (e) {
                        print("Error fetching suggestions: $e");
                        return [];
                      }
                    },
                    itemBuilder: (context, data) {
                      print("//////");

                      print(searchTechController.tech_list);
                      print("//////");
                      if (searchTechController.tech_list.isNotEmpty)
                        return Directionality(
                          textDirection: TextDirection.rtl,
                          child: ListTile(
                              leading: Icon(
                                Search.search,
                                color: phonecolor,
                                size: 20,
                              ),
                              title: Text(data.fullName.toString())),
                        );
                      else
                        return Directionality(
                          textDirection: TextDirection.rtl,
                          child: ListTile(
                            leading: Icon(
                              Search.search,
                              color: phonecolor,
                              size: 20,
                            ),
                            title: Text("تکنسینی یافت نشد"),
                          ),
                        );
                    },
                    onSuggestionSelected: (data) {
                      if (status_of_page == false) {
                        try {
                          createNewProcessController.fetchTechIdAndName(
                              data.fullName, data.id, data.profileUrl);
                          setState(() {
                            status_of_page = true;
                          });
                          searchTechController.searchController.clear();
                        } catch (e) {
                          print("Error selecting suggestion: $e");
                          // Handle the error as needed, such as showing a user-friendly message
                        }
                      } else if (status_of_page_2 == false) {
                        try {
                          createNewProcessController.fetchTechIdAndName_tech2(
                              data.fullName, data.id, data.profileUrl);
                          setState(() {
                            status_of_page_2 = true;
                          });
                          searchTechController.searchController.clear();
                        } catch (e) {
                          print("Error selecting suggestion: $e");
                          // Handle the error as needed, such as showing a user-friendly message
                        }
                      } else {}
                    },
                  ),
                ),
              ),
              status_of_page
                  ? Center(
                      child: Container(
                        // height: 526,
                        // width: screenwidth / width_figma * 396,
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Directionality(
                                    textDirection: TextDirection.rtl,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          children: [
                                            Image.asset(
                                                "lib/features/client/Turn ratings/Images/punk.png"),
                                            SizedBox(
                                              width: screenwidth /
                                                  width_figma *
                                                  11,
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
                                              width: screenwidth /
                                                  width_figma *
                                                  11,
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
                                              width: screenwidth /
                                                  width_figma *
                                                  11,
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
                                              width: screenwidth /
                                                  width_figma *
                                                  11,
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
                                              width: screenwidth /
                                                  width_figma *
                                                  11,
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
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
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
                                            // width:
                                            //     screenwidth / width_figma * 190,
                                            // height: 49,
                                            decoration: BoxDecoration(
                                              border: Border.all(
                                                color: outlineborder,
                                                width: 2,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              color: backgroundHome,
                                            ),
                                            child: Center(
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  NumberPicker(
                                                      minValue: 0,
                                                      maxValue: 23,
                                                      value: hour,
                                                      zeroPad: true,
                                                      infiniteLoop: true,
                                                      itemWidth: 80,
                                                      itemHeight: 15,
                                                      selectedTextStyle:
                                                          TextStyle(
                                                              fontSize: 16,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w700,
                                                              color: fontcolor),
                                                      textStyle: TextStyle(
                                                          fontSize: 16,
                                                          fontWeight:
                                                              FontWeight.w100,
                                                          color: Colors.black),
                                                      onChanged: (value) {
                                                        setState(() {
                                                          hour = value;
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
                                                      value: minute,
                                                      zeroPad: true,
                                                      infiniteLoop: true,
                                                      itemWidth: 80,
                                                      itemHeight: 15,
                                                      selectedTextStyle:
                                                          TextStyle(
                                                              fontSize: 16,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w700,
                                                              color: fontcolor),
                                                      textStyle: TextStyle(
                                                          fontSize: 16,
                                                          fontWeight:
                                                              FontWeight.w100,
                                                          color: Colors.black),
                                                      onChanged: (value) {
                                                        setState(() {
                                                          minute = value;
                                                        });
                                                      }),
                                                ],
                                              ),
                                            )),
                                        SizedBox(
                                          height: 26,
                                        ),
                                        Container(
                                          // padding: EdgeInsets.only(
                                          //     left: screenwidth /
                                          //         width_figma *
                                          //         15,
                                          //     right: screenwidth /
                                          //         width_figma *
                                          //         50),
                                          width:
                                              screenwidth / width_figma * 178,
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
                                                value: value,
                                                onChanged: (value) =>
                                                    setState(() {
                                                  this.value = value;
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
                                            height: screenheight /
                                                height_figma *
                                                38,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              color: backgroundHome,
                                            ),
                                            child: TextField(
                                              textAlign: TextAlign.center,
                                              textAlignVertical:
                                                  TextAlignVertical(y: 0.5),
                                              decoration: InputDecoration(
                                                hintText: 'نام کلینیک',
                                                hintStyle: TextStyle(
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 14,
                                                  color: phonecolor,
                                                ),
                                                focusedBorder:
                                                    OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                      color: Colors.black),
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                ),
                                                enabledBorder:
                                                    OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                      color: outlineborder,
                                                      width: 2),
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                ),
                                                border: OutlineInputBorder(),
                                              ),
                                              keyboardType: TextInputType.text,
                                            )),
                                        SizedBox(
                                          height: 33,
                                        ),
                                        Container(
                                            width:
                                                screenwidth / width_figma * 170,
                                            height: screenheight /
                                                height_figma *
                                                38,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              color: backgroundHome,
                                            ),
                                            child: Center(
                                              child: TextField(
                                                controller:
                                                    createNewProcessController
                                                        .tarmo1Controller,
                                                textAlign: TextAlign.center,
                                                textAlignVertical:
                                                    TextAlignVertical(y: 0.5),
                                                decoration: InputDecoration(
                                                  hintText: 'تعداد تار مو',
                                                  hintStyle: TextStyle(
                                                    fontWeight: FontWeight.w500,
                                                    fontSize: 14,
                                                    color: phonecolor,
                                                  ),
                                                  focusedBorder:
                                                      OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                        color: Colors.black),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                  ),
                                                  enabledBorder:
                                                      OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                        color: outlineborder,
                                                        width: 2),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                  ),
                                                  border: OutlineInputBorder(),
                                                ),
                                                keyboardType:
                                                    TextInputType.number,
                                              ),
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
                    )
                  : Container(),
              SizedBox(
                height: screenheight / height_figma * 100,
              ),
              status_of_page_2
                  ? Center(
                      child: Container(
                        // height: 526,
                        // width: screenwidth / width_figma * 396,
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Directionality(
                                    textDirection: TextDirection.rtl,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          children: [
                                            Image.asset(
                                                "lib/features/client/Turn ratings/Images/punk.png"),
                                            SizedBox(
                                              width: screenwidth /
                                                  width_figma *
                                                  11,
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
                                              width: screenwidth /
                                                  width_figma *
                                                  11,
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
                                              width: screenwidth /
                                                  width_figma *
                                                  11,
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
                                              width: screenwidth /
                                                  width_figma *
                                                  11,
                                            ),
                                            Text(
                                              "کلینیک",
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
                                              width: screenwidth /
                                                  width_figma *
                                                  11,
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
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
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
                                            // width:
                                            //     screenwidth / width_figma * 190,
                                            // height: 49,
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
                                          // padding: EdgeInsets.only(
                                          //     left: screenwidth /
                                          //         width_figma *
                                          //         15,
                                          //     right: screenwidth /
                                          //         width_figma *
                                          //         50),
                                          width:
                                              screenwidth / width_figma * 178,
                                          height:
                                              screenheight / height_figma * 38,
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
                                            height: screenheight /
                                                height_figma *
                                                38,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              color: backgroundHome,
                                            ),
                                            child: TextField(
                                              textAlign: TextAlign.center,
                                              textAlignVertical:
                                                  TextAlignVertical(y: 0.5),
                                              decoration: InputDecoration(
                                                hintText: 'نام کلینیک',
                                                hintStyle: TextStyle(
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 14,
                                                  color: phonecolor,
                                                ),
                                                focusedBorder:
                                                    OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                      color: Colors.black),
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                ),
                                                enabledBorder:
                                                    OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                      color: outlineborder,
                                                      width: 2),
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                ),
                                                border: OutlineInputBorder(),
                                              ),
                                              keyboardType: TextInputType.text,
                                            )),
                                        SizedBox(
                                          height: 33,
                                        ),
                                        Container(
                                            width:
                                                screenwidth / width_figma * 170,
                                            height: screenheight /
                                                height_figma *
                                                38,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              color: backgroundHome,
                                            ),
                                            child: TextField(
                                              controller:
                                                  createNewProcessController
                                                      .tarmo2Controller,
                                              textAlign: TextAlign.center,
                                              textAlignVertical:
                                                  TextAlignVertical(y: 0.5),
                                              decoration: InputDecoration(
                                                hintText: 'تعداد تار مو',
                                                hintStyle: TextStyle(
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 14,
                                                  color: phonecolor,
                                                ),
                                                focusedBorder:
                                                    OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                      color: Colors.black),
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                ),
                                                enabledBorder:
                                                    OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                      color: outlineborder,
                                                      width: 2),
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                ),
                                                border: OutlineInputBorder(),
                                              ),
                                              keyboardType:
                                                  TextInputType.number,
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
                    )
                  : Container(),
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
                      setState(() {
                        if (status_of_page && status_of_page_2) {
                          createNewProcessController.registerNewProcess2(
                              value, value2);
                        } else if (status_of_page && !status_of_page_2) {
                          createNewProcessController.registerNewProcess1(value);
                        } else if (!status_of_page && status_of_page_2) {
                          createNewProcessController
                              .registerNewProcess1(value2);
                        } else {}
                      });
                    },
                    child: Container(
                      width: screenwidth / width_figma * 187,
                      height: 44,
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
                height: screenheight / height_figma * 43,
              ),
            ],
          ),
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
