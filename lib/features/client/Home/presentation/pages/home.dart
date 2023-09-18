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
          FutureBuilder(
            future: ReadJsonData(),
            builder: (context, data) {
              if (data.hasError) {
                return Text("${data.error}");
              } else if (data.hasData) {
                var items = data.data as List<EntityHome>;
                return ListView.builder(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemCount: items == null ? 0 : items.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: (){
                        Get.to(PlantInfo(),
                        arguments: [items[index].tech , items[index].zibajo , items[index].situation , items[index].number_of_hairs ]
                        );
                      },
                      child: Card(
                        child: Container(
                          //  margin: EdgeInsets.only(
                          //   left: screenwidth / width_figma * 20,
                          //  right: screenwidth / width_figma * 20,
                          //    top: screenheight / height_figma * 20,
                          //  ),
                          // width: screenwidth / width_figma * 396,
                          // height: screenheight / height_figma * 152,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                              color: Colors.white),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Container(
                                margin: EdgeInsets.only(
                                  top: screenheight / height_figma * 44,
                                  left: screenwidth / width_figma * 30,
                                ),
                                //  decoration: BoxDecoration(color: Colors.yellow),
                                child: Column(
                                  children: [
                                    Container(
                                      child: Text(
                                        ": تعداد تار مو",
                                        style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 14,
                                          color: grayColorHome,
                                        ),
                                      ),
                                    ),
                                    Container(
                                      child: Text(
                                        items[index].number_of_hairs.toString(),
                                        style: TextStyle(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 14,
                                          color: fontcolor,
                                        ),
                                      ),
                                    ),
                                    Container(
                                      child: Text(
                                        ":وضعیت",
                                        style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 14,
                                          color: grayColorHome,
                                        ),
                                      ),
                                    ),
                                    Container(
                                      width: screenwidth / width_figma * 97,
                                      height: screenheight / height_figma * 24,
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(16),
                                          color: items[index].situation ==
                                                  "completed"
                                              ? LightBlue
                                              : items[index].situation ==
                                                      "Expectation"
                                                  ? processColor
                                                  : rediligal),
                                      child: items[index].situation == "completed"
                                          ? Center(
                                              child: Text(
                                              "تایید شده",
                                              style: TextStyle(
                                                fontWeight: FontWeight.w800,
                                                fontSize: 14,
                                                color: Colors.white,
                                              ),
                                            ))
                                          : items[index].situation ==
                                                  "Expectation"
                                              ? Center(
                                                  child: Text(
                                                  "در انتظار تایید",
                                                  style: TextStyle(
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.w800,
                                                    color: Colors.white,
                                                  ),
                                                ))
                                              : Center(
                                                  child: Text(
                                                  "در حال انجام",
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.w800,
                                                    fontSize: 14,
                                                    color: Colors.white,
                                                  ),
                                                )),
                                    )
                                  ],
                                ),
                              ),
                              Container(
                                width: screenwidth / width_figma * 100,
                                margin: EdgeInsets.only(
                                  top: screenheight / height_figma * 17,
                                  left: screenwidth / width_figma * 90,
                                  right: screenwidth / width_figma * 10,
                                ),
                                // decoration: BoxDecoration(color: Colors.yellow),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Container(
                                      child: Text(
                                        "کاشت مو",
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w700,
                                          color: fontcolor,
                                        ),
                                      ),
                                    ),
                                    Container(
                                      child: const Text(
                                        ":تکنیسین",
                                        style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400,
                                          color: grayColorHome,
                                        ),
                                      ),
                                    ),
                                    Container(
                                      child: Text(
                                        items[index].tech.toString(),
                                        style: TextStyle(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 14,
                                          color: fontcolor,
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: screenheight / height_figma * 12,
                                    ),
                                    Container(
                                      child: Text(
                                        ":زیباجو",
                                        style: TextStyle(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 14,
                                          color: grayColorHome,
                                        ),
                                      ),
                                    ),
                                    Container(
                                      child: Text(
                                        items[index].zibajo.toString(),
                                        style: TextStyle(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 14,
                                          color: fontcolor,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                  margin: EdgeInsets.only(
                                    top: screenheight / height_figma * 17,
                                    bottom: screenheight / height_figma * 17,
                                    right: screenwidth / width_figma * 16,
                                  ),
                                  child: Image.asset(
                                      "lib/features/client/Home/presentation/images/gol.png")),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                );
              } else {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
            },
          ),
        ],
      ),
    );
  }
}
