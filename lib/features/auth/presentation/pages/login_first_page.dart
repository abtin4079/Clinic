import 'package:clinic/features/auth/presentation/pages/login_second_page.dart';
import 'package:clinic/themes/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

class LoginFirstPage extends StatefulWidget {
  const LoginFirstPage({Key? key}) : super(key: key);

  @override
  State<LoginFirstPage> createState() => _LoginFirstPageState();
}

class _LoginFirstPageState extends State<LoginFirstPage> {
  @override
  Widget build(BuildContext context) {
    final numbercontroller = TextEditingController();
    final screenheight = MediaQuery.of(context).size.height;
    final height_figma = 926;
    final screenwidth = MediaQuery.of(context).size.width;
    final width_figma = 428;
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.centerRight,
          end: Alignment.centerLeft,
          colors: [LightBlue, White],
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Container(
          width: double.maxFinite,
          height: double.maxFinite,
          child: SingleChildScrollView(
            reverse: true,
            child: Column(
              children: [
                SizedBox(
                  height: screenheight / height_figma * 61,
                ),
                Container(
                  width: 120,
                  height: 120,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(24),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(24),
                    child: Image.asset(
                      "lib/features/auth/presentation/images/a-neur.png",
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                SizedBox(
                  height: screenheight / height_figma * 62,
                ),
                Stack(
                  alignment: AlignmentDirectional.topEnd,
                  children: [
                    Container(
                      width: screenwidth,
                      height: screenheight / height_figma * 683,
                      decoration: BoxDecoration(
                        borderRadius:
                            BorderRadius.only(topLeft: Radius.circular(100)),
                        color: Colors.white,
                      ),
                    ),
                    Container(
                      child: Text(
                        "ورود",
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w700,
                          color: fontcolor,
                        ),
                      ),
                      margin: EdgeInsets.only(
                          right: screenwidth / width_figma * 24,
                          top: screenheight / height_figma * 205),
                    ),
                    Container(
                      margin: EdgeInsets.only(
                          right: screenwidth / width_figma * 24,
                          top: screenheight / height_figma * 271),
                      child: const Text(
                        "شماره تلفن خود را وارد کنید",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: fontcolor,
                        ),
                      ),
                    ),
                    Container(
                        margin: EdgeInsets.only(
                            right: screenwidth / width_figma * 24,
                            top: screenheight / height_figma * 300),
                        width: screenwidth / width_figma * 380,
                        height: screenheight / height_figma * 48,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(48),
                          color: Colors.white,
                        ),
                        child: TextField(
                          textAlign: TextAlign.right,
                          controller: numbercontroller,
                          decoration: InputDecoration(
                            hintText: '0917.......',
                            hintStyle: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 14,
                              color: phonecolor,
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.black),
                              borderRadius: BorderRadius.circular(48),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: outlineborder, width: 2),
                              borderRadius: BorderRadius.circular(48),
                            ),
                            border: OutlineInputBorder(),
                          ),
                          keyboardType: TextInputType.phone,
                        )),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          Get.to(() => LoginSecondPage());
                        });
                      },
                      child: Container(
                        margin: EdgeInsets.only(
                            right: screenwidth / width_figma * 24,
                            top: screenheight / height_figma * 377),
                        width: screenwidth / width_figma * 380,
                        height: screenheight / height_figma * 48,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(48),
                          gradient: LinearGradient(
                            begin: Alignment.topRight,
                            end: Alignment.bottomLeft,
                            colors: [LightBlue, White],
                          ),
                        ),
                        child: const Center(
                          child: Text(
                            "دریافت رمز یکبار مصرف",
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w800,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          margin: EdgeInsets.only(
                              top: screenheight / height_figma * 457),
                          child: const Text(
                            "را میپذیرم",
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: fontcolor,
                            ),
                          ),
                        ),
                        Container(
                            margin: EdgeInsets.only(
                                top: screenheight / height_figma * 457),
                            child: TextButton(
                              style: TextButton.styleFrom(
                                padding: EdgeInsets.zero,
                              ),
                              onPressed: () {},
                              child: GradientText("شرایط و قوانین",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w700,
                                    fontSize: 14,
                                  ),
                                  colors: [
                                    rediligal,
                                    whiteiligal,
                                    rediligal,
                                  ]),
                            )),
                        Padding(
                          padding: EdgeInsets.only(
                              right: screenwidth / width_figma * 24,
                              top: screenheight / height_figma * 457.0),
                          child: const Text(
                            "با ورود/ثبت نام",
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: fontcolor,
                            ),
                          ),
                        ),
                      ],
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
