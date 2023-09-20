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
import '../../../ZibajoyanMan/presentation/pages/zibajo_page_1.dart';

class ShoroyeFarayandPage2 extends StatefulWidget {
  const ShoroyeFarayandPage2({Key? key}) : super(key: key);

  @override
  State<ShoroyeFarayandPage2> createState() => _ShoroyeFarayandPage2State();
}

class _ShoroyeFarayandPage2State extends State<ShoroyeFarayandPage2> {
  int currenttab = 2;
  List<Widget> screens = [
    HomeForTech(),
    ProfileForTech(),
    ZibajoPage1(),
  ];

  final PageStorageBucket bucket = PageStorageBucket();
  Widget currentscreen = ShoroyeFarayandPage2();

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
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: Padding(
          padding: EdgeInsets.only(
            right: screenwidth / width_figma * 16,
            left: screenwidth / width_figma * 16,
            top: screenheight / screenwidth * 16,
            bottom: screenheight / height_figma * 16,
          ),
          child: Container(
            width: screenwidth / width_figma * 396,
            height: screenheight / height_figma * 706,
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
                    height: screenheight / height_figma * 16,
                  ),
                  Center(
                    child: Image.asset(
                        "lib/features/technicians/ZibajoyanMan/Images/gol.png"),
                  ),
                  SizedBox(
                    height: screenheight / height_figma * 8,
                  ),
                  Center(
                    child: Text(
                      "کاشت مو",
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          color: fontcolor),
                    ),
                  ),
                  SizedBox(
                    height: screenheight / height_figma * 32,
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      right: screenwidth / width_figma * 62,
                      left: screenwidth / width_figma * 62,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "قبل از کاشت مو:",
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 14,
                              color: fontcolor),
                        ),
                        SizedBox(
                          height: screenheight / height_figma * 16,
                        ),
                        Row(
                          children: [
                            Container(
                              width: 80,
                              height: 80,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(16),
                                  color: phonecolor),
                            ),
                            SizedBox(
                              width: screenwidth / width_figma * 8,
                            ),
                            Container(
                              width: 80,
                              height: 80,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(16),
                                  color: phonecolor),
                            ),
                            SizedBox(
                              width: screenwidth / width_figma * 8,
                            ),
                            Container(
                              width: 80,
                              height: 80,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(16),
                                  color: phonecolor),
                            ),
                            SizedBox(
                              width: screenwidth / width_figma * 8,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: screenheight / height_figma * 24,
                        ),
                        Text(
                          "بعد از کاشت مو:",
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 14,
                              color: fontcolor),
                        ),
                        SizedBox(
                          height: screenheight / height_figma * 16,
                        ),
                        Row(
                          children: [
                            Container(
                              width: 80,
                              height: 80,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(16),
                                  color: phonecolor),
                            ),
                            SizedBox(
                              width: screenwidth / width_figma * 8,
                            ),
                            Container(
                              width: 80,
                              height: 80,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(16),
                                  color: phonecolor),
                            ),
                            SizedBox(
                              width: screenwidth / width_figma * 8,
                            ),
                            Container(
                              width: 80,
                              height: 80,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(16),
                                  color: phonecolor),
                            ),
                            SizedBox(
                              width: screenwidth / width_figma * 8,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: screenheight / height_figma * 32,
                  ),
                  Text(
                    "آیا در فرایند کاشت مو به مشکل خوردید",
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: fontcolor),
                  ),
                  SizedBox(
                    height: screenheight / height_figma * 16,
                  ),
                  Text(
                    "توضیحات خود را وارد کنید",
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: fontcolor),
                  ),
                  SizedBox(
                    height: screenheight / height_figma * 4,
                  ),
                  Container(
                    width: screenwidth / width_figma * 380,
                    height: screenheight / height_figma * 111,
                    child: TextField(
                      textAlign: TextAlign.right,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(
                            vertical: screenheight / height_figma * 111),
                        hintText: "    توضیحات",
                        hintStyle: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 14,
                          color: phonecolor,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16),
                          borderSide: BorderSide(
                            color: SendagainColorwhite,
                            width: 2,
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: outlineborder, width: 2),
                          borderRadius: BorderRadius.circular(16),
                        ),
                      ),
                    ),
                  ),
                  // Inja bayad Imgage picker bezari
                  SizedBox(
                    height: screenheight / height_figma * 34,
                  ),
                  GestureDetector(
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (context) => Dialog(
                          child: Container(
                            width: screenwidth / width_figma * 356,
                            height: screenheight / height_figma * 232,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(32),
                              color: Colors.white,
                            ),
                            child: Column(
                              children: [
                                SizedBox(
                                  height: screenheight / height_figma * 40,
                                ),
                                 Image.asset("lib/features/technicians/ZibajoyanMan/Images/popped_up.png"),
                                SizedBox(
                                  height: screenheight / height_figma * 8,
                                ),
                                Directionality(
                                  textDirection: TextDirection.rtl,
                                  child: Center(
                                    child: Text(
                                      "کاشت موی شما با موفقیت ثبت شد",
                                      style: TextStyle(
                                        color: fontcolor,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: screenheight / height_figma * 46,
                                ),
                                Center(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      GestureDetector(
                                        onTap: () {
                                          Get.back(result: false);
                                        },
                                        child: Container(
                                          height: screenheight / height_figma * 36,
                                          width: screenwidth / width_figma * 142,
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
                                              "مشاهده لیست سوابق",
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
                                          Get.back(result: true);
                                        },
                                        child: Container(
                                          height: screenheight / height_figma * 36,
                                          width: screenwidth / width_figma * 152,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(48),
                                              gradient: LinearGradient(
                                                  begin: Alignment.topRight,
                                                  end: Alignment.bottomLeft,
                                                  colors: [LightBlue, White])),
                                          child: Center(
                                            child: Text(
                                              "!متوجه شدم",
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
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                    child: Container(
                      width: screenwidth / width_figma * 364,
                      height: screenheight / height_figma * 36,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(48),
                        gradient: LinearGradient(
                            begin: Alignment.topRight,
                            end: Alignment.bottomLeft,
                            colors: [rediligal, whiteiligal]),
                      ),
                      child: Center(
                        child: Text(
                          "ثبت نهایی",
                          style: TextStyle(
                            fontWeight: FontWeight.w800,
                            fontSize: 14,
                            color: Colors.white,
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
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        child: Container(
          height: screenheight / height_figma * 96,
          child: Center(
            child: Padding(
              padding: EdgeInsets.only(
                left: screenwidth / width_figma * 24,
                right: screenwidth / width_figma * 23,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  currenttab == 0
                      ? MaterialButton(
                          minWidth: screenwidth / width_figma * 40,
                          onPressed: () {
                            setState(() {
                              currentscreen = ProfileForTech();
                              currenttab = 0;
                              Get.to(
                                Techpages(),
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
                                  color: currenttab == 0
                                      ? Colors.white
                                      : phonecolor,
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
                        )
                      : MaterialButton(
                          minWidth: screenwidth / width_figma * 40,
                          onPressed: () {
                            setState(() {
                              currentscreen = ProfileForTech();
                              currenttab = 0;
                              Get.to(
                                Techpages(),
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
                                  color: currenttab == 0
                                      ? Colors.blue
                                      : Colors.grey,
                                ),
                              ),
                              Text(
                                "پروفایل من",
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  color: currenttab == 0
                                      ? Colors.blue
                                      : Colors.grey,
                                ),
                              )
                            ],
                          ),
                        ),
                  currenttab == 1
                      ? MaterialButton(
                          minWidth: screenwidth / width_figma * 40,
                          onPressed: () {
                            setState(() {
                              currentscreen = HomeForTech();
                              currenttab = 1;
                              Get.to(
                                Techpages(),
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
                                  color: currenttab == 1
                                      ? Colors.white
                                      : phonecolor,
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
                        )
                      : MaterialButton(
                          minWidth: screenwidth / width_figma * 40,
                          onPressed: () {
                            setState(() {
                              currentscreen = HomeForTech();
                              currenttab = 1;
                              Get.to(
                                Techpages(),
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
                                  color: currenttab == 1
                                      ? Colors.blue
                                      : Colors.grey,
                                ),
                              ),
                              Text(
                                "نوبت دهی",
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  color: currenttab == 1
                                      ? Colors.blue
                                      : Colors.grey,
                                ),
                              )
                            ],
                          ),
                        ),
                  currenttab == 2
                      ? MaterialButton(
                          minWidth: screenwidth / width_figma * 40,
                          onPressed: () {
                            setState(() {
                              currentscreen = ZibajoPage1();
                              currenttab = 2;
                              Get.to(
                                Techpages(),
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
                                  color: currenttab == 2
                                      ? Colors.white
                                      : phonecolor,
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
                        )
                      : MaterialButton(
                          minWidth: screenwidth / width_figma * 40,
                          onPressed: () {
                            setState(() {
                              currentscreen = ZibajoPage1();
                              currenttab = 2;
                              Get.to(
                                Techpages(),
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
                                  color: currenttab == 2
                                      ? Colors.blue
                                      : Colors.grey,
                                  size: 22,
                                ),
                              ),
                              Text(
                                "زیباجویان من",
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  color: currenttab == 2
                                      ? Colors.blue
                                      : Colors.grey,
                                ),
                              )
                            ],
                          ),
                        ),
                  currenttab == 3
                      ? MaterialButton(
                          minWidth: screenwidth / width_figma * 40,
                          onPressed: () {
                            setState(() {
                              currentscreen = HomeForTech();
                              currenttab = 3;
                              Get.to(
                                Techpages(),
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
                                  color: currenttab == 3
                                      ? Colors.white
                                      : phonecolor,
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
                        )
                      : MaterialButton(
                          minWidth: screenwidth / width_figma * 40,
                          onPressed: () {
                            setState(() {
                              currentscreen = HomeForTech();
                              currenttab = 3;
                              Get.to(
                                Techpages(),
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
                                  color: currenttab == 3
                                      ? Colors.blue
                                      : Colors.grey,
                                  size: 22,
                                ),
                              ),
                              Text(
                                "خانه",
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  color: currenttab == 3
                                      ? Colors.blue
                                      : Colors.grey,
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
