import 'dart:ui';

import 'package:clinic/features/client/Technicians/presentation/pages/tech_profile.dart';
import 'package:clinic/features/technicians/ZibajoyanMan/presentation/pages/zibajo_page_1.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

import '../../../../../themes/colors.dart';
import '../../../../client/NavigationBar/Icons/navigation_bar_icons.dart';
import '../../../Home/presentation/pages/home_for_tech.dart';
import '../../../NavigationBar/Icons/tech_navigation_icons.dart';
import '../../../NavigationBar/navigation_bar_for_tech.dart';
import '../../../Profile/presentation/pages/profile_for_tech.dart';
import '../../../Shoroefarayand/presentation/pages/shoroe_farayand_page_1.dart';

class ZibajoPage2 extends StatefulWidget {
  const ZibajoPage2({Key? key}) : super(key: key);

  @override
  State<ZibajoPage2> createState() => _ZibajoPage2State();
}

class _ZibajoPage2State extends State<ZibajoPage2> {

  int currenttab = 2;
  List<Widget> screens = [
    HomeForTech(),
    ProfileForTech(),
    ZibajoPage1(),
  ];

  final PageStorageBucket bucket = PageStorageBucket();
  Widget currentscreen = ZibajoPage2();


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
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: Padding(
            padding: EdgeInsets.only(
              right: screenwidth / width_figma * 16,
              left: screenwidth / width_figma * 16,
              top: 16,
              bottom: 16,
            ),
            child: Container(
              width: screenwidth / width_figma * 396,
              height: 600,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16), color: Colors.white),
              child: Padding(
                padding: EdgeInsets.only(
                  right: screenwidth / width_figma * 16,
                  left: screenwidth / width_figma * 16,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height:16,
                    ),
                    Center(
                      child: Image.asset(
                          "lib/features/technicians/ZibajoyanMan/Images/gol.png"),
                    ),
                    SizedBox(
                      height:  8,
                    ),
                    Center(
                      child: Text(
                        "کاشت مو",
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                            color: fontcolor,
                            fontFeatures: [FontFeature('ss01', 1),]
                        ),
                      ),
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
                          "دوشنبه 12 آذر 1402 ساعت 14:30",
                          style: TextStyle(
                              fontWeight: FontWeight.w700, fontSize: 14),
                          colors: [LightBlue, LightBlue],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 32,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Image.asset(
                                    "lib/features/technicians/ZibajoyanMan/Images/info.png"),
                                SizedBox(
                                  width: screenwidth / width_figma * 5.5,
                                ),
                                Text(
                                  "اطللاعات زیباجو",
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w700,
                                      color: phonecolor),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 16,
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
                              height: 4,
                            ),
                            Text(
                              "محمد حسین کمالی",
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  color: fontcolor,
                                  fontFeatures: [FontFeature('ss01', 1),]
                              ),
                            ),
                            SizedBox(
                              height: 16,
                            ),
                            Text(
                              "نام پدر:",
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
                              "حسین کمالی",
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  color: fontcolor,
                                  fontFeatures: [FontFeature('ss01', 1),]
                              ),
                            ),
                            SizedBox(
                              height: 32,
                            ),
                            Row(
                              children: [
                                Image.asset(
                                    "lib/features/technicians/ZibajoyanMan/Images/info.png"),
                                SizedBox(
                                  width: screenwidth / width_figma * 5.5,
                                ),
                                Text(
                                  "اطللاعات کاشت",
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w700,
                                      color: phonecolor,
                                      fontFeatures: [FontFeature('ss01', 1),]
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 16,
                            ),
                            Text(
                              "عملیات مورد نیاز:",
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
                              "کاشت مو",
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  color: fontcolor,
                                  fontFeatures: [FontFeature('ss01', 1),]
                              ),
                            ),
                            SizedBox(
                              height: 16,
                            ),
                            Text(
                              "هزینه کاشت:",
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 14,
                                color: grayColorHome,
                                  fontFeatures: [FontFeature('ss01', 1),]
                              ),
                            ),
                            SizedBox(
                              height: 4,
                            ),
                            Text(
                              "2500000 تومان",
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  color: fontcolor),
                            ),
                          ],
                        ),
                        SizedBox(
                          width: screenwidth / width_figma * 113,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 34,
                            ),
                            Text(
                              "شماره تماس:",
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
                              "09151245248",
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  color: fontcolor),
                            ),
                            SizedBox(
                              height: 16,
                            ),
                            Text(
                              "کد ملی:",
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 14,
                                color: grayColorHome,
                                  fontFeatures: [FontFeature('ss01', 1),]
                              ),
                            ),
                            SizedBox(
                              height: 4,
                            ),
                            Text(
                              "0058715718",
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  color: fontcolor),
                            ),
                            SizedBox(
                              height: 66,
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
                              "3000 تار مو",
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  color: fontcolor),
                            ),
                            SizedBox(
                              height: 16,
                            ),
                            Text(
                              "کد ملی:",
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 14,
                                color: grayColorHome,
                                  fontFeatures: [FontFeature('ss01', 1),]
                              ),
                            ),
                            SizedBox(
                              height: 4,
                            ),
                            Text(
                              "0058715718",
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
                      height: 32,
                    ),
                    GestureDetector(
                      onTap: (){
                        Get.to(ShoroyeFarayandPage1());
                      },
                      child: Container(
                        width: screenwidth / width_figma * 364,
                        height:  36,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(48),
                          gradient:
                              LinearGradient(
                                  begin: Alignment.topRight,
                                  end: Alignment.bottomLeft,
                                  colors: [rediligal, whiteiligal]),
                        ),
                        child: Center(
                          child: Text(
                            "شروع فرایند کاشت",
                            style: TextStyle(
                              fontWeight: FontWeight.w800,
                              fontSize: 14,
                              color: Colors.white,
                                fontFeatures: [FontFeature('ss01', 1),]
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        child: Container(
          height: screenheight / height_figma * 96,
          child: Center(
            child: Padding(
              padding:  EdgeInsets.only(
                left: screenwidth / width_figma * 24,
                right: screenwidth / width_figma * 23,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  currenttab == 0 ? MaterialButton(
                    minWidth: screenwidth / width_figma * 40,
                    onPressed: () {
                      setState(() {
                        currentscreen = ProfileForTech();
                        currenttab = 0;
                        Get.to(Techpages(),
                        arguments: currenttab,
                        );
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 36,
                          height: 36,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            gradient: LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              colors: [LightBlue, White],
                            ),
                          ),
                          child: Icon(
                            TechNavigation.profile,
                            color: currenttab == 0 ? Colors.white : phonecolor,
                            size: 22,
                          ),
                        ),
                        GradientText(
                          "پروفایل من",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                          ),
                          colors: [
                            LightBlue,
                            White,
                          ],
                        )
                      ],
                    ),
                  ):MaterialButton(
                    minWidth: screenwidth / width_figma * 40,
                    onPressed: () {
                      setState(() {
                        currentscreen = ProfileForTech();
                        currenttab = 0;
                        Get.to(Techpages(),
                          arguments: currenttab,
                        );
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 36,
                          height: 36,
                          child: Icon(
                            TechNavigation.profile,
                            color: currenttab == 0 ? Colors.blue : Colors.grey,
                          ),
                        ),
                        Text(
                          "پروفایل من",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: currenttab == 0 ? Colors.blue : Colors.grey,
                          ),
                        )
                      ],
                    ),
                  ),
                  currenttab ==1 ?  MaterialButton(
                    minWidth: screenwidth / width_figma * 40,
                    onPressed: () {
                      setState(() {
                        currentscreen = HomeForTech();
                        currenttab = 1;
                        Get.to(Techpages(),
                          arguments: currenttab,
                        );
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 36,
                          height: 36,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            gradient: LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              colors: [LightBlue, White],
                            ),
                          ),
                          child: Icon(
                            TechNavigation.nobat_dehi,
                            color: currenttab == 1 ? Colors.white : phonecolor,
                            size: 22,
                          ),
                        ),
                        GradientText(
                          "نوبت دهی",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                          ),
                          colors: [
                            LightBlue,
                            White,
                          ],
                        )
                      ],
                    ),
                  ):MaterialButton(
                    minWidth: screenwidth / width_figma * 40,
                    onPressed: () {
                      setState(() {
                        currentscreen = HomeForTech();
                        currenttab = 1;
                        Get.to(Techpages(),
                          arguments: currenttab,
                        );
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 36,
                          height: 36,
                          child: Icon(
                            TechNavigation.nobat_dehi,
                            color: currenttab == 1 ? Colors.blue : Colors.grey,
                          ),
                        ),
                        Text(
                          "نوبت دهی",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: currenttab == 1 ? Colors.blue : Colors.grey,
                          ),
                        )
                      ],
                    ),
                  ),
                  currenttab == 2 ?  MaterialButton(
                    minWidth: screenwidth / width_figma * 40,
                    onPressed: () {
                      setState(() {
                        currentscreen = ZibajoPage1();
                        currenttab = 2;
                        Get.to(Techpages(),
                          arguments: currenttab,
                        );
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 36,
                          height: 36,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            gradient: LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              colors: [LightBlue, White],
                            ),
                          ),
                          child: Icon(
                            NavigationBarIcons.tech,
                            color: currenttab == 2 ? Colors.white : phonecolor,
                            size: 22,
                          ),
                        ),
                        GradientText(
                          "زیباجویان من",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                          ),
                          colors: [
                            LightBlue,
                            White,
                          ],
                        )
                      ],
                    ),
                  ):MaterialButton(
                    minWidth: screenwidth / width_figma * 40,
                    onPressed: () {
                      setState(() {
                        currentscreen = ZibajoPage1();
                        currenttab = 2;
                        Get.to(Techpages(),
                          arguments: currenttab,
                        );
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 36,
                          height: 36,
                          child: Icon(
                            NavigationBarIcons.tech,
                            color: currenttab == 2 ? Colors.blue : Colors.grey,
                            size: 22,
                          ),
                        ),
                        Text(
                          "زیباجویان من",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: currenttab == 2 ? Colors.blue : Colors.grey,
                          ),
                        )
                      ],
                    ),
                  ),
                  currenttab == 3 ?  MaterialButton(
                    minWidth: screenwidth / width_figma * 40,
                    onPressed: () {
                      setState(() {
                        currentscreen = HomeForTech();
                        currenttab = 3;
                        Get.to(Techpages(),
                          arguments: currenttab,
                        );
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 36,
                          height: 36,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            gradient: LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              colors: [LightBlue, White],
                            ),
                          ),
                          child: Icon(
                            NavigationBarIcons.khane,
                            color: currenttab == 3 ? Colors.white : phonecolor,
                            size: 22,
                          ),
                        ),
                        GradientText(
                          "خانه",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                          ),
                          colors: [
                            LightBlue,
                            White,
                          ],
                        )
                      ],
                    ),
                  ):MaterialButton(
                    minWidth: screenwidth / width_figma * 40,
                    onPressed: () {
                      setState(() {
                        currentscreen = HomeForTech();
                        currenttab = 3;
                        Get.to(Techpages(),
                          arguments: currenttab,
                        );
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 36,
                          height: 36,
                          child: Icon(
                            NavigationBarIcons.khane,
                            color: currenttab == 3 ? Colors.blue : Colors.grey,
                            size: 22,
                          ),
                        ),
                        Text(
                          "خانه",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: currenttab == 3 ? Colors.blue : Colors.grey,
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
      ),
    );
  }
}
