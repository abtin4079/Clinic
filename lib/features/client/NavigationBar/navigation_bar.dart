import 'package:clinic/features/client/Notifications/presentation/pages/notification.dart';
import 'package:clinic/features/client/Turn%20ratings/New_Client/presentation/pages/new_client_page_1.dart';
import 'package:clinic/themes/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';
import '../Home/presentation/pages/home.dart';
import '../Setting/presentation/pages/setting.dart';
import '../Technicians/presentation/pages/tech1.dart';
import 'Icons/navigation_bar_icons.dart';

class ClientPage extends StatefulWidget {
  const ClientPage({Key? key}) : super(key: key);

  @override
  State<ClientPage> createState() => _ClientPageState();
}

class _ClientPageState extends State<ClientPage> {
  int currenttab = 0;
  List<Widget> screens = [
    Home(),
    Tech1(),
    Setting(),
    Notif(),
  ];

  final PageStorageBucket bucket = PageStorageBucket();
  Widget currentscreen = Setting();

  @override
  Widget build(BuildContext context) {
    final screenheight = MediaQuery.of(context).size.height;
    final height_figma = 926;
    final screenwidth = MediaQuery.of(context).size.width;
    final width_figma = 428;
    return Scaffold(
      body: PageStorage(
        child: currentscreen,
        bucket: bucket,
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.add,
          color: Colors.white,
          size: 40,
        ),
        backgroundColor: floatingActionColor,
        shape: CircleBorder(),
        onPressed: () {
          Get.to(NewClientPage1());
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        child: Container(
          height: screenheight / height_figma * 96,
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Row(
                 // crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    currenttab == 0 ? GestureDetector(
                      // Width: screenwidth / width_figma * 40,
                      onTap: () {
                        setState(() {
                          currentscreen = Setting();
                          currenttab = 0;
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
                              NavigationBarIcons.setting,
                              color: currenttab == 0 ? Colors.white : phonecolor,
                              size: 22,
                            ),
                          ),
                          GradientText(
                            "تنظیمات",
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
                    ):GestureDetector(
                     // minWidth: screenwidth / width_figma * 40,
                      onTap: () {
                        setState(() {
                          currentscreen = Setting();
                          currenttab = 0;
                        });
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: 36,
                            height: 36,
                            child: Icon(
                              NavigationBarIcons.setting,
                              color: currenttab == 0 ? Colors.blue : Colors.grey,
                            ),
                          ),
                          Text(
                            "تنظیمات",
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: currenttab == 0 ? Colors.blue : Colors.grey,
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      width: screenwidth / width_figma * 40,
                    ),

                    currenttab ==1 ?  GestureDetector(
                    //  minWidth: screenwidth / width_figma * 40,
                      onTap: () {
                        setState(() {
                          currentscreen = Notif();
                          currenttab = 1;
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
                              NavigationBarIcons.notif,
                              color: currenttab == 1 ? Colors.white : phonecolor,
                              size: 22,
                            ),
                          ),
                          GradientText(
                            "اعلانات",
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
                    ):GestureDetector(
                     // minWidth: screenwidth / width_figma * 40,
                      onTap: () {
                        setState(() {
                          currentscreen = Notif();
                          currenttab = 1;
                        });
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: 36,
                            height: 36,
                            child: Icon(
                              NavigationBarIcons.notif,
                              color: currenttab == 1 ? Colors.blue : Colors.grey,
                            ),
                          ),
                          Text(
                            "اعلانات",
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: currenttab == 1 ? Colors.blue : Colors.grey,
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      width: screenwidth / width_figma * 5,
                    ),
                  ],
                ),
                Container(
                  margin: EdgeInsets.only(top: screenheight / height_figma * 2),
                  child: Center(child: Text("ثبت نوبت ", style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 11,
                      color: nobatdehicolor
                  ),),),),
                Row(
                  children: [
                    currenttab == 2 ?  GestureDetector(
                     // minWidth: screenwidth / width_figma * 40,
                      onTap: () {
                        setState(() {
                          currentscreen = Tech1();
                          currenttab = 2;
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
                            "تکنسین ها",
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
                    ):GestureDetector(
                     // minWidth: screenwidth / width_figma * 40,
                      onTap: () {
                        setState(() {
                          currentscreen = Tech1();
                          currenttab = 2;
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
                            "تکنسین ها",
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: currenttab == 2 ? Colors.blue : Colors.grey,
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      width: screenwidth / width_figma * 40,
                    ),
                    currenttab == 3 ?  GestureDetector(
                     // minWidth: screenwidth / width_figma * 40,
                      onTap: () {
                        setState(() {
                          currentscreen = Home();
                          currenttab = 3;
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
                    ):GestureDetector(
                    //  minWidth: screenwidth / width_figma * 40,
                      onTap: () {
                        setState(() {
                          currentscreen = Home();
                          currenttab = 3;
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
