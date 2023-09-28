import 'package:flutter/material.dart';

import '../../../../../themes/colors.dart';
import '../../../Home/domain/entity.dart';

class Notif extends StatefulWidget {
  const Notif({Key? key}) : super(key: key);

  @override
  State<Notif> createState() => _NotifState();
}

class _NotifState extends State<Notif> {
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
          "اعلانات",
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w700,
            color: fontcolor,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: FutureBuilder(
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
                  return Stack(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                          top:  19,
                          bottom:  19,
                          right: screenwidth / width_figma * 47,
                          left: screenwidth / width_figma * 47,
                        ),
                        child: Card(
                          child: Container(
                            width: screenwidth / width_figma * 396,
                            height:  152,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(16),
                                border:
                                    Border.all(width: 1, color: toggleColor),
                                color: Colors.white),
                            child: Directionality(
                              textDirection: TextDirection.rtl,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(
                                      top:  7,
                                      right: screenwidth / width_figma * 14,
                                    ),
                                    child: Text(
                                      "نوبت شما رد شد",
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w400,
                                          color: meshki),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(
                                      top:  14,
                                      right: screenwidth / width_figma * 16,
                                      left: screenwidth / width_figma * 20,
                                    ),
                                    child: Text(
                                      "نوبت کاشت مو برای ${items[index].zibajo.toString()} توسط ${items[index].tech.toString()} رد شد ",
                                      style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 14,
                                        color: meshki.withOpacity(0.8),
                                      ),
                                    ),
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        width: screenwidth / width_figma * 88,
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(
                                          top:  12,
                                        ),
                                        child: Container(
                                          width:
                                              screenwidth / width_figma * 146,
                                          height: 33,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(4),
                                            color: LightBlue,
                                          ),
                                          child: Center(
                                            child: Text(
                                              "چایگزین کردن تکنسین",
                                              style: TextStyle(
                                                fontSize: 12,
                                                fontWeight: FontWeight.w400,
                                                color: Colors.white,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: screenwidth / width_figma * 12,
                                      ),
                                      Text(
                                        "12 آذر 1402",
                                        style: TextStyle(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 12,
                                          color: meshki.withOpacity(0.6),
                                        ),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          top:  15,
                          left: screenwidth / width_figma * 64,
                        ),
                        child: Container(
                          width: 17,
                          height: 17,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            color: items[index].situation.toString() ==
                                    "Expectation"
                                ? processColor
                                : items[index].situation.toString() ==
                                        "processing"
                                    ? rediligal
                                    : LightBlue,
                          ),
                        ),
                      ),
                    ],
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
      ),
    );
  }
}
