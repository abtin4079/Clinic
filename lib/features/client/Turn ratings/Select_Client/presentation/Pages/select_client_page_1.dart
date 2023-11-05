import 'package:clinic/features/client/NavigationBar/navigation_bar.dart';
import 'package:clinic/features/client/Turn%20ratings/Controllers/create_new_process_controller.dart';
import 'package:clinic/features/client/Turn%20ratings/New_Client/presentation/pages/new_client_page_1.dart';
import 'package:clinic/features/client/Turn%20ratings/Select_Client/presentation/Pages/select_client_page_2.dart';
import 'package:clinic/features/client/Turn%20ratings/Select_Tech/presentation/pages/select_tech_page_1.dart';
import 'package:clinic/themes/colors.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../../NavigationBar/Icons/search_icons.dart';
import '../../../Controllers/select_patient_controller.dart';

class SelectClientPage1 extends StatefulWidget {
  const SelectClientPage1({Key? key}) : super(key: key);

  @override
  State<SelectClientPage1> createState() => _SelectClientPage1State();
}

class _SelectClientPage1State extends State<SelectClientPage1> {

  final SelectPatientController selectPatientController = Get.put(SelectPatientController());
  final CreateNewProcessController createNewProcessController = Get.put(CreateNewProcessController());
  bool status_of_page = false;
  bool status = false;


  @override
  Widget build(BuildContext context) {
    final screenheight = MediaQuery.of(context).size.height;
    final height_figma = 926;
    final screenwidth = MediaQuery.of(context).size.width;
    final width_figma = 428;

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 159,
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
                        top:  10,
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
                        top:  25,
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
                        top:  75,
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
                        top:  120,
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
                        top:  120,
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
              height:  50,
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
              height:  26,
            ),
            Container(
              width: screenwidth / width_figma * 396,
              height: 48,
              margin: EdgeInsets.only(
                left: screenwidth / width_figma * 15,
                right: screenwidth / width_figma * 15,
              ),
              child: TypeAheadField(
                textFieldConfiguration: TextFieldConfiguration(
                  controller: selectPatientController.searchController,
                  onChanged: (value) {
                    if (selectPatientController.searchController.text != '') {
                      selectPatientController.fetchPatient();
                    }
                  },
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
                  ),
                ),
                suggestionsCallback: (pattern) async {
                  return selectPatientController.items;
                },
                itemBuilder: (context, data) {
                  return Directionality(
                    textDirection: TextDirection.rtl,
                    child: ListTile(
                      leading: Icon(
                        Search.search,
                        color: phonecolor,
                        size: 20,
                      ),
                      title: Text(data.fullName.toString()),
                    ),
                  );
                },
                onSuggestionSelected: (data) {
                  createNewProcessController.fetchPatiantIdAndName(data.fullName.toString(), data.id.toString());
                  setState(() {
                    status_of_page = true;
                  });
                },
              ),
            ),
            SizedBox(
              height:  550,
            ),
            Padding(
              padding:  EdgeInsets.only(
                right: screenwidth / width_figma * 212 ,
              ),
              child: GestureDetector(
                onTap: (){
                  setState(() {
                    if (status_of_page == true) {
                      Get.to(SelectClientPage2());
                      selectPatientController.searchController.clear();
                    }
                  });
                },
                child: Container(
                  width: screenwidth / width_figma * 187,
                  height:  44,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    color: LightBlue
                  ),
                  child: Center(
                    child: Text(
                      "مرحله بعدی", style: TextStyle(
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
      ),
    );
  }
}
