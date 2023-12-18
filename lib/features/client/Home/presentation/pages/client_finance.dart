import 'package:flutter/material.dart';
import '../../../../../themes/colors.dart';
import '../../domain/entity.dart';

class ClientFinance extends StatefulWidget {
  const ClientFinance({Key? key}) : super(key: key);

  @override
  State<ClientFinance> createState() => _ClientFinanceState();
}

class _ClientFinanceState extends State<ClientFinance> {
  @override
  Widget build(BuildContext context) {
    final screenheight = MediaQuery.of(context).size.height;
    final height_figma = 926;
    final screenwidth = MediaQuery.of(context).size.width;
    final width_figma = 428;

    return Scaffold(
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
                                  "افزایش اعتبار کیف پول",
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
                  "تاریخچه پرداخت ها",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                    color: fontcolor,
                  ),
                ),
              ),
              SizedBox(
                height: screenheight / height_figma * 21,
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
                          onTap: () {},
                          child: Padding(
                            padding: EdgeInsets.only(
                              top: screenheight / height_figma * 10,
                              bottom: screenheight / height_figma * 10,
                              left: screenwidth / width_figma * 10,
                              right: screenwidth / width_figma * 8,
                            ),
                            child: Container(
                              width: screenwidth / width_figma * 396,
                              height: 108,
                              padding: EdgeInsets.only(
                                top: screenheight / height_figma * 7,
                                bottom: screenheight / height_figma * 7,
                                left: screenwidth / width_figma * 18,
                                right: screenwidth / width_figma * 16,
                              ),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(16),
                                  color: Colors.white),
                              child: Directionality(
                                textDirection: TextDirection.rtl,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Center(
                                      child: Text(
                                        "15000000 ریال",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w700,
                                            fontSize: 16,
                                            color: fontcolor),
                                      ),
                                    ),
                                    SizedBox(
                                      height: screenheight / height_figma * 15,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.center,
                                      children: [
                                        Column(
                                          crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "از تاریخ:",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 14,
                                                  color: grayColorHome),
                                            ),
                                            SizedBox(
                                              height: screenheight /
                                                  height_figma *
                                                  4,
                                            ),
                                            Container(
                                              width: 100,
                                              child: Text(
                                                "سه شنبه 13 آذر",
                                                style: TextStyle(
                                                    fontWeight: FontWeight.w500,
                                                    fontSize: 14,
                                                    color: fontcolor),
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          width: screenwidth / width_figma * 28,
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "تا تاریخ:",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 14,
                                                  color: grayColorHome),
                                            ),
                                            SizedBox(
                                              height: screenheight /
                                                  height_figma *
                                                  4,
                                            ),
                                            Container(
                                              width: 100,
                                              child: Text(
                                                "سه شنبه 13 آذر",
                                                style: TextStyle(
                                                    fontWeight: FontWeight.w500,
                                                    fontSize: 14,
                                                    color: fontcolor),
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          width: screenwidth / width_figma * 28,
                                        ),
                                        Column(
                                          children: [
                                            Text(
                                              "وضعیت:",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 14,
                                                  color: grayColorHome),
                                            ),
                                            Container(
                                              width: screenwidth /
                                                  width_figma *
                                                  97,
                                              height: 24,
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                  BorderRadius.circular(16),
                                                  color: LightBlue),
                                              child: items[index].situation ==
                                                  "completed"
                                                  ? Center(
                                                  child: Text(
                                                    "پرداخت شده",
                                                    style: TextStyle(
                                                      fontWeight:
                                                      FontWeight.w800,
                                                      fontSize: 14,
                                                      color: Colors.white,
                                                    ),
                                                  ))
                                                  : items[index].situation ==
                                                  "Expectation"
                                                  ? Center(
                                                  child: Text(
                                                    "پرداخت شده",
                                                    style: TextStyle(
                                                      fontSize: 14,
                                                      fontWeight:
                                                      FontWeight.w800,
                                                      color: Colors.white,
                                                    ),
                                                  ))
                                                  : Center(
                                                  child: Text(
                                                    "پرداخت نشده",
                                                    style: TextStyle(
                                                      fontWeight:
                                                      FontWeight.w800,
                                                      fontSize: 14,
                                                      color: Colors.white,
                                                    ),
                                                  )),
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
      ),
    );
  }
}
