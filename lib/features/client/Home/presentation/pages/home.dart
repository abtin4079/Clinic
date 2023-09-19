import 'package:clinic/features/auth/presentation/pages/login_first_page.dart';
import 'package:clinic/features/client/Home/domain/entity.dart';
import 'package:clinic/features/client/Home/presentation/pages/plant_info.dart';
import 'package:clinic/themes/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../NavigationBar/Icons/navigation_bar_icons.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
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
          "خانه",
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w700,
            color: fontcolor,
          ),
        ),
      ),
      body: Column(
        children: [
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
                suffixIcon: Icon(Search.search, size: 24,color: phonecolor,),
                hintText: " جستجو در بین نوبت ها",
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
            height: screenheight / height_figma * 30,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                margin: EdgeInsets.only(
                  right: screenwidth / width_figma * 4,
                ),
                child: Image.asset(
                    "lib/features/client/Home/presentation/images/calender.png"),
              ),
              Container(
                margin: EdgeInsets.only(
                  right: screenwidth / width_figma *20,
                ),
                child: MaterialButton(
                    onPressed: () {},
                    child: Image.asset(
                        "lib/features/client/Home/presentation/images/date.png")),
              ),
              Container(
                margin: EdgeInsets.only(
                  right: screenwidth / width_figma *8,
                ),
                  child: Text("نوبت های دوشنبه 12 آذر")),
              Container(
                margin: EdgeInsets.only(
                  right: screenwidth / width_figma *16,
                ),
                child: Image.asset(
                    "lib/features/client/Home/presentation/images/copy.png"),
              ),
            ],
          ),
          SizedBox(
            height: screenheight / height_figma * 10,
          ),
           
        ],
      ),
    );
  }
}
