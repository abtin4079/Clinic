import 'package:clinic/features/auth/presentation/pages/login_first_page.dart';
import 'package:clinic/themes/colors.dart';
import 'package:flutter/material.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

import '../Home/presentation/pages/home.dart';
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
  ];

  final PageStorageBucket bucket = PageStorageBucket();
  Widget currentscreen = Home();

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
        onPressed: () {},
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        child: Container(
          height: screenheight / height_figma * 96,
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Row(
                //  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: screenwidth / width_figma * 15,
                    ),
                    currenttab == 0 ? MaterialButton(
                      minWidth: screenwidth / width_figma * 40,
                      onPressed: () {
                        setState(() {
                          currentscreen = Home();
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
                    ):MaterialButton(
                      minWidth: screenwidth / width_figma * 40,
                      onPressed: () {
                        setState(() {
                          currentscreen = Home();
                          currenttab = 0;
                        });
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            NavigationBarIcons.setting,
                            color: currenttab == 0 ? Colors.blue : Colors.grey,
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

                    currenttab ==1 ?  MaterialButton(
                      minWidth: screenwidth / width_figma * 40,
                      onPressed: () {
                        setState(() {
                          currentscreen = Home();
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
                    ):MaterialButton(
                      minWidth: screenwidth / width_figma * 40,
                      onPressed: () {
                        setState(() {
                          currentscreen = Home();
                          currenttab = 1;
                        });
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            NavigationBarIcons.notif,
                            color: currenttab == 1 ? Colors.blue : Colors.grey,
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


                  ],
                ),
                Container(
                  margin: EdgeInsets.only(top: screenheight / height_figma * 7),
                  child: Center(child: Text("ثبت نوبت ", style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 14,
                    color: nobatdehicolor
                  ),),),),
                Row(
                  children: [
                    currenttab == 2 ?  MaterialButton(
                      minWidth: screenwidth / width_figma * 40,
                      onPressed: () {
                        setState(() {
                          currentscreen = Home();
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
                    ):MaterialButton(
                      minWidth: screenwidth / width_figma * 40,
                      onPressed: () {
                        setState(() {
                          currentscreen = Home();
                          currenttab = 2;
                        });
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            NavigationBarIcons.tech,
                            color: currenttab == 2 ? Colors.blue : Colors.grey,
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
                    currenttab == 3 ?  MaterialButton(
                      minWidth: screenwidth / width_figma * 40,
                      onPressed: () {
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
                    ):MaterialButton(
                      minWidth: screenwidth / width_figma * 40,
                      onPressed: () {
                        setState(() {
                          currentscreen = Home();
                          currenttab = 3;
                        });
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            NavigationBarIcons.khane,
                            color: currenttab == 3 ? Colors.blue : Colors.grey,
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
                    SizedBox(
                      width: screenwidth / width_figma * 15,
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
