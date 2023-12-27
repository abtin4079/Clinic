import 'package:clinic/features/client/Home/presentation/pages/home.dart';
import 'package:clinic/features/client/NavigationBar/navigation_bar.dart';
import 'package:clinic/features/client/Turn%20ratings/Controllers/new_patient_controller.dart';
import 'package:clinic/features/client/Turn%20ratings/Select_Client/presentation/Pages/select_client_page_1.dart';
import 'package:clinic/features/client/Turn%20ratings/Select_Tech/presentation/pages/select_tech_page_1.dart';
import 'package:clinic/features/client/Turn%20ratings/Controllers/create_new_process_controller.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';

import '../../../../../../themes/colors.dart';
import '../../../../Home/presentation/pages/master_page.dart';
import '../../../Controllers/select_patient_controller.dart';
import '../../../../NavigationBar/Icons/search_icons.dart';

class NewClientPage1 extends StatefulWidget {
  const NewClientPage1({Key? key}) : super(key: key);

  @override
  State<NewClientPage1> createState() => _NewClientPage1State();
}

class _NewClientPage1State extends State<NewClientPage1> {
  final CreateNewProcessController createNewProcessController =
      Get.put(CreateNewProcessController());
  final SelectPatientController selectPatientController =
      Get.put(SelectPatientController());
  final NewPatientController newPatientController =
      Get.put(NewPatientController());

  bool status = true;
  bool status_of_page = false;

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
                              padding: EdgeInsets.only(
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
                        padding: EdgeInsets.only(
                          top: 55,
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
                        padding: EdgeInsets.only(
                          top: 55,
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
                height: 50,
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
                      width: screenwidth / width_figma * 100,
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
                      width: 60,
                      height: 28,
                      toggleSize: 18,
                      showOnOff: false,
                      inactiveColor: toggleColor,
                      activeColor: LightBlue,
                      value: status,
                      onToggle: (value) {
                        setState(() {
                          status = value;
                        });
                        // Get.to(SelectClientPage1());
                      },
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 26,
              ),
              status
                  ? Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            margin: EdgeInsets.only(
                              left: screenwidth / width_figma * 15,
                              right: screenwidth / width_figma * 15,
                            ),
                            child: Text(
                              "نام کامل",
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w700,
                                  color: fontcolor),
                            ),
                          ),
                          SizedBox(
                            height: 9,
                          ),
                          Container(
                            width: screenwidth / width_figma * 396,
                            height: 48,
                            margin: EdgeInsets.only(
                              left: screenwidth / width_figma * 15,
                              right: screenwidth / width_figma * 15,
                            ),
                            child: TextField(
                              controller: newPatientController.nameController,
                              textAlign: TextAlign.right,
                              decoration: InputDecoration(
                                hintText: "نام کامل زیباجو را وارد کنید",
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
                                  borderSide: BorderSide(
                                      color: outlineborder, width: 2),
                                  borderRadius: BorderRadius.circular(48),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Container(
                            margin: EdgeInsets.only(
                              left: screenwidth / width_figma * 15,
                              right: screenwidth / width_figma * 15,
                            ),
                            child: Text(
                              "کد ملی",
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w700,
                                  color: fontcolor),
                            ),
                          ),
                          SizedBox(
                            height: 9,
                          ),
                          Container(
                            width: screenwidth / width_figma * 396,
                            height: 48,
                            margin: EdgeInsets.only(
                              left: screenwidth / width_figma * 15,
                              right: screenwidth / width_figma * 15,
                            ),
                            child: TextField(
                              controller: newPatientController.idController,
                              textAlign: TextAlign.right,
                              decoration: InputDecoration(
                                hintText: "کد ملی زیباجو را وارد کنید",
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
                                  borderSide: BorderSide(
                                      color: outlineborder, width: 2),
                                  borderRadius: BorderRadius.circular(48),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Container(
                            margin: EdgeInsets.only(
                              left: screenwidth / width_figma * 15,
                              right: screenwidth / width_figma * 15,
                            ),
                            child: Text(
                              "شماه تماس",
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w700,
                                  color: fontcolor),
                            ),
                          ),
                          SizedBox(
                            height: 9,
                          ),
                          Container(
                            width: screenwidth / width_figma * 396,
                            height: 48,
                            margin: EdgeInsets.only(
                              left: screenwidth / width_figma * 15,
                              right: screenwidth / width_figma * 15,
                            ),
                            child: TextField(
                              controller:
                                  newPatientController.phoneNumberController,
                              textAlign: TextAlign.right,
                              decoration: InputDecoration(
                                hintText:
                                    "شماره تماس معتبر زیباجو را وارد کنید",
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
                                  borderSide: BorderSide(
                                      color: outlineborder, width: 2),
                                  borderRadius: BorderRadius.circular(48),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  : Container(
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
                            if (selectPatientController.searchController.text !=
                                '') {
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
                              title: selectPatientController.items != []
                                  ? Text(data.fullName.toString())
                                  : Text("زیباوجویی یافت نشد!"),
                            ),
                          );
                        },
                        onSuggestionSelected: (data) async {
                          createNewProcessController.fetchPatiantIdAndName(
                              data.fullName.toString(), data.id.toString());
                          setState(() {
                            status_of_page = true;
                            print(status_of_page);
                          });
                        },
                        errorBuilder: (context, error) {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              'Error fetching suggestions: $error',
                              style: TextStyle(color: Colors.red),
                            ),
                          );
                        },
                      ),
                    ),
              SizedBox(
                height: 30,
              ),
              !status
                  ? status_of_page
                      ? Padding(
                          padding: EdgeInsets.only(
                            top: 37,
                            right: screenwidth / width_figma * 31,
                          ),
                          child: Container(
                            width: screenwidth / width_figma * 116,
                            height: 32,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: LightBlue),
                            child: Center(
                              child: Text(
                                createNewProcessController.full_name_pat
                                    .toString(),
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        )
                      : Container()
                  : Container(),
              Padding(
                padding: EdgeInsets.only(
                  top: screenheight / height_figma * 90,
                  right: screenwidth / width_figma * 212,
                ),
                child: GestureDetector(
                  onTap: () {
                    status
                        ? newPatientController.registerNewPatient()
                        : status_of_page
                            ? Get.to(SelectTechPage1())
                            : showDialog(
                                context: Get.context!,
                                builder: (context) {
                                  return SimpleDialog(
                                    title: Center(
                                        child: Text(
                                            'زیبا جو را ابتدا انتخاب کنید')),
                                    contentPadding: EdgeInsets.all(20),
                                  );
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
              ),
              SizedBox(
                height: 30,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
