import 'dart:ui';

import 'package:clinic/features/technicians/NobatDehyJadid/controller/first_page_tech_processes_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../../../themes/colors.dart';
import '../../../../auth/controller/shared_preference.dart';
import '../../../../auth/presentation/pages/login_first_page.dart';
import 'package:clinic/features/technicians/Profile/controller/profile_controller.dart';
import 'package:clinic/features/technicians/Profile/models/profile.dart';

import '../../../NobatDehyJadid/presentation/pages/tech_main_page.dart';

class ProfileForTech extends StatefulWidget {
  const ProfileForTech({Key? key}) : super(key: key);

  @override
  State<ProfileForTech> createState() => _ProfileForTechState();
}

class _ProfileForTechState extends State<ProfileForTech> {
  ProfileController profileController = Get.put(ProfileController());
  bool switchValue = false;
  bool dataNotLoaded = true;
  TechProfile? data = null;

  @override
  initState() {
    // TODO: implement initState
    super.initState();
    get_data();
  }

  Future<void> get_data() async {
    var result = await profileController.getTechnecianProfile();
    if (result != null) {
      setState(() {
        data = result;
        dataNotLoaded = false;
      });
    }
  }
  FirstPageTechProcessesController firstPageTechProcessesController = Get.put(FirstPageTechProcessesController());


