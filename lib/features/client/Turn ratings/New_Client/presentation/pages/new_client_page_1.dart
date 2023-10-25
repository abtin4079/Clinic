import 'package:clinic/features/client/NavigationBar/navigation_bar.dart';
import 'package:clinic/features/client/Turn%20ratings/Controllers/new_patient_controller.dart';
import 'package:clinic/features/client/Turn%20ratings/Select_Client/presentation/Pages/select_client_page_1.dart';
import 'package:clinic/features/client/Turn%20ratings/Select_Tech/presentation/pages/select_tech_page_1.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../../../../themes/colors.dart';

class NewClientPage1 extends StatefulWidget {
  const NewClientPage1({Key? key}) : super(key: key);

  @override
  State<NewClientPage1> createState() => _NewClientPage1State();
}

class _NewClientPage1State extends State<NewClientPage1> {

  final NewPatientController newPatientController = Get.put(NewPatientController());

  bool status = true;

  @override
  Widget build(BuildContext context) {
    final screenheight = MediaQuery.of(context).size.height;
    final height_figma = 926;
    final screenwidth = MediaQuery.of(context).size.width;
    final width_figma = 428;

    return Scaffold(
      body: SingleChildScrollView(
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
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
                          top: 10,
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
                          top: 25,
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
                          top: 75,
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
                        padding:  EdgeInsets.only(
                          top: 120,
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
                          top: 120,
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
                        Get.to(SelectClientPage1());
                      },
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 26,
              ),
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
                      borderSide: BorderSide(color: outlineborder, width: 2),
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
                      borderSide: BorderSide(color: outlineborder, width: 2),
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
                  controller: newPatientController.phoneNumberController,
                  textAlign: TextAlign.right,
                  decoration: InputDecoration(
                    hintText: "شماره تماس معتبر زیباجو را وارد کنید",
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
              Directionality(
                textDirection: TextDirection.rtl,
                child: Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                        right: screenwidth / width_figma * 23,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "عکس های زیبا جو",
                            style: TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: 15,
                                color: meshki),
                          ),
                          SizedBox(
                            height: 11,
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
                height: 26,
              ),
              Center(
                child: GestureDetector(
                  onTap: () {},
                  child: Container(
                    width: screenwidth / width_figma * 256,
                    height: 33,
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
              ),
              SizedBox(
                height: 11,
              ),
              Directionality(
                textDirection: TextDirection.rtl,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                        "lib/features/client/Turn ratings/Images/punk.png"),
                    SizedBox(
                      width: 6,
                    ),
                    Text(
                      "شما عکسی اضافه نکردید",
                      style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 10,
                          color: meshki.withOpacity(0.6)),
                    )
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  top: 155,
                  right: screenwidth / width_figma * 212,
                ),
                child: GestureDetector(
                  onTap: () {
                    newPatientController.registerNewPatient();
                  },
                  child: Container(
                    width: screenwidth / width_figma * 187,
                    height:  44,
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
        ),
      ),
    );
  }
}
