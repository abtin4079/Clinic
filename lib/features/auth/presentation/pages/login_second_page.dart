import 'dart:async';
import 'package:clinic/features/auth/controller/login_controller.dart';
import 'package:clinic/features/auth/presentation/pages/login_first_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:clinic/themes/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pinput/pinput.dart';

class LoginSecondPage extends StatefulWidget {
  const LoginSecondPage({Key? key}) : super(key: key);

  @override
  State<LoginSecondPage> createState() => _LoginSecondPageState();
}

class _LoginSecondPageState extends State<LoginSecondPage> {
  bool ispressed = true;
  int _counter = 10;
  late Timer _timer;

  void startTimer() {
    _counter = 10;
    _timer = Timer.periodic(
      Duration(seconds: 1),
      (timer) {
        if (_counter > 0) {
          setState(() {
            _counter--;
          });
        } else {
          setState(() {
            ispressed = !ispressed;
          });
          _timer.cancel();
        }
      },
    );
  }

  final LoginController loginController = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    var data = Get.arguments;
    String userOtp = '';
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
                      margin: EdgeInsets.only(
                        right: screenwidth / width_figma * 20,
                        top: screenheight / height_figma * 199,
                      ),
                      child: const Text(
                        "ورود رمز یکبار مصرف",
                        style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.w700,
                            color: fontcolor),
                      ),
                    ),
                    Center(
                      child: Container(
                        margin: EdgeInsets.only(
                          top: screenheight / height_figma * 265,
                        ),
                        child: const Text(
                          "رمز یکبار مصرف ارسال شده را وارد کنید",
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 16,
                              color: fontcolor),
                        ),
                      ),
                    ),
                    Center(
                      child: Container(
                        margin: EdgeInsets.only(
                          top: screenheight / height_figma * 319,
                        ),
                        child: Pinput(
                          length: 5,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          controller: loginController.otpcontroller,
                          defaultPinTheme: PinTheme(
                            height: 48,
                            width: 48,
                            textStyle: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w700,
                                color: fontcolor),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(4),
                              border: Border.all(
                                color: PinputColor,
                                width: 2,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          userOtp = loginController.otpcontroller.text;
                          print(userOtp);

                          loginController.loginwithphone(data);
                        });
                      },
                      child: Container(
                        margin: EdgeInsets.only(
                            right: screenwidth / width_figma * 20,
                            top: screenheight / height_figma * 399),
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
                            "تایید رمز یکبار مصرف",
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w800,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(
                        right: screenwidth / width_figma * 20,
                        top: screenheight / height_figma * 463,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          !ispressed ? Text("$_counter") : Container(),
                          SizedBox(
                            width: screenwidth / width_figma * 5,
                          ),
                          ispressed
                              ? TextButton(
                                  //  style: TextButton.styleFrom(
                                  //    padding: EdgeInsets.zero,
                                  // ),
                                  onPressed: () {
                                    startTimer();
                                    setState(() {
                                      ispressed = !ispressed;
                                    });
                                  },
                                  child: Row(
                                    // mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Text(
                                        "! ارسال مجدد کد تایید",
                                        style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w700,
                                          color: SendagainColorblue,
                                        ),
                                      ),
                                      Container(
                                        width: 15,
                                        height: 15,
                                        child: ClipRRect(
                                          child: Image.asset(
                                            "lib/features/auth/presentation/images/refresh-blue.png",
                                            fit: BoxFit.fill,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ))
                              : Row(
                                  // mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Text(
                                      "! ارسال مجدد کد تایید",
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w700,
                                        color: SendagainColorwhite,
                                      ),
                                    ),
                                    Container(
                                      width: 15,
                                      height: 15,
                                      child: ClipRRect(
                                        child: Image.asset(
                                          "lib/features/auth/presentation/images/refresh-white.png",
                                          fit: BoxFit.fill,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
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