  @override
  Widget build(BuildContext context) {
    final screenheight = MediaQuery.of(context).size.height;
    final height_figma = 926;
    final screenwidth = MediaQuery.of(context).size.width;
    final width_figma = 428;
    final CoefficientHeight = screenheight / height_figma;

    return Scaffold(
      backgroundColor: backgroundHome,
      appBar: AppBar(
        backgroundColor: backgroundHome,
        elevation: 0,
        centerTitle: true,
        title: Text(
          "پروفایل من",
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w700,
            color: fontcolor,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: screenheight / height_figma * 14,
            ),
            dataNotLoaded
                ? Container(child: CircularProgressIndicator())
                : Center(
                    child: Container(
                      width: screenwidth / width_figma * 396,
                      height: screenheight / height_figma * 304,
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
                                width: 80 * screenheight / height_figma,
                                height: 80 * screenheight / height_figma,
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
                                data!.name!,
                                style: TextStyle(
                                    fontSize: 16 * CoefficientHeight,
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
                                    fontSize: 14,
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
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Container(
                                      height: 24 * screenheight / height_figma,
                                      child: Row(
                                        children: [
                                          FittedBox(
                                            child: Icon(
                                              Icons.arrow_back_ios_rounded,
                                              color: grayColorHome,
                                              size: 13,
                                            ),
                                          ),
                                          SizedBox(
                                            width:
                                                screenwidth / width_figma * 16,
                                          ),
                                          Text(
                                            data!.phone!,
                                            style: TextStyle(
                                                fontSize:
                                                    14 * CoefficientHeight,
                                                fontWeight: FontWeight.w500,
                                                color: grayColorHome,
                                                fontFeatures: [
                                                  FontFeature('ss01', 1),
                                                ]),
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      height: screenheight / height_figma * 24,
                                    ),
                                    Container(
                                      height: 24 * screenheight / height_figma,
                                      child: Row(
                                        children: [
                                          FittedBox(
                                            child: Icon(
                                              Icons.arrow_back_ios_rounded,
                                              color: grayColorHome,
                                              size: 13,
                                            ),
                                          ),
                                          SizedBox(
                                            width:
                                                screenwidth / width_figma * 16,
                                          ),
                                          Text(
                                            data!.nationalCode!,
                                            style: TextStyle(
                                                fontSize:
                                                    14 * CoefficientHeight,
                                                fontWeight: FontWeight.w500,
                                                color: grayColorHome,
                                                fontFeatures: [
                                                  FontFeature('ss01', 1),
                                                ]),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                Directionality(
                                  textDirection: TextDirection.rtl,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "شماره تماس:",
                                        style: TextStyle(
                                            fontSize: 14 * CoefficientHeight,
                                            fontWeight: FontWeight.w400,
                                            color: fontcolor,
                                            fontFeatures: [
                                              FontFeature('ss01', 1),
                                            ]),
                                      ),
                                      SizedBox(
                                        height:
                                            screenheight / height_figma * 24,
                                      ),
                                      Text(
                                        "کد ملی:",
                                        style: TextStyle(
                                            fontSize: 14 * CoefficientHeight,
                                            fontWeight: FontWeight.w400,
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
                        ],
                      ),
                    ),
                  ),
            SizedBox(
              height: 14,
            ),
            Container(
              // width: screenwidth / width_figma * 393,
              // height: screenheight / height_figma * 564,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(32), color: Colors.white),
              child: Directionality(
                textDirection: TextDirection.rtl,
                child: Padding(
                  padding: EdgeInsets.only(
                    right: screenwidth / width_figma * 16,
                    left: screenwidth / width_figma * 16,
                  ),
                  child: Column(
                    children: [
                      GestureDetector(
                        onTap: (){
                          Get.to(() => TechMainPage());
                        },
                        child: Padding(
                          padding: EdgeInsets.only(
                            top: screenheight / height_figma * 16,
                          ),
                          child: Container(
                            // width: screenwidth / width_figma * 356,
                            // height: screenheight / height_figma * 80,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: backgroundHome),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Image.asset(
                                        "lib/features/technicians/Profile/presentation/Images/acount_info.png"),
                                    SizedBox(
                                      width: screenwidth / width_figma * 6,
                                    ),
                                    Container(
                                      // width: screenwidth / width_figma * 110,
                                      child: Text(
                                        "اطلاعات حساب",
                                        style: TextStyle(
                                            fontSize: 14 * CoefficientHeight,
                                            fontWeight: FontWeight.w500,
                                            color: Colors.black),
                                      ),
                                    ),
                                  ],
                                ),

                                // SizedBox(
                                //   width: screenwidth / width_figma * 220,
                                // ),
                                Directionality(
                                  textDirection: TextDirection.ltr,
                                  child: FittedBox(
                                    child: IconButton(
                                      onPressed: () {},
                                      icon: Icon(
                                        Icons.arrow_back_ios_rounded,
                                        size: 12,
                                        color: phonecolor,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: (){
                          firstPageTechProcessesController.getTechProcess();
                        },
                        child: Padding(
                          padding: EdgeInsets.only(
                            top: screenheight / height_figma * 16,
                          ),
                          child: Container(
                            // width: screenwidth / width_figma * 356,
                            // height: screenheight / height_figma * 80,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: backgroundHome),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Image.asset(
                                        "lib/features/client/Setting/presentation/Images/transaction.png"),
                                    SizedBox(
                                      width: screenwidth / width_figma * 6,
                                    ),
                                    Container(
                                      // width: screenwidth / width_figma * 110,
                                      child: Text(
                                        "تاریخچه تراکنش ها",
                                        style: TextStyle(
                                            fontSize: 14 * CoefficientHeight,
                                            fontWeight: FontWeight.w500,
                                            color: Colors.black,
                                            fontFeatures: [
                                              FontFeature('ss01', 1),
                                            ]),
                                      ),
                                    ),
                                  ],
                                ),
                                Directionality(
                                  textDirection: TextDirection.ltr,
                                  child: FittedBox(
                                    child: IconButton(
                                      onPressed: () {},
                                      icon: Icon(
                                        Icons.arrow_back_ios_rounded,
                                        size: 12,
                                        color: phonecolor,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          top: screenheight / height_figma * 16,
                        ),
                        child: Container(
                          // width: screenwidth / width_figma * 356,
                          // height: screenheight / height_figma * 40,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: backgroundHome),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Image.asset(
                                      "lib/features/client/Setting/presentation/Images/rules.png"),
                                  SizedBox(
                                    width: screenwidth / width_figma * 6,
                                  ),
                                  Container(
                                    // width: screenwidth / width_figma * 100,
                                    child: Text(
                                      "قوانین و مقررات",
                                      style: TextStyle(
                                          fontSize: 14 * CoefficientHeight,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.black),
                                    ),
                                  ),
                                ],
                              ),
                              Directionality(
                                textDirection: TextDirection.ltr,
                                child: FittedBox(
                                  child: IconButton(
                                    onPressed: () {},
                                    icon: Icon(
                                      Icons.arrow_back_ios_rounded,
                                      size: 12,
                                      color: phonecolor,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          top: screenheight / height_figma * 16,
                        ),
                        child: Container(
                          // width: screenwidth / width_figma * 356,
                          // height: screenheight / height_figma * 40,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: backgroundHome),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Image.asset(
                                      "lib/features/client/Setting/presentation/Images/language.png"),
                                  SizedBox(
                                    width: screenwidth / width_figma * 6,
                                  ),
                                  Container(
                                    // width: screenwidth / width_figma * 100,
                                    child: Text(
                                      "زبان اپلیکیشن",
                                      style: TextStyle(
                                          fontSize: 14 * CoefficientHeight,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.black,
                                          fontFeatures: [
                                            FontFeature('ss01', 1),
                                          ]),
                                    ),
                                  ),
                                ],
                              ),
                              Directionality(
                                textDirection: TextDirection.ltr,
                                child: FittedBox(
                                  child: IconButton(
                                    onPressed: () {},
                                    icon: Icon(
                                      Icons.arrow_back_ios_rounded,
                                      size: 12,
                                      color: phonecolor,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          top: screenheight / height_figma * 16,
                        ),
                        child: Container(
                          // width: screenwidth / width_figma * 356,
                          // height: screenheight / height_figma * 40,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: backgroundHome),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Image.asset(
                                      "lib/features/client/Setting/presentation/Images/notification.png"),
                                  SizedBox(
                                    width: screenwidth / width_figma * 6,
                                  ),
                                  Container(
                                    // width: screenwidth / width_figma * 100,
                                    child: Text(
                                      "تنظیمات اعلانات",
                                      style: TextStyle(
                                          fontSize: 14 * CoefficientHeight,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.black,
                                          fontFeatures: [
                                            FontFeature('ss01', 1),
                                          ]),
                                    ),
                                  ),
                                ],
                              ),
                              Directionality(
                                textDirection: TextDirection.ltr,
                                child: FittedBox(
                                  child: IconButton(
                                    onPressed: () {},
                                    icon: Icon(
                                      Icons.arrow_back_ios_rounded,
                                      size: 12,
                                      color: phonecolor,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          top: screenheight / height_figma * 16,
                        ),
                        child: Container(
                          // width: screenwidth / width_figma * 356,
                          // height: screenheight / height_figma * 40,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: backgroundHome),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Image.asset(
                                      "lib/features/client/Setting/presentation/Images/night_mode.png"),
                                  SizedBox(
                                    width: screenwidth / width_figma * 6,
                                  ),
                                  Container(
                                    // width: screenwidth / width_figma * 100,
                                    child: Text(
                                      "حالت تاریک",
                                      style: TextStyle(
                                          fontSize: 14 * CoefficientHeight,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.black,
                                          fontFeatures: [
                                            FontFeature('ss01', 1),
                                          ]),
                                    ),
                                  ),
                                ],
                              ),
                              Directionality(
                                textDirection: TextDirection.ltr,
                                child: Container(
                                  width: screenwidth / width_figma * 32,
                                  height: screenheight / height_figma * 14,
                                  child: FlutterSwitch(
                                    width: 32,
                                    height: 15,
                                    toggleSize: 10,
                                    activeColor: LightBlue,
                                    showOnOff: false,
                                    inactiveColor: toggleColor,
                                    value: switchValue,
                                    onToggle: (value) {
                                      setState(() {
                                        switchValue = value;
                                      });
                                    },
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          showDialog(
                            context: context,
                            builder: (context) => Dialog(
                              child: Container(
                                width: screenwidth / width_figma * 356,
                                height: screenheight / height_figma * 170,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(28),
                                  color: Colors.white,
                                ),
                                child: Column(
                                  children: [
                                    SizedBox(
                                      height: screenheight / height_figma * 41,
                                    ),
                                    Text(
                                      "آیا از خروج از حساب مطمعن هستید؟",
                                      style: TextStyle(
                                        color: fontcolor,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                    SizedBox(
                                      height: screenheight / height_figma * 39,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        GestureDetector(
                                          onTap: () {
                                            removeValues('access_token');
                                            removeValues('refresh_token');
                                            Get.back(result: false);
                                          },
                                          child: Container(
                                            height: screenheight /
                                                height_figma *
                                                36,
                                            width:
                                                screenwidth / width_figma * 100,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(48),
                                                gradient: LinearGradient(
                                                    begin: Alignment.topRight,
                                                    end: Alignment.bottomLeft,
                                                    colors: [
                                                      rediligal,
                                                      whiteiligal
                                                    ])),
                                            child: Center(
                                              child: Text(
                                                "انصراف",
                                                style: TextStyle(
                                                  fontWeight: FontWeight.w700,
                                                  fontSize: 14,
                                                  color: Colors.white,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          width: screenwidth / width_figma * 8,
                                        ),
                                        GestureDetector(
                                          onTap: () {
                                            removeValues("access_token");
                                            Get.to(LoginFirstPage());
                                          },
                                          child: Container(
                                            height: screenheight /
                                                height_figma *
                                                36,
                                            width:
                                                screenwidth / width_figma * 100,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(48),
                                                gradient: LinearGradient(
                                                    begin: Alignment.topRight,
                                                    end: Alignment.bottomLeft,
                                                    colors: [
                                                      LightBlue,
                                                      White
                                                    ])),
                                            child: Center(
                                              child: Text(
                                                "تایید",
                                                style: TextStyle(
                                                  fontWeight: FontWeight.w700,
                                                  fontSize: 14,
                                                  color: Colors.white,
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
                            ),
                          );
                        },
                        child: Padding(
                          padding: EdgeInsets.only(
                            top: screenheight / height_figma * 16,
                          ),
                          child: Container(
                            // width: screenwidth / width_figma * 356,
                            // height: screenheight / height_figma * 40,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: backgroundHome),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Image.asset(
                                        "lib/features/client/Setting/presentation/Images/on_off.png"),
                                    SizedBox(
                                      width: screenwidth / width_figma * 6,
                                    ),
                                    Container(
                                      // width: screenwidth / width_figma * 100,
                                      child: Text(
                                        "خروج از حساب",
                                        style: TextStyle(
                                            fontSize: 14 * CoefficientHeight,
                                            fontWeight: FontWeight.w500,
                                            color: Colors.black),
                                      ),
                                    ),
                                  ],
                                ),
                                Directionality(
                                  textDirection: TextDirection.ltr,
                                  child: FittedBox(
                                    child: IconButton(
                                      onPressed: () {},
                                      icon: Icon(
                                        Icons.arrow_back_ios_rounded,
                                        size: 12,
                                        color: phonecolor,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          top: screenheight / height_figma * 16,
                        ),
                        child: Container(
                          // width: screenwidth / width_figma * 356,
                          // height: screenheight / height_figma * 40,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: backgroundHome),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Image.asset(
                                      "lib/features/client/Setting/presentation/Images/about_app.png"),
                                  SizedBox(
                                    width: screenwidth / width_figma * 6,
                                  ),
                                  Container(
                                    // width: screenwidth / width_figma * 100,
                                    child: Text(
                                      "درباره اپلیکیشن",
                                      style: TextStyle(
                                          fontSize: 14 * CoefficientHeight,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.black,
                                          fontFeatures: [
                                            FontFeature('ss01', 1),
                                          ]),
                                    ),
                                  )
                                ],
                              ),
                              Directionality(
                                textDirection: TextDirection.ltr,
                                child: FittedBox(
                                  child: IconButton(
                                    onPressed: () {},
                                    icon: Icon(
                                      Icons.arrow_back_ios_rounded,
                                      size: 12,
                                      color: phonecolor,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          top: screenheight / height_figma * 31,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              width: 30 * screenwidth / width_figma,
                              height: 41 * screenheight / height_figma,
                              child: FittedBox(
                                child: Image.asset(
                                    "lib/features/client/Setting/presentation/Images/a-neur.png"),
                              ),
                            ),
                            FittedBox(
                              child: Text(
                                "طراحی و توسعه توسط a-neur انجام میشود",
                                style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 12 * CoefficientHeight,
                                  color: fontcolor,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: screenheight / height_figma * 9,
            ),
          ],
        ),
      ),
    );
  }
}
