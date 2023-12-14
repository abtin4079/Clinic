import 'package:clinic/features/technicians/NobatDehyJadid/presentation/pages/nav_bar.dart';
import 'package:flutter/material.dart';

import '../../../../../themes/colors.dart';
import '../../domain/tech_noabat_model.dart';

class TechMainPage extends StatefulWidget {
  const TechMainPage({Key? key}) : super(key: key);

  @override
  State<TechMainPage> createState() => _TechMainPageState();
}

class _TechMainPageState extends State<TechMainPage> {
  @override
  Widget build(BuildContext context) {
    final screenheight = MediaQuery.of(context).size.height;
    final height_figma = 926;
    final screenwidth = MediaQuery.of(context).size.width;
    final width_figma = 428;

    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        drawer: NavBar(),
        appBar: AppBar(
          elevation: 0,
          backgroundColor: LightBlue,
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: screenheight / height_figma * 50,
              ),
             // Padding(
             //   padding: EdgeInsets.only(
             //     right: screenwidth / width_figma * 11,
            //    ),
            //    child: Image.asset("lib/features/Technecian/images/menu.png"),
            //  ),
              //SizedBox(
                //height: screenheight / height_figma * 33,
              //),
              Padding(
                padding: EdgeInsets.only(
                  right: screenwidth / width_figma * 11,
                ),
                child: Container(
                  width: screenwidth,
                  child: Text(
                    "نوبت های جدید",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w700,
                      color: fontcolor,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: screenheight / height_figma * 20,
              ),
              Padding(
                padding: EdgeInsets.only(right: screenwidth / width_figma * 13),
                child: Container(
                  height: screenheight / height_figma * 260,
                  child: FutureBuilder(
                      future: readJsonDatatech(),
                      builder: (context, data) {
                        if (data.hasError) {
                          return Center(child: Text("${data.error}"));
                        } else if (data.hasData) {
                          var items = data.data as List<TechNobatModel>;
                          return ListView.builder(
                              shrinkWrap: true,
                              scrollDirection: Axis.horizontal,
                              itemCount: items.length,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: Container(
                                    width: screenwidth / width_figma * 160,
                                    height: screenheight / height_figma * 200,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(16),
                                      color: Colors.white,
                                    ),
                                    child: Padding(
                                      padding: EdgeInsets.only(
                                          right: screenwidth / width_figma * 7),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          SizedBox(
                                            height: screenheight /
                                                height_figma *
                                                14,
                                          ),
                                          Text(
                                            items[index].operation.toString(),
                                            style: TextStyle(
                                              fontWeight: FontWeight.w700,
                                              fontSize: 16,
                                              color: fontcolor,
                                            ),
                                          ),
                                          SizedBox(
                                            height:
                                                screenheight / height_figma * 9,
                                          ),
                                          Text(
                                            items[index].date.toString(),
                                            style: TextStyle(
                                                fontSize: 12,
                                                fontWeight: FontWeight.w500,
                                                color: fontcolor),
                                          ),
                                          SizedBox(
                                            height: screenheight / height_figma * 9,
                                          ),
                                          Text(
                                            "زیباجو:",
                                            style: TextStyle(
                                                fontSize: 12,
                                                fontWeight: FontWeight.w500,
                                                color: grayColorHome),
                                          ),
                                          SizedBox(
                                            height: screenheight / height_figma * 4,
                                          ),
                                          Text(
                                            items[index].zibajo.toString(),
                                            style: TextStyle(
                                                fontSize: 12,
                                                fontWeight: FontWeight.w500,
                                                color: fontcolor),
                                          ),
                                          SizedBox(
                                            height: screenheight / height_figma * 9,
                                          ),
                                          Text(
                                            "کلینیک:",
                                            style: TextStyle(
                                                fontSize: 12,
                                                fontWeight: FontWeight.w500,
                                                color: grayColorHome),
                                          ),
                                          SizedBox(
                                            height: screenheight / height_figma * 4,
                                          ),
                                          Text(
                                            items[index].clinic.toString(),
                                            style: TextStyle(
                                                fontSize: 12,
                                                fontWeight: FontWeight.w500,
                                                color: fontcolor),
                                          ),
                                          SizedBox(
                                            height: screenheight / height_figma * 9,
                                          ),
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            children: [
                                              GestureDetector(
                                                onTap: (){

                                                },
                                                child: Container(
                                                  width:  screenwidth / width_figma * 61,
                                                  height: screenheight / height_figma * 27,
                                                  decoration: BoxDecoration(
                                                    borderRadius: BorderRadius.circular(48),
                                                      gradient: LinearGradient(begin: Alignment.topRight, end: Alignment.bottomLeft, colors: [
                                                        floatingActionColor,
                                                        techaccept
                                                      ]),
                                                  ),
                                                  child: Center(
                                                    child: Text("قبول نوبت", style: TextStyle(
                                                      fontWeight: FontWeight.w800,
                                                      fontSize: 8,
                                                      color: Colors.white
                                                    ),),
                                                  ),
                                                ),
                                              ),
                                              SizedBox(
                                                width: screenwidth / width_figma * 30,
                                              ),
                                              Text("رد نوبت", style: TextStyle(
                                                fontSize: 8,
                                                fontWeight: FontWeight.w800,
                                                color: germeztiz
                                              ),)
                                            ]
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              });
                        } else {
                          return Center(
                            child: CircularProgressIndicator(),
                          );
                        }
                      }),
                ),
              ),
              SizedBox(
                height: screenheight / height_figma * 34,
              ),
              Padding(
                padding: EdgeInsets.only(
                  right: screenwidth / width_figma * 11,
                ),
                child: Container(
                  width: screenwidth,
                  child: Text(
                    "نوبت های من",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w700,
                      color: fontcolor,
                    ),
                  ),
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
