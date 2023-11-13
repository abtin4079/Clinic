import 'package:clinic/features/client/Technicians/Controller/get_tech_controller.dart';
import 'package:clinic/features/client/Technicians/Controller/search_tech_controller.dart';
import 'package:clinic/features/client/Technicians/presentation/pages/add_tech.dart';
import 'package:clinic/features/client/Technicians/presentation/pages/tech_profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../../../../../themes/colors.dart';
import '../../../NavigationBar/Icons/navigation_bar_icons.dart';
import '../domain/entity.dart';

class Tech1 extends StatefulWidget {
  const Tech1({Key? key}) : super(key: key);

  @override
  State<Tech1> createState() => _Tech1State();
}

class _Tech1State extends State<Tech1> {
  final SearchTechController searchTechController =
      Get.put(SearchTechController());
  final GetTechController getTechController = Get.put(GetTechController());
  late bool _isloading;

  @override
  void initState() {
    // Call super.initState() first.
    _isloading = true;
    Future.delayed(const Duration(seconds: 4), () {
      setState(() {
        _isloading = false;
      });
    });
    super.initState();
    getTechController.fetchTech();
    // Your one-time initialization code for the root widget goes here.
    // This code will run when the app is first launched.
  }

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
          "تکنسین ها",
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w700,
            color: fontcolor,
          ),
        ),
      ),
      body: SingleChildScrollView(
        reverse: false,
        scrollDirection: Axis.vertical,
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
                controller: searchTechController.searchController,
                textAlign: TextAlign.right,
                onSubmitted: (value) => searchTechController.fetchPatient(),
                decoration: InputDecoration(
                  suffixIcon: IconButton(
                    icon: Icon(
                      Search.search,
                      size: 24,
                      color: phonecolor,
                    ),
                    onPressed: () => searchTechController.fetchPatient(),
                  ),
                  hintText: "جستجو در بین تکنسین ها",
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
            _isloading == false
                ? FutureBuilder(
                    future: getTechController.fetchTech(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Center(child: CircularProgressIndicator());
                      } else if (snapshot.hasError) {
                        return Center(child: Text('Error: ${snapshot.error}'));
                      } else {
                        return Obx(() {
                          return ListView.builder(
                              scrollDirection: Axis.vertical,
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),
                              itemCount: getTechController.get_tech_list.length,
                              itemBuilder: (context, index) {
                                return GestureDetector(
                                  onTap: () {
                                    Get.to(TechProfile());
                                  },
                                  child: Padding(
                                    padding: EdgeInsets.only(
                                      top: 10,
                                      bottom: 10,
                                      right: screenwidth / width_figma * 19,
                                      left: screenwidth / width_figma * 19,
                                    ),
                                    child: Directionality(
                                      textDirection: TextDirection.rtl,
                                      child: Container(
                                        width: screenwidth / width_figma * 396,
                                        height: 126,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(16),
                                            color: Colors.white),
                                        child: Padding(
                                          padding: EdgeInsets.only(
                                            top: screenheight /
                                                height_figma *
                                                13,
                                            bottom: screenheight /
                                                height_figma *
                                                13,
                                            right:
                                                screenwidth / width_figma * 16,
                                          ),
                                          child: Row(
                                            children: [
                                              Container(
                                                width: 100,
                                                height: 100,
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            100),
                                                    color: Colors.red),
                                              ),
                                              SizedBox(
                                                width: screenwidth /
                                                    width_figma *
                                                    10,
                                              ),
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Container(
                                                    width: 100,
                                                    child: Text(
                                                      getTechController
                                                          .get_tech_list[index]
                                                          .fullName
                                                          .toString(),
                                                      style: TextStyle(
                                                        fontSize: 14,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        color: fontcolor,
                                                      ),
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    height: 16,
                                                  ),
                                                  Text(
                                                    "شماره تماس:",
                                                    style: TextStyle(
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      color: grayColorHome,
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    height: 16,
                                                  ),
                                                  Text(
                                                    "کد ملی:",
                                                    style: TextStyle(
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      color: grayColorHome,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Directionality(
                                                textDirection:
                                                    TextDirection.ltr,
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    SizedBox(
                                                      height: 35,
                                                    ),
                                                    Text(
                                                      getTechController
                                                          .get_tech_list[index]
                                                          .phoneNumber
                                                          .toString(),
                                                      style: TextStyle(
                                                        fontSize: 14,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        color: fontcolor,
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      height: 16,
                                                    ),
                                                    Text(
                                                      getTechController
                                                          .get_tech_list[index]
                                                          .nationalCode
                                                          .toString(),
                                                      style: TextStyle(
                                                        fontSize: 14,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        color: fontcolor,
                                                      ),
                                                    ),
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
                              });
                        });
                      }
                    })
                : const Center(
                    child: CircularProgressIndicator(
                      color: LightBlue,
                    ),
                  ),
            SizedBox(
              height: screenheight / height_figma * 15,
            ),
            GestureDetector(
              onTap: () {
                Get.to(AddTech());
              },
              child: Center(
                child: Container(
                  height: 50,
                  width: screenwidth / width_figma * 364,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(48),
                    gradient: LinearGradient(
                        begin: Alignment.topRight,
                        end: Alignment.bottomLeft,
                        colors: [rediligal, whiteiligal]),
                  ),
                  child: Center(
                    child: Text(
                      "افزودن تکنسین جدید",
                      style: TextStyle(
                          fontWeight: FontWeight.w800,
                          fontSize: 14,
                          color: Colors.white),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: screenheight / height_figma * 15,
            ),
          ],
        ),
      ),
    );
  }
}
