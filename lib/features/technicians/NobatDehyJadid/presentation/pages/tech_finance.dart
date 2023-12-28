import 'package:flutter/material.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

import '../../../../../themes/colors.dart';
import '../../domain/finance_model.dart';

class TechFinance extends StatefulWidget {
  const TechFinance({Key? key}) : super(key: key);

  @override
  State<TechFinance> createState() => _TechFinanceState();
}

class _TechFinanceState extends State<TechFinance> {
  @override
  Widget build(BuildContext context) {
    final screenheight = MediaQuery.of(context).size.height;
    final height_figma = 926;
    final screenwidth = MediaQuery.of(context).size.width;
    final width_figma = 428;

    return Scaffold(
      appBar: AppBar(
        // Add your page title here
        backgroundColor: backgroundHome,
        iconTheme: IconThemeData(color: Color(0xff999999)),
        automaticallyImplyLeading: true,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context); // Handle back navigation here
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: screenheight / height_figma * 62,
              ),
              Padding(
                padding: EdgeInsets.only(
                  right: screenwidth / width_figma * 13,
                ),
                child: Text(
                  "اطلاعات حساب",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                    color: fontcolor,
                  ),
                ),
              ),
              SizedBox(
                height: screenheight / height_figma * 37,
              ),
              Center(
                child: Container(
                  width: screenwidth / width_figma * 393,
                  height: screenheight / height_figma * 224,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(32),
                      color: Colors.white),
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                          top: screenheight / height_figma * 18,
                          right: screenwidth / width_figma * 8,
                        ),
                        child: Row(
                          children: [
                            Image.asset(
                                "lib/features/technicians/NobatDehyJadid/images/Frame48.png"),
                            SizedBox(
                              width: screenwidth / width_figma * 3,
                            ),
                            Text(
                              "اطلاعات کیف پول",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: Colors.black,
                              ),
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          top: screenheight / height_figma * 24,
                          right: screenwidth / width_figma * 40,
                        ),
                        child: Directionality(
                          textDirection: TextDirection.rtl,
                          child: Row(
                            children: [
                              Container(
                                width: screenwidth / width_figma * 105,
                                height: screenheight / height_figma * 30,
                                child: Center(
                                  child: Text(
                                    "اعتبار:",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 16,
                                        color: grayColorHome),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: screenwidth / width_figma * 10,
                              ),
                              Text(
                                "15،000،000،000 ریال",
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black),
                              )
                            ],
                          ),
                        ),
                      ),
                      Center(
                        child: Padding(
                          padding: EdgeInsets.only(
                            top: screenheight / height_figma * 25,
                          ),
                          child: GestureDetector(
                            onTap: () {},
                            child: Container(
                              width: screenwidth / width_figma * 328,
                              height: screenheight / height_figma * 48,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: LightBlue,
                              ),
                              child: Center(
                                child: Text(
                                  "درخواست برداشت",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 14,
                                      color: lightwhite),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: screenheight / height_figma * 37,
              ),
              Padding(
                padding: EdgeInsets.only(
                  right: screenwidth / width_figma * 13,
                ),
                child: Text(
                  "سابقه فعالیت ها",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                    color: fontcolor,
                  ),
                ),
              ),
              SizedBox(
                height: screenheight / height_figma * 12,
              ),
              Center(
                child: Container(
                  width: screenwidth / width_figma * 416,
                  child: FutureBuilder(
                    future: readJsonDatafinance(),
                    builder: (context, data) {
                      if (data.hasError) {
                        return Center(child: Text("${data.error}"));
                      } else if (data.hasData) {
                        var items = data.data as List<FinanceModel>;
                        return ListView.builder(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            scrollDirection: Axis.vertical,
                            itemCount: items.length,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: EdgeInsets.all(
                                    screenwidth / width_figma * 10),
                                child: Container(
                                  // height: screenheight / height_figma * 230,
                                  // width: screenwidth / width_figma * 416,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(16),
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        height:
                                            screenheight / height_figma * 16,
                                      ),
                                      Center(
                                        child: Text(
                                          items[index].operation.toString(),
                                          style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w700,
                                              color: fontcolor),
                                        ),
                                      ),
                                      SizedBox(
                                        height: screenheight / height_figma * 8,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Container(
                                            width:
                                                screenwidth / width_figma * 110,
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  "زیباجو:",
                                                  style: TextStyle(
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      color: grayColorHome),
                                                ),
                                                SizedBox(
                                                  height: screenheight /
                                                      height_figma *
                                                      4,
                                                ),
                                                Text(
                                                  items[index]
                                                      .zibajo
                                                      .toString(),
                                                  style: TextStyle(
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      color: fontcolor),
                                                ),
                                              ],
                                            ),
                                          ),
                                          SizedBox(
                                            width:
                                                screenwidth / width_figma * 173,
                                          ),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                "تعداد تامو:",
                                                style: TextStyle(
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.w500,
                                                    color: grayColorHome),
                                              ),
                                              SizedBox(
                                                height: screenheight /
                                                    height_figma *
                                                    4,
                                              ),
                                              Text(
                                                "${items[index].tar_mo.toString()} تار مو",
                                                style: TextStyle(
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.w500,
                                                    color: fontcolor),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height:
                                            screenheight / height_figma * 19,
                                      ),
                                      Center(
                                        child: Container(
                                          width:
                                              screenwidth / width_figma * 231,
                                          height:
                                              screenheight / height_figma * 30,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(16),
                                            color: items[index].state ==
                                                    "تایید شده"
                                                ? LightBlue
                                                : processColor,
                                          ),
                                          child: Center(
                                            child: Text(
                                              items[index].state.toString(),
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
                                        height:
                                            screenheight / height_figma * 11,
                                      ),
                                      Center(
                                        child: Container(
                                          width:
                                              screenwidth / width_figma * 364,
                                          height:
                                              screenheight / height_figma * 40,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(36),
                                            gradient: LinearGradient(
                                                begin: Alignment.topCenter,
                                                end: Alignment.bottomCenter,
                                                colors: [
                                                  LightBlue.withOpacity(0.1),
                                                  White.withOpacity(0.1)
                                                ]),
                                          ),
                                          child: Center(
                                            child: GradientText(
                                              items[index].date.toString(),
                                              style: TextStyle(
                                                fontWeight: FontWeight.w800,
                                                fontSize: 14,
                                              ),
                                              colors: [LightBlue, LightBlue],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            });
                      } else {
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                    },
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
