import 'package:clinic/features/client/Technicians/presentation/pages/tech_profile.dart';
import 'package:flutter/material.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

import '../../../../../themes/colors.dart';
import '../../../NavigationBar/navigation_bar_for_tech.dart';

class ZibajoPage2 extends StatefulWidget {
  const ZibajoPage2({Key? key}) : super(key: key);

  @override
  State<ZibajoPage2> createState() => _ZibajoPage2State();
}

class _ZibajoPage2State extends State<ZibajoPage2> {
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
            height: screenheight / height_figma * 585,
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
                    height: screenheight / height_figma * 8,
                  ),
                  Container(
                    width: screenwidth / width_figma * 364,
                    height: screenheight / height_figma * 36,
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
                    height: screenheight / height_figma * 32,
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
                            height: screenheight / height_figma * 16,
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
                            height: screenheight / height_figma * 4,
                          ),
                          Text(
                            "محمد حسین کمالی",
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                color: fontcolor),
                          ),
                          SizedBox(
                            height: screenheight / height_figma * 16,
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
                            height: screenheight / height_figma * 4,
                          ),
                          Text(
                            "حسین کمالی",
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                color: fontcolor),
                          ),
                          SizedBox(
                            height: screenheight / height_figma * 32,
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
                                    color: phonecolor),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: screenheight / height_figma * 16,
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
                            height: screenheight / height_figma * 4,
                          ),
                          Text(
                            "کاشت مو",
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                color: fontcolor),
                          ),
                          SizedBox(
                            height: screenheight / height_figma * 16,
                          ),
                          Text(
                            "هزینه کاشت:",
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 14,
                              color: grayColorHome,
                            ),
                          ),
                          SizedBox(
                            height: screenheight / height_figma * 4,
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
                            height: screenheight / height_figma * 34,
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
                            height: screenheight / height_figma * 4,
                          ),
                          Text(
                            "09151245248",
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                color: fontcolor),
                          ),
                          SizedBox(
                            height: screenheight / height_figma * 16,
                          ),
                          Text(
                            "کد ملی:",
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 14,
                              color: grayColorHome,
                            ),
                          ),
                          SizedBox(
                            height: screenheight / height_figma * 4,
                          ),
                          Text(
                            "0058715718",
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                color: fontcolor),
                          ),
                          SizedBox(
                            height: screenheight / height_figma * 66,
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
                            height: screenheight / height_figma * 4,
                          ),
                          Text(
                            "3000 تار مو",
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                color: fontcolor),
                          ),
                          SizedBox(
                            height: screenheight / height_figma * 16,
                          ),
                          Text(
                            "کد ملی:",
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 14,
                              color: grayColorHome,
                            ),
                          ),
                          SizedBox(
                            height: screenheight / height_figma * 4,
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
                    height: screenheight / height_figma * 32,
                  ),
                  Container(
                    width: screenwidth / width_figma * 364,
                    height: screenheight / height_figma * 36,
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
    );
  }
}
