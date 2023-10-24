import 'package:clinic/features/client/Home/Controller/process_controller.dart';
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

  final ProcessController processController = Get.put(ProcessController());


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
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: screenwidth / width_figma * 396,
              height: 48,
              margin: EdgeInsets.only(
                left: screenwidth / width_figma * 15,
                right: screenwidth / width_figma * 15,
              ),
              child: TextField(
                textAlign: TextAlign.right,
                decoration: InputDecoration(
                  suffixIcon: Icon(
                    Search.search,
                    size: 24,
                    color: phonecolor,
                  ),
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
                    right: screenwidth / width_figma * 20,
                  ),
                  child: GestureDetector(
                      onTap: () {
                        processController.fetchprocesses();
                      },
                      child: Image.asset(
                          "lib/features/client/Home/presentation/images/date.png")),
                ),
                Container(
                    margin: EdgeInsets.only(
                      right: screenwidth / width_figma * 8,
                    ),
                    child: Text("نوبت های دوشنبه 12 آذر")),
                Container(
                  margin: EdgeInsets.only(
                    right: screenwidth / width_figma * 16,
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
                    itemCount: items == null ? 0 : items.length, // fjdkfjdfkgdfgdfk;jgkgjdfklfdjk;jb;dfkfjd;fmd;klg
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          Get.to(PlantInfo(), arguments: [
                            items[index].tech,
                            items[index].zibajo,
                            items[index].situation,
                            items[index].number_of_hairs.toString(),
                          ]);
                        },
                        child: Padding(
                          padding: EdgeInsets.only(
                            top: 10,
                            right: screenwidth / width_figma * 19,
                            left: screenwidth / width_figma * 19,
                            bottom: 10,
                          ),
                          child: Container(
                            width: screenwidth / width_figma * 396,
                            height: 164,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(16),
                                color: Colors.white),
                            child: Directionality(
                              textDirection: TextDirection.rtl,
                              child: Padding(
                                padding: EdgeInsets.only(
                                  top: screenheight / height_figma * 17,
                                  right: screenwidth / width_figma * 16,
                                  left: screenwidth / width_figma * 16,
                                  bottom: screenheight / height_figma * 17,
                                ),
                                child: Row(
                                  children: [
                                    Image.asset(
                                        "lib/features/client/Home/presentation/images/gol.png"),
                                    SizedBox(
                                      width: screenwidth / width_figma * 10,
                                    ),
                                    Container(
                                      width: screenwidth / width_figma * 110,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "کاشت مو",
                                            style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w700,
                                                color: fontcolor),
                                          ),
                                          SizedBox(
                                            height:
                                                screenheight / height_figma * 6,
                                          ),
                                          Text(
                                            "تکنسین:",
                                            style: TextStyle(
                                                fontWeight: FontWeight.w500,
                                                fontSize: 14,
                                                color: grayColorHome),
                                          ),
                                          SizedBox(
                                            height:
                                                screenheight / height_figma * 3,
                                          ),
                                          Text(
                                            items[index].tech.toString(),
                                            style: TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w500,
                                                color: fontcolor),
                                          ),
                                          SizedBox(
                                            height:
                                                screenheight / height_figma * 6,
                                          ),
                                          Text(
                                            "زیباجو:",
                                            style: TextStyle(
                                                fontWeight: FontWeight.w500,
                                                fontSize: 14,
                                                color: grayColorHome),
                                          ),
                                          SizedBox(
                                            height:
                                                screenheight / height_figma * 3,
                                          ),
                                          Text(
                                            items[index].zibajo.toString(),
                                            style: TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w500,
                                                color: fontcolor),
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      width: screenwidth / width_figma * 53,
                                    ),
                                    Column(
                                      children: [
                                        SizedBox(
                                          height:
                                              screenheight / height_figma * 25,
                                        ),
                                        Text(
                                          "تار مو:",
                                          style: TextStyle(
                                              fontWeight: FontWeight.w500,
                                              fontSize: 14,
                                              color: grayColorHome),
                                        ),
                                        SizedBox(
                                          height:
                                              screenheight / height_figma * 3,
                                        ),
                                        Text(
                                          items[index]
                                              .number_of_hairs
                                              .toString(),
                                          style: TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w500,
                                              color: fontcolor),
                                        ),
                                        SizedBox(
                                          height:
                                              screenheight / height_figma * 6,
                                        ),
                                        Text(
                                          "وضعیت:",
                                          style: TextStyle(
                                              fontWeight: FontWeight.w500,
                                              fontSize: 14,
                                              color: grayColorHome),
                                        ),
                                        SizedBox(
                                          height:
                                              screenheight / height_figma * 3,
                                        ),
                                        items[index].situation == "Expectation"
                                            ? Container(
                                                width: screenwidth /
                                                    width_figma *
                                                    97,
                                                height: 24,
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            16),
                                                    color: processColor),
                                                child: Center(
                                                  child: Text(
                                                    "در انتظار تایید",
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.w800,
                                                        fontSize: 14,
                                                        color: Colors.white),
                                                  ),
                                                ),
                                              )
                                            : items[index].situation ==
                                                    "completed"
                                                ? Container(
                                                    width: screenwidth /
                                                        width_figma *
                                                        97,
                                                    height: 24,
                                                    decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(16),
                                                        color: LightBlue),
                                                    child: Center(
                                                      child: Text(
                                                        "تایید شده",
                                                        style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.w800,
                                                            fontSize: 14,
                                                            color:
                                                                Colors.white),
                                                      ),
                                                    ),
                                                  )
                                                : Container(
                                                    width: screenwidth /
                                                        width_figma *
                                                        97,
                                                    height: 24,
                                                    decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(16),
                                                        color: rediligal),
                                                    child: Center(
                                                      child: Text(
                                                        "در حال انجام",
                                                        style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.w800,
                                                            fontSize: 14,
                                                            color:
                                                                Colors.white),
                                                      ),
                                                    ),
                                                  ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
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
      ),
    );
  }
}
