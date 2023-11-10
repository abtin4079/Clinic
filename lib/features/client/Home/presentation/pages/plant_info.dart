import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../../../../../themes/colors.dart';

class PlantInfo extends StatefulWidget {
  const PlantInfo({Key? key}) : super(key: key);

  @override
  State<PlantInfo> createState() => _PlantInfoState();
}

class _PlantInfoState extends State<PlantInfo> {
  TextEditingController tarcontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final screenheight = MediaQuery.of(context).size.height;
    final height_figma = 926;
    final screenwidth = MediaQuery.of(context).size.width;
    final width_figma = 428;

    var items = Get.arguments;

    return Scaffold(
      backgroundColor: backgroundHome,
      appBar: AppBar(
        automaticallyImplyLeading: true,

        backgroundColor: backgroundHome,
        title: const Text(
          "اطلاعات کاشت",
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w700,
            color: fontcolor,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(screenheight / screenwidth * 10),
          child: Center(
            child: Container(
              width: screenwidth / width_figma * 396,
              //  height: screenheight / height_figma * 950,
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(16)),
              child: items[2] == "Expectation"
                  ? Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: screenheight / screenwidth * 16,
                        ),
                        Center(
                          child: Image.asset(
                              "lib/features/client/Home/presentation/images/gol_squre.png"),
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
                        Center(
                          child: Container(
                            margin: EdgeInsets.only(
                              top: screenheight / height_figma * 8,
                            ),
                            width: screenwidth / width_figma * 100,
                            height: 24,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(16),
                                color: processColor),
                            child: Center(
                              child: Text(
                                "در انتظار تایید",
                                style: TextStyle(
                                  fontWeight: FontWeight.w800,
                                  fontSize: 14,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: screenheight / height_figma * 16,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(
                                left: screenwidth / width_figma * 59,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  SizedBox(
                                    height: screenheight / height_figma * 33,
                                  ),
                                  Text(
                                    ":شماره تماس",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 14,
                                        color: grayColorHome),
                                  ),
                                  Text(
                                    "099999999900",
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500,
                                        color: fontcolor),
                                  ),
                                  SizedBox(
                                    height: screenheight / height_figma * 66,
                                  ),
                                  Text(
                                    ":تعداد تار مو",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 14,
                                        color: grayColorHome),
                                  ),
                                  Text(
                                    items[3].toString(),
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500,
                                        color: fontcolor),
                                  ),
                                  SizedBox(
                                    height: screenheight / height_figma * 16,
                                  ),
                                  Text(
                                    ":تاریخ نوبت",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 14,
                                        color: grayColorHome),
                                  ),
                                  Text(
                                    "دوشنبه 12 آذر ساعت 17",
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500,
                                        color: fontcolor),
                                  ),
                                  SizedBox(
                                    height: screenheight / height_figma * 16,
                                  ),
                                  Text(
                                    ":تاریخ اتمام کاشت",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 14,
                                        color: grayColorHome),
                                  ),
                                  Text(
                                    "دوشنبه 12 آذر ساعت 19",
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500,
                                        color: fontcolor),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              width: screenwidth / width_figma * 40,
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                right: screenwidth / width_figma * 10,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Text(
                                        "اطلاعات زیباجو",
                                        style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w700,
                                            color: phonecolor),
                                      ),
                                      Image.asset(
                                          "lib/features/client/Home/presentation/images/information-line.png")
                                    ],
                                  ),
                                  SizedBox(
                                    height: screenheight / height_figma * 10,
                                  ),
                                  Text(
                                    ":زیباجو",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 14,
                                        color: grayColorHome),
                                  ),
                                  Text(
                                    items[1],
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500,
                                        color: fontcolor),
                                  ),
                                  SizedBox(
                                    height: screenheight / height_figma * 32,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Text(
                                        "اطلاعات کاشت",
                                        style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w700,
                                            color: phonecolor),
                                      ),
                                      Image.asset(
                                          "lib/features/client/Home/presentation/images/information-line.png")
                                    ],
                                  ),
                                  SizedBox(
                                    height: screenheight / height_figma * 12,
                                  ),
                                  Text(
                                    ":عملیات مورد نیاز",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 14,
                                        color: grayColorHome),
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
                                    ":تکنسین",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 14,
                                        color: grayColorHome),
                                  ),
                                  Text(
                                    items[0],
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500,
                                        color: fontcolor),
                                  ),
                                  SizedBox(
                                    height: screenheight / height_figma * 16,
                                  ),
                                  Text(
                                    ":تاریخ شروع کاشت",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 14,
                                        color: grayColorHome),
                                  ),
                                  Text(
                                    "دوشنبه 12 آذر ساعت 18",
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500,
                                        color: fontcolor),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            right: screenwidth / width_figma * 10,
                            top: screenheight / height_figma * 32,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                "عکس های کاشت",
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w700,
                                    color: phonecolor),
                              ),
                              Image.asset(
                                  "lib/features/client/Home/presentation/images/information-line.png")
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            right: screenwidth / width_figma * 71,
                            top: screenheight / height_figma * 16,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                ":قبل از کاشت مو",
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  color: fontcolor,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: screenheight / height_figma * 15,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              width: screenwidth / width_figma * 80,
                              height: screenwidth / width_figma * 80,
                              decoration: BoxDecoration(
                                color: Colors.grey,
                                borderRadius: BorderRadius.circular(16),
                              ),
                            ),
                            SizedBox(
                              width: screenwidth / width_figma * 8,
                            ),
                            Container(
                              width: screenwidth / width_figma * 80,
                              height: screenwidth / width_figma * 80,
                              decoration: BoxDecoration(
                                color: Colors.grey,
                                borderRadius: BorderRadius.circular(16),
                              ),
                            ),
                            SizedBox(
                              width: screenwidth / width_figma * 8,
                            ),
                            Container(
                              width: screenwidth / width_figma * 80,
                              height: screenwidth / width_figma * 80,
                              decoration: BoxDecoration(
                                color: Colors.grey,
                                borderRadius: BorderRadius.circular(16),
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            right: screenwidth / width_figma * 71,
                            top: screenheight / height_figma * 16,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                ":بعد از کاشت مو",
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  color: fontcolor,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: screenheight / height_figma * 15,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              width: screenwidth / width_figma * 80,
                              height: screenwidth / width_figma * 80,
                              decoration: BoxDecoration(
                                color: Colors.grey,
                                borderRadius: BorderRadius.circular(16),
                              ),
                            ),
                            SizedBox(
                              width: screenwidth / width_figma * 8,
                            ),
                            Container(
                              width: screenwidth / width_figma * 80,
                              height: screenwidth / width_figma * 80,
                              decoration: BoxDecoration(
                                color: Colors.grey,
                                borderRadius: BorderRadius.circular(16),
                              ),
                            ),
                            SizedBox(
                              width: screenwidth / width_figma * 8,
                            ),
                            Container(
                              width: screenwidth / width_figma * 80,
                              height: screenwidth / width_figma * 80,
                              decoration: BoxDecoration(
                                color: Colors.grey,
                                borderRadius: BorderRadius.circular(16),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          width: screenwidth / width_figma * 32,
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            right: screenwidth / width_figma * 10,
                            top: screenheight / height_figma * 32,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                "توضیحات",
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w700,
                                    color: phonecolor),
                              ),
                              Image.asset(
                                  "lib/features/client/Home/presentation/images/information-line.png")
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            right: screenwidth / width_figma * 10,
                            top: screenheight / height_figma * 8,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                "",
                                style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 14,
                                    color: fontcolor),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            top: screenheight / height_figma * 16,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  showDialog(
                                    context: context,
                                    builder: (context) => Dialog(
                                      child: Container(
                                        width: screenwidth / width_figma * 356,
                                        height:
                                            screenheight / height_figma * 265,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(28),
                                          color: Colors.white,
                                        ),
                                        child: Column(
                                          children: [
                                            SizedBox(
                                              height: screenheight /
                                                  height_figma *
                                                  41,
                                            ),
                                            Text(
                                              "تغییر تعداد تار موهای ثبت شده",
                                              style: TextStyle(
                                                color: fontcolor,
                                                fontSize: 16,
                                                fontWeight: FontWeight.w700,
                                              ),
                                            ),
                                            SizedBox(
                                              height: screenheight /
                                                  height_figma *
                                                  33,
                                            ),
                                            Container(
                                                width: screenwidth /
                                                    width_figma *
                                                    170,
                                                height: screenheight /
                                                    height_figma *
                                                    48,
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(32),
                                                  color: backgroundHome,
                                                ),
                                                child: TextField(
                                                  controller: tarcontroller,
                                                  textAlign: TextAlign.center,
                                                  decoration: InputDecoration(
                                                    hintText: 'تعداد تار مو',
                                                    hintStyle: TextStyle(
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontSize: 14,
                                                      color: phonecolor,
                                                    ),
                                                    focusedBorder:
                                                        OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                          color: Colors.black),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              48),
                                                    ),
                                                    enabledBorder:
                                                        OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                          color: outlineborder,
                                                          width: 2),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              32),
                                                    ),
                                                    border:
                                                        OutlineInputBorder(),
                                                  ),
                                                  keyboardType:
                                                      TextInputType.number,
                                                )),
                                            SizedBox(
                                              height: screenheight /
                                                  height_figma *
                                                  55,
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                GestureDetector(
                                                  onTap: () {
                                                    Get.back(result: false);
                                                  },
                                                  child: Container(
                                                    height: screenheight /
                                                        height_figma *
                                                        36,
                                                    width: screenwidth /
                                                        width_figma *
                                                        100,
                                                    decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(48),
                                                        gradient:
                                                            LinearGradient(
                                                                begin: Alignment
                                                                    .topRight,
                                                                end: Alignment
                                                                    .bottomLeft,
                                                                colors: [
                                                              rediligal,
                                                              whiteiligal
                                                            ])),
                                                    child: Center(
                                                      child: Text(
                                                        "انصراف",
                                                        style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.w700,
                                                          fontSize: 14,
                                                          color: Colors.white,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: screenwidth /
                                                      width_figma *
                                                      8,
                                                ),
                                                GestureDetector(
                                                  onTap: () {
                                                    setState(() {});
                                                  },
                                                  child: Container(
                                                    height: screenheight /
                                                        height_figma *
                                                        36,
                                                    width: screenwidth /
                                                        width_figma *
                                                        100,
                                                    decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(48),
                                                        gradient:
                                                            LinearGradient(
                                                                begin: Alignment
                                                                    .topRight,
                                                                end: Alignment
                                                                    .bottomLeft,
                                                                colors: [
                                                              LightBlue,
                                                              White
                                                            ])),
                                                    child: Center(
                                                      child: Text(
                                                        "تایید",
                                                        style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.w700,
                                                          fontSize: 14,
                                                          color: Colors.white,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  );
                                },
                                child: Container(
                                  width: screenwidth / width_figma * 120,
                                  height: 48,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.all(
                                      color: rediligal,
                                      width: 2,
                                    ),
                                  ),
                                  child: Center(
                                    child: Text(
                                      "تغییر تعداد تار مو",
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500,
                                        color: rediligal,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: screenwidth / width_figma * 14,
                              ),
                              GestureDetector(
                                onTap: () {
                                  showDialog(
                                    context: context,
                                    builder: (context) => Dialog(
                                      child: Container(
                                        width: screenwidth / width_figma * 356,
                                        height:
                                            screenheight / height_figma * 170,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(28),
                                          color: Colors.white,
                                        ),
                                        child: Column(
                                          children: [
                                            SizedBox(
                                              height: screenheight /
                                                  height_figma *
                                                  41,
                                            ),
                                            Text(
                                              "آیا از تایید اطلاعات کاشت مطمعن هستید؟",
                                              style: TextStyle(
                                                color: fontcolor,
                                                fontSize: 16,
                                                fontWeight: FontWeight.w700,
                                              ),
                                            ),
                                            SizedBox(
                                              height: screenheight /
                                                  height_figma *
                                                  39,
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                GestureDetector(
                                                  onTap: () {
                                                    Get.back(result: false);
                                                  },
                                                  child: Container(
                                                    height: screenheight /
                                                        height_figma *
                                                        36,
                                                    width: screenwidth /
                                                        width_figma *
                                                        100,
                                                    decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(48),
                                                        gradient:
                                                            LinearGradient(
                                                                begin: Alignment
                                                                    .topRight,
                                                                end: Alignment
                                                                    .bottomLeft,
                                                                colors: [
                                                              rediligal,
                                                              whiteiligal
                                                            ])),
                                                    child: Center(
                                                      child: Text(
                                                        "انصراف",
                                                        style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.w700,
                                                          fontSize: 14,
                                                          color: Colors.white,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: screenwidth /
                                                      width_figma *
                                                      8,
                                                ),
                                                GestureDetector(
                                                  onTap: () {
                                                    Get.back(result: true);
                                                  },
                                                  child: Container(
                                                    height: screenheight /
                                                        height_figma *
                                                        36,
                                                    width: screenwidth /
                                                        width_figma *
                                                        100,
                                                    decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(48),
                                                        gradient:
                                                            LinearGradient(
                                                                begin: Alignment
                                                                    .topRight,
                                                                end: Alignment
                                                                    .bottomLeft,
                                                                colors: [
                                                              LightBlue,
                                                              White
                                                            ])),
                                                    child: Center(
                                                      child: Text(
                                                        "تایید",
                                                        style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.w700,
                                                          fontSize: 14,
                                                          color: Colors.white,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  );
                                },
                                child: Container(
                                  width: screenwidth / width_figma * 120,
                                  height: 48,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: LightBlue),
                                  child: Center(
                                    child: Text(
                                      "تایید اطلاعات کاشت",
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500,
                                        color: lightwhite,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: screenheight / height_figma * 15,
                        ),
                      ],
                    )
                  : items[2] == "completed"
                      ? Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: screenheight / screenwidth * 16,
                            ),
                            Center(
                              child: Image.asset(
                                  "lib/features/client/Home/presentation/images/gol_squre.png"),
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
                            Center(
                              child: Container(
                                margin: EdgeInsets.only(
                                  top: screenheight / height_figma * 8,
                                ),
                                width: screenwidth / width_figma * 100,
                                height: 24,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(16),
                                    color: floatingActionColor),
                                child: Center(
                                  child: Text(
                                    "تایید شده",
                                    style: TextStyle(
                                      fontWeight: FontWeight.w800,
                                      fontSize: 14,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: screenheight / height_figma * 16,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(
                                    left: screenwidth / width_figma * 59,
                                  ),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      SizedBox(
                                        height:
                                            screenheight / height_figma * 33,
                                      ),
                                      Text(
                                        ":شماره تماس",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 14,
                                            color: grayColorHome),
                                      ),
                                      Text(
                                        "099999999900",
                                        style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w500,
                                            color: fontcolor),
                                      ),
                                      SizedBox(
                                        height:
                                            screenheight / height_figma * 66,
                                      ),
                                      Text(
                                        ":تعداد تار مو",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 14,
                                            color: grayColorHome),
                                      ),
                                      Text(
                                        items[3].toString(),
                                        style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w500,
                                            color: fontcolor),
                                      ),
                                      SizedBox(
                                        height:
                                            screenheight / height_figma * 16,
                                      ),
                                      Text(
                                        ":تاریخ نوبت",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 14,
                                            color: grayColorHome),
                                      ),
                                      Text(
                                        "دوشنبه 12 آذر ساعت 17",
                                        style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w500,
                                            color: fontcolor),
                                      ),
                                      SizedBox(
                                        height:
                                            screenheight / height_figma * 16,
                                      ),
                                      Text(
                                        ":تاریخ اتمام کاشت",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 14,
                                            color: grayColorHome),
                                      ),
                                      Text(
                                        "دوشنبه 12 آذر ساعت 19",
                                        style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w500,
                                            color: fontcolor),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  width: screenwidth / width_figma * 40,
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                    right: screenwidth / width_figma * 10,
                                  ),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          Text(
                                            "اطلاعات زیباجو",
                                            style: TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w700,
                                                color: phonecolor),
                                          ),
                                          Image.asset(
                                              "lib/features/client/Home/presentation/images/information-line.png")
                                        ],
                                      ),
                                      SizedBox(
                                        height:
                                            screenheight / height_figma * 10,
                                      ),
                                      Text(
                                        ":زیباجو",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 14,
                                            color: grayColorHome),
                                      ),
                                      Text(
                                        items[1],
                                        style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w500,
                                            color: fontcolor),
                                      ),
                                      SizedBox(
                                        height:
                                            screenheight / height_figma * 32,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          Text(
                                            "اطلاعات کاشت",
                                            style: TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w700,
                                                color: phonecolor),
                                          ),
                                          Image.asset(
                                              "lib/features/client/Home/presentation/images/information-line.png")
                                        ],
                                      ),
                                      SizedBox(
                                        height:
                                            screenheight / height_figma * 12,
                                      ),
                                      Text(
                                        ":عملیات مورد نیاز",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 14,
                                            color: grayColorHome),
                                      ),
                                      Text(
                                        "کاشت مو",
                                        style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w500,
                                            color: fontcolor),
                                      ),
                                      SizedBox(
                                        height:
                                            screenheight / height_figma * 16,
                                      ),
                                      Text(
                                        ":تکنسین",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 14,
                                            color: grayColorHome),
                                      ),
                                      Text(
                                        items[0],
                                        style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w500,
                                            color: fontcolor),
                                      ),
                                      SizedBox(
                                        height:
                                            screenheight / height_figma * 16,
                                      ),
                                      Text(
                                        ":تاریخ شروع کاشت",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 14,
                                            color: grayColorHome),
                                      ),
                                      Text(
                                        "دوشنبه 12 آذر ساعت 18",
                                        style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w500,
                                            color: fontcolor),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                right: screenwidth / width_figma * 10,
                                top: screenheight / height_figma * 32,
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Text(
                                    "عکس های کاشت",
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w700,
                                        color: phonecolor),
                                  ),
                                  Image.asset(
                                      "lib/features/client/Home/presentation/images/information-line.png")
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                right: screenwidth / width_figma * 71,
                                top: screenheight / height_figma * 16,
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Text(
                                    ":قبل از کاشت مو",
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                      color: fontcolor,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: screenheight / height_figma * 15,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  width: screenwidth / width_figma * 80,
                                  height: screenwidth / width_figma * 80,
                                  decoration: BoxDecoration(
                                    color: Colors.grey,
                                    borderRadius: BorderRadius.circular(16),
                                  ),
                                ),
                                SizedBox(
                                  width: screenwidth / width_figma * 8,
                                ),
                                Container(
                                  width: screenwidth / width_figma * 80,
                                  height: screenwidth / width_figma * 80,
                                  decoration: BoxDecoration(
                                    color: Colors.grey,
                                    borderRadius: BorderRadius.circular(16),
                                  ),
                                ),
                                SizedBox(
                                  width: screenwidth / width_figma * 8,
                                ),
                                Container(
                                  width: screenwidth / width_figma * 80,
                                  height: screenwidth / width_figma * 80,
                                  decoration: BoxDecoration(
                                    color: Colors.grey,
                                    borderRadius: BorderRadius.circular(16),
                                  ),
                                ),
                              ],
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                right: screenwidth / width_figma * 71,
                                top: screenheight / height_figma * 16,
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Text(
                                    ":بعد از کاشت مو",
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                      color: fontcolor,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: screenheight / height_figma * 15,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  width: screenwidth / width_figma * 80,
                                  height: screenwidth / width_figma * 80,
                                  decoration: BoxDecoration(
                                    color: Colors.grey,
                                    borderRadius: BorderRadius.circular(16),
                                  ),
                                ),
                                SizedBox(
                                  width: screenwidth / width_figma * 8,
                                ),
                                Container(
                                  width: screenwidth / width_figma * 80,
                                  height: screenwidth / width_figma * 80,
                                  decoration: BoxDecoration(
                                    color: Colors.grey,
                                    borderRadius: BorderRadius.circular(16),
                                  ),
                                ),
                                SizedBox(
                                  width: screenwidth / width_figma * 8,
                                ),
                                Container(
                                  width: screenwidth / width_figma * 80,
                                  height: screenwidth / width_figma * 80,
                                  decoration: BoxDecoration(
                                    color: Colors.grey,
                                    borderRadius: BorderRadius.circular(16),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              width: screenwidth / width_figma * 32,
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                right: screenwidth / width_figma * 10,
                                top: screenheight / height_figma * 32,
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Text(
                                    "توضیحات",
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w700,
                                        color: phonecolor),
                                  ),
                                  Image.asset(
                                      "lib/features/client/Home/presentation/images/information-line.png")
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                right: screenwidth / width_figma * 10,
                                top: screenheight / height_figma * 8,
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Text(
                                    "",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 14,
                                        color: fontcolor),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: screenheight / height_figma * 40,
                            ),
                          ],
                        )
                      : items[2] == "processing"
                          ? Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: screenheight / screenwidth * 16,
                                ),
                                Center(
                                  child: Image.asset(
                                      "lib/features/client/Home/presentation/images/gol_squre.png"),
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
                                Center(
                                  child: Container(
                                    margin: EdgeInsets.only(
                                      top: screenheight / height_figma * 8,
                                    ),
                                    width: screenwidth / width_figma * 100,
                                    height: 24,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(16),
                                        color: rediligal),
                                    child: Center(
                                      child: Text(
                                        "در حال انجام",
                                        style: TextStyle(
                                          fontWeight: FontWeight.w800,
                                          fontSize: 14,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: screenheight / height_figma * 16,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(
                                        left: screenwidth / width_figma * 59,
                                      ),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        children: [
                                          SizedBox(
                                            height: screenheight /
                                                height_figma *
                                                33,
                                          ),
                                          Text(
                                            ":شماره تماس",
                                            style: TextStyle(
                                                fontWeight: FontWeight.w500,
                                                fontSize: 14,
                                                color: grayColorHome),
                                          ),
                                          Text(
                                            "099999999900",
                                            style: TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w500,
                                                color: fontcolor),
                                          ),
                                          SizedBox(
                                            height: screenheight /
                                                height_figma *
                                                66,
                                          ),
                                          Text(
                                            ":تعداد تار مو",
                                            style: TextStyle(
                                                fontWeight: FontWeight.w500,
                                                fontSize: 14,
                                                color: grayColorHome),
                                          ),
                                          Text(
                                            items[3].toString(),
                                            style: TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w500,
                                                color: fontcolor),
                                          ),
                                          SizedBox(
                                            height: screenheight /
                                                height_figma *
                                                16,
                                          ),
                                          Text(
                                            ":تاریخ نوبت",
                                            style: TextStyle(
                                                fontWeight: FontWeight.w500,
                                                fontSize: 14,
                                                color: grayColorHome),
                                          ),
                                          Text(
                                            "دوشنبه 12 آذر ساعت 17",
                                            style: TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w500,
                                                color: fontcolor),
                                          ),
                                          SizedBox(
                                            height: screenheight /
                                                height_figma *
                                                16,
                                          ),
                                          Text(
                                            ":تاریخ اتمام کاشت",
                                            style: TextStyle(
                                                fontWeight: FontWeight.w500,
                                                fontSize: 14,
                                                color: grayColorHome),
                                          ),
                                          Text(
                                            "دوشنبه 12 آذر ساعت 19",
                                            style: TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w500,
                                                color: fontcolor),
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      width: screenwidth / width_figma * 40,
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(
                                        right: screenwidth / width_figma * 10,
                                      ),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            children: [
                                              Text(
                                                "اطلاعات زیباجو",
                                                style: TextStyle(
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.w700,
                                                    color: phonecolor),
                                              ),
                                              Image.asset(
                                                  "lib/features/client/Home/presentation/images/information-line.png")
                                            ],
                                          ),
                                          SizedBox(
                                            height: screenheight /
                                                height_figma *
                                                10,
                                          ),
                                          Text(
                                            ":زیباجو",
                                            style: TextStyle(
                                                fontWeight: FontWeight.w500,
                                                fontSize: 14,
                                                color: grayColorHome),
                                          ),
                                          Text(
                                            items[1],
                                            style: TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w500,
                                                color: fontcolor),
                                          ),
                                          SizedBox(
                                            height: screenheight /
                                                height_figma *
                                                32,
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            children: [
                                              Text(
                                                "اطلاعات کاشت",
                                                style: TextStyle(
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.w700,
                                                    color: phonecolor),
                                              ),
                                              Image.asset(
                                                  "lib/features/client/Home/presentation/images/information-line.png")
                                            ],
                                          ),
                                          SizedBox(
                                            height: screenheight /
                                                height_figma *
                                                12,
                                          ),
                                          Text(
                                            ":عملیات مورد نیاز",
                                            style: TextStyle(
                                                fontWeight: FontWeight.w500,
                                                fontSize: 14,
                                                color: grayColorHome),
                                          ),
                                          Text(
                                            "کاشت مو",
                                            style: TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w500,
                                                color: fontcolor),
                                          ),
                                          SizedBox(
                                            height: screenheight /
                                                height_figma *
                                                16,
                                          ),
                                          Text(
                                            ":تکنسین",
                                            style: TextStyle(
                                                fontWeight: FontWeight.w500,
                                                fontSize: 14,
                                                color: grayColorHome),
                                          ),
                                          Text(
                                            items[0],
                                            style: TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w500,
                                                color: fontcolor),
                                          ),
                                          SizedBox(
                                            height: screenheight /
                                                height_figma *
                                                16,
                                          ),
                                          Text(
                                            ":تاریخ شروع کاشت",
                                            style: TextStyle(
                                                fontWeight: FontWeight.w500,
                                                fontSize: 14,
                                                color: grayColorHome),
                                          ),
                                          Text(
                                            "دوشنبه 12 آذر ساعت 18",
                                            style: TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w500,
                                                color: fontcolor),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                    right: screenwidth / width_figma * 10,
                                    top: screenheight / height_figma * 32,
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Text(
                                        "عکس های کاشت",
                                        style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w700,
                                            color: phonecolor),
                                      ),
                                      Image.asset(
                                          "lib/features/client/Home/presentation/images/information-line.png")
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                    right: screenwidth / width_figma * 71,
                                    top: screenheight / height_figma * 16,
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Text(
                                        ":قبل از کاشت مو",
                                        style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500,
                                          color: fontcolor,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: screenheight / height_figma * 15,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      width: screenwidth / width_figma * 80,
                                      height: screenwidth / width_figma * 80,
                                      decoration: BoxDecoration(
                                        color: Colors.grey,
                                        borderRadius: BorderRadius.circular(16),
                                      ),
                                    ),
                                    SizedBox(
                                      width: screenwidth / width_figma * 8,
                                    ),
                                    Container(
                                      width: screenwidth / width_figma * 80,
                                      height: screenwidth / width_figma * 80,
                                      decoration: BoxDecoration(
                                        color: Colors.grey,
                                        borderRadius: BorderRadius.circular(16),
                                      ),
                                    ),
                                    SizedBox(
                                      width: screenwidth / width_figma * 8,
                                    ),
                                    Container(
                                      width: screenwidth / width_figma * 80,
                                      height: screenwidth / width_figma * 80,
                                      decoration: BoxDecoration(
                                        color: Colors.grey,
                                        borderRadius: BorderRadius.circular(16),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: screenheight / height_figma * 15,
                                ),
                              ],
                            )
                          : Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: screenheight / screenwidth * 16,
                                ),
                                Center(
                                  child: Image.asset(
                                      "lib/features/client/Home/presentation/images/gol_squre.png"),
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
                                Center(
                                  child: Container(
                                    margin: EdgeInsets.only(
                                      top: screenheight / height_figma * 8,
                                    ),
                                    width: screenwidth / width_figma * 100,
                                    height: 24,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(16),
                                        color: graycoloranjamnashode),
                                    child: Center(
                                      child: Text(
                                        "انجام نشده",
                                        style: TextStyle(
                                          fontWeight: FontWeight.w800,
                                          fontSize: 14,
                                          color: nobatdehicolor,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: screenheight / height_figma * 16,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(
                                        left: screenwidth / width_figma * 59,
                                      ),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        children: [
                                          SizedBox(
                                            height: screenheight /
                                                height_figma *
                                                33,
                                          ),
                                          Text(
                                            ":شماره تماس",
                                            style: TextStyle(
                                                fontWeight: FontWeight.w500,
                                                fontSize: 14,
                                                color: grayColorHome),
                                          ),
                                          Text(
                                            "099999999900",
                                            style: TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w500,
                                                color: fontcolor),
                                          ),
                                          SizedBox(
                                            height: screenheight /
                                                height_figma *
                                                66,
                                          ),
                                          Text(
                                            ":تعداد تار مو",
                                            style: TextStyle(
                                                fontWeight: FontWeight.w500,
                                                fontSize: 14,
                                                color: grayColorHome),
                                          ),
                                          Text(
                                            items[3].toString(),
                                            style: TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w500,
                                                color: fontcolor),
                                          ),
                                          SizedBox(
                                            height: screenheight /
                                                height_figma *
                                                16,
                                          ),
                                          Text(
                                            ":تاریخ نوبت",
                                            style: TextStyle(
                                                fontWeight: FontWeight.w500,
                                                fontSize: 14,
                                                color: grayColorHome),
                                          ),
                                          Text(
                                            "دوشنبه 12 آذر ساعت 17",
                                            style: TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w500,
                                                color: fontcolor),
                                          ),
                                          SizedBox(
                                            height: screenheight /
                                                height_figma *
                                                16,
                                          ),
                                          Text(
                                            ":تاریخ اتمام کاشت",
                                            style: TextStyle(
                                                fontWeight: FontWeight.w500,
                                                fontSize: 14,
                                                color: grayColorHome),
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      width: screenwidth / width_figma * 113,
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(
                                        right: screenwidth / width_figma * 10,
                                      ),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            children: [
                                              Text(
                                                "اطلاعات زیباجو",
                                                style: TextStyle(
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.w700,
                                                    color: phonecolor),
                                              ),
                                              Image.asset(
                                                  "lib/features/client/Home/presentation/images/information-line.png")
                                            ],
                                          ),
                                          SizedBox(
                                            height: screenheight /
                                                height_figma *
                                                16,
                                          ),
                                          Text(
                                            ":زیباجو",
                                            style: TextStyle(
                                                fontWeight: FontWeight.w500,
                                                fontSize: 14,
                                                color: grayColorHome),
                                          ),
                                          Text(
                                            items[1],
                                            style: TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w500,
                                                color: fontcolor),
                                          ),
                                          SizedBox(
                                            height: screenheight /
                                                height_figma *
                                                32,
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            children: [
                                              Text(
                                                "اطلاعات کاشت",
                                                style: TextStyle(
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.w700,
                                                    color: phonecolor),
                                              ),
                                              Image.asset(
                                                  "lib/features/client/Home/presentation/images/information-line.png")
                                            ],
                                          ),
                                          SizedBox(
                                            height: screenheight /
                                                height_figma *
                                                16,
                                          ),
                                          Text(
                                            ":عملیات مورد نیاز",
                                            style: TextStyle(
                                                fontWeight: FontWeight.w500,
                                                fontSize: 14,
                                                color: grayColorHome),
                                          ),
                                          Text(
                                            "کاشت مو",
                                            style: TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w500,
                                                color: fontcolor),
                                          ),
                                          SizedBox(
                                            height: screenheight /
                                                height_figma *
                                                16,
                                          ),
                                          Text(
                                            ":تکنسین",
                                            style: TextStyle(
                                                fontWeight: FontWeight.w500,
                                                fontSize: 14,
                                                color: grayColorHome),
                                          ),
                                          Text(
                                            items[0],
                                            style: TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w500,
                                                color: fontcolor),
                                          ),
                                          SizedBox(
                                            height: screenheight /
                                                height_figma *
                                                16,
                                          ),
                                          Text(
                                            ":تاریخ شروع کاشت",
                                            style: TextStyle(
                                                fontWeight: FontWeight.w500,
                                                fontSize: 14,
                                                color: grayColorHome),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: screenheight / height_figma * 15,
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
