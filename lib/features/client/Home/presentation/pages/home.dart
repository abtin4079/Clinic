// import 'dart:ffi';
import 'dart:ui';

import 'package:clinic/features/client/Home/Controller/home_page_search_controller.dart';
import 'package:clinic/features/client/Home/Controller/remote_service.dart';
import 'package:clinic/features/client/Home/Models/home_page_search_model.dart';
import 'package:clinic/features/client/Home/domain/entity.dart';
import 'package:clinic/features/client/Home/presentation/pages/plant_info.dart';
import 'package:clinic/themes/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:clinic/features/Calender/jalali_table_calendar.dart';
import 'package:shamsi_date/shamsi_date.dart';
import 'package:get_storage/get_storage.dart';
import 'package:clinic/features/client/Home/Models/list_of_process.dart';

import '../../../NavigationBar/Icons/navigation_bar_icons.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

String format1(Date d) {
  final f = d.formatter;

  return '${f.wN} ${f.d} ${f.mN}';
}

gregorianToJalali(int y, int m, int d, [String? separator]) {
  var sumMonthDay = [0, 31, 59, 90, 120, 151, 181, 212, 243, 273, 304, 334];
  var jY = 0;
  if (y > 1600) {
    jY = 979;
    y -= 1600;
  } else {
    jY = 0;
    y -= 621;
  }
  var gy = (m > 2) ? y + 1 : y;
  var day = (365 * y) +
      ((gy + 3) ~/ 4) -
      ((gy + 99) ~/ 100) +
      ((gy + 399) ~/ 400) -
      80 +
      d +
      sumMonthDay[m - 1];
  jY += 33 * (day.round() / 12053).floor();
  day %= 12053;
  jY += 4 * (day.round() / 1461).floor();
  day %= 1461;
  jY += ((day.round() - 1) / 365).floor();
  if (day > 365) day = ((day - 1).round() % 365);
  int jm;
  var jd;
  int days = day.toInt();
  if (days < 186) {
    jm = 1 + (days ~/ 31);
    jd = 1 + (days % 31);
  } else {
    jm = 7 + ((days - 186) ~/ 30);
    jd = 1 + (days - 186) % 30;
  }
  var persianDate;
  if (separator == null)
    persianDate = [jY, jm, jd];
  else
    persianDate = "$jY$separator$jm$separator$jd";
  return persianDate;
}

class _HomeState extends State<Home> {
  final RemoteService processController = Get.put(RemoteService());
  final HomePageSearchController homePageSearchController =
      Get.put(HomePageSearchController());
  final GetStorage storage = GetStorage();
  TextEditingController searchController = TextEditingController();
  bool _initialized = false;
  String today = '';
  List request_date = [];
  GlobalKey<RefreshIndicatorState> refreshKey =
      GlobalKey<RefreshIndicatorState>();
  Future _selectDate() async {
    List? picked = await jalaliCalendarPicker(
        context: context,
        convertToGregorian: true,
        showTimePicker: false,
        hore24Format: true);
    if (picked != null) {
      Jalali j = Jalali(picked[0], picked[1], picked[2]);
      setState(() {
        request_date = picked;
        today = format1(j);
      });
      storage.write('storedDate', today);
      storage.write('requestData', request_date);
    }
  }

  @override
  void initState() {
    if (_initialized == false) {
      _loadDateFromStorage();
      super.initState();
    }
  }

  void _loadDateFromStorage() {
    String storedDate = storage.read('storedDate') ?? '';
    var storedDate2 = storage.read('requestData') ?? '';
    var localTimesoemthing = DateTime.now();
    List list = gregorianToJalali(localTimesoemthing.year,
        localTimesoemthing.month, localTimesoemthing.day);
    Jalali j = Jalali(list[0], list[1], list[2]);
    setState(() {
      today = storedDate.isNotEmpty ? storedDate : format1(j);
      request_date = storedDate2.isNotEmpty ? storedDate2 : list;
      _initialized = true;
    });
  }

  Future<void> _handleRefresh() async {
    await _selectDate();
    await processController.getData(request_date);
  }

  String search = '';

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  Future<List<ItemProcess>?> _getFuture() async {
    if (search.isEmpty) {
      return await processController.getData(request_date);
    } else {
      print("search for : $search");
      return await processController.getSearchResult(search);
    }
  }

  void _search(String searchText) {
    setState(() {
      search = searchText;
    });
    // _getFuture();
  }

  @override
  Widget build(BuildContext context) {
    final screenheight = MediaQuery.of(context).size.height;
    final height_figma = 926;
    final screenwidth = MediaQuery.of(context).size.width;
    final width_figma = 428;
    print(_initialized);

    return Scaffold(
      backgroundColor: backgroundHome,
      appBar: AppBar(
        backgroundColor: backgroundHome,
        elevation: 0,
        centerTitle: true,
        title: Text(
          "خانه",
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w700,
            color: fontcolor,
          ),
        ),
      ),
      body: RefreshIndicator(
        onRefresh: _handleRefresh,
        child: SingleChildScrollView(
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
                  controller: searchController,
                  onSubmitted: (String searchText) {
                    _search(searchText);
                  },
                  textAlign: TextAlign.right,
                  decoration: InputDecoration(
                    suffixIcon: Icon(
                      Search.search,
                      size: 24,
                      color: phonecolor,

                      // onPressed: (String searchText) {
                      //   _search(searchText);
                      // },
                      // onPressed: () => homePageSearchController.fetchPatient(),
                    ),
                    hintText: " جستجو در بین نوبت ها",
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
              Container(
                padding: EdgeInsets.only(right: 10),
                child: Row(
                  // crossAxisAlignment: CrossAxisAlignment.center,
                  // mainAxisAlignment: MainAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      // margin: EdgeInsets.only(
                      //   right: screenwidth / width_figma * 4,
                      // ),
                      child: Image.asset(
                          "lib/features/client/Home/presentation/images/calender.png"),
                    ),
                    Container(
                      // margin: EdgeInsets.only(
                      //   right: screenwidth / width_figma * 20,
                      // ),
                      child: IconButton(
                          iconSize: 80,
                          onPressed: () {
                            _selectDate();
                            //
                          },
                          icon: Image.asset(
                            "lib/features/client/Home/presentation/images/date.png",
                          )),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Container(
                        // margin: EdgeInsets.only(
                        //   right: screenwidth / width_figma * 8,
                        // ),
                        child: Text(
                      "نوبت های " + today,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: fontcolor,
                        fontFeatures: [
                          FontFeature('ss01', 1),
                        ],
                      ),
                    )),
                    Container(
                      // margin: EdgeInsets.only(
                      //   right: screenwidth / width_figma * 16,
                      // ),
                      child: GestureDetector(
                        onTap: () {},
                        child: Image.asset(
                            "lib/features/client/Home/presentation/images/copy.png"),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: screenheight / height_figma * 10,
              ),
              FutureBuilder(
                future: _getFuture(),
                builder: (context, data) {
                  if (data.hasError) {
                    print("object");
                    return Text("${data.error}");
                  } else if (data.hasData) {
                    var items = data.data as List<ItemProcess>;
                    if (items!.length == 0 || data.data == null) {
                      return Center(
                        child: Text("نوبتی در حال حاضر وجود ندارد"),
                      );
                    }
                    return ListView.builder(
                      // physics: const AlwaysScrollableScrollPhysics(),
                      physics: NeverScrollableScrollPhysics(),
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      itemCount: items == null
                          ? 0
                          : items
                              .length, // fjdkfjdfkgdfgdfk;jgkgjdfklfdjk;jb;dfkfjd;fmd;klg
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            Get.to(
                              PlantInfo(),
                              arguments: items[index],
                            );
                          },
                          child: Padding(
                            padding: EdgeInsets.only(
                              top: 10,
                              right: screenwidth / width_figma * 19,
                              left: screenwidth / width_figma * 19,
                              bottom: 10,
                            ),
                            child: Container(
                              // width: screenwidth / width_figma * 396,
                              // height: screenheight / height_figma * 164,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(16),
                                  color: Colors.white),
                              child: Directionality(
                                textDirection: TextDirection.rtl,
                                child: Padding(
                                  padding: EdgeInsets.only(
                                    top: screenheight / height_figma * 17,
                                    // right: screenwidth / width_figma * 15,
                                    // left: screenwidth / width_figma * 15,
                                    bottom: screenheight / height_figma * 17,
                                  ),
                                  child: Row(
                                    children: [
                                      Image.asset(
                                          "lib/features/client/Home/presentation/images/gol.png"),
                                      SizedBox(
                                        width: screenwidth / width_figma * 10,
                                      ),
                                      Container(
                                        width: screenwidth / width_figma * 110,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              items[index].operation!,
                                              style: TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w700,
                                                  color: fontcolor),
                                            ),
                                            SizedBox(
                                              height: screenheight /
                                                  height_figma *
                                                  6,
                                            ),
                                            Text(
                                              "تکنسین:",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 14,
                                                  color: grayColorHome),
                                            ),
                                            SizedBox(
                                              height: screenheight /
                                                  height_figma *
                                                  3,
                                            ),
                                            Text(
                                              items[index].technecianName!,
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w500,
                                                  color: fontcolor),
                                            ),
                                            SizedBox(
                                              height: screenheight /
                                                  height_figma *
                                                  6,
                                            ),
                                            Text(
                                              "زیباجو:",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 14,
                                                  color: grayColorHome),
                                            ),
                                            SizedBox(
                                              height: screenheight /
                                                  height_figma *
                                                  3,
                                            ),
                                            Text(
                                              items[index].pationtName!,
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w500,
                                                  color: fontcolor),
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        width: screenwidth / width_figma * 53,
                                      ),
                                      Column(
                                        children: [
                                          SizedBox(
                                            height: screenheight /
                                                height_figma *
                                                25,
                                          ),
                                          Text(
                                            " تعداد تار مو:",
                                            style: TextStyle(
                                                fontWeight: FontWeight.w500,
                                                fontSize: 14,
                                                color: grayColorHome),
                                          ),
                                          SizedBox(
                                            height:
                                                screenheight / height_figma * 3,
                                          ),
                                          Text(
                                            items[index].hairCount!,
                                            style: TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w500,
                                                color: fontcolor),
                                          ),
                                          SizedBox(
                                            height:
                                                screenheight / height_figma * 6,
                                          ),
                                          Text(
                                            "وضعیت:",
                                            style: TextStyle(
                                                fontWeight: FontWeight.w500,
                                                fontSize: 14,
                                                color: grayColorHome),
                                          ),
                                          SizedBox(
                                            height:
                                                screenheight / height_figma * 3,
                                          ),
                                          Container(
                                            width:
                                                screenwidth / width_figma * 97,
                                            height: 24,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(16),
                                                color: (items[index].status! ==
                                                        "created")
                                                    ? graycoloranjamnashode
                                                    : (items[index].status! ==
                                                            "started")
                                                        ? rediligal
                                                        : (items[index]
                                                                    .status! ==
                                                                "ended")
                                                            ? rediligal
                                                            : (items[index]
                                                                        .status! ==
                                                                    "saved")
                                                                ? processColor
                                                                : SendagainColorblue),
                                            child: Center(
                                              child: Text(
                                                (items[index].status! ==
                                                        "created")
                                                    ? "انجام نشده"
                                                    : (items[index].status! ==
                                                            "started")
                                                        ? "در حال انجام"
                                                        : (items[index]
                                                                    .status! ==
                                                                "ended")
                                                            ? "در حال انجام"
                                                            : (items[index]
                                                                        .status! ==
                                                                    "saved")
                                                                ? "در انتظار تایید"
                                                                : "تایید شده",
                                                style: TextStyle(
                                                    fontWeight: FontWeight.w800,
                                                    fontSize: 14,
                                                    color:
                                                        (items[index].status! ==
                                                                "created")
                                                            ? blackwhite
                                                            : Colors.white),
                                              ),
                                            ),
                                          )
                                          //   items[index].situation == "Expectation"
                                          //       ? Container(
                                          //           width: screenwidth /
                                          //               width_figma *
                                          //               97,
                                          //           height: 24,
                                          //           decoration: BoxDecoration(
                                          //               borderRadius:
                                          //                   BorderRadius.circular(
                                          //                       16),
                                          //               color: processColor),
                                          //           child: Center(
                                          //             child: Text(
                                          //               "در انتظار تایید",
                                          //               style: TextStyle(
                                          //                   fontWeight:
                                          //                       FontWeight.w800,
                                          //                   fontSize: 14,
                                          //                   color: Colors.white),
                                          //             ),
                                          //           ),
                                          //         )
                                          //       : items[index].situation ==
                                          //               "completed"
                                          //           ? Container(
                                          //               width: screenwidth /
                                          //                   width_figma *
                                          //                   97,
                                          //               height: 24,
                                          //               decoration: BoxDecoration(
                                          //                   borderRadius:
                                          //                       BorderRadius
                                          //                           .circular(16),
                                          //                   color: LightBlue),
                                          //               child: Center(
                                          //                 child: Text(
                                          //                   "تایید شده",
                                          //                   style: TextStyle(
                                          //                       fontWeight:
                                          //                           FontWeight.w800,
                                          //                       fontSize: 14,
                                          //                       color:
                                          //                           Colors.white),
                                          //                 ),
                                          //               ),
                                          //             )
                                          //           : Container(
                                          //               width: screenwidth /
                                          //                   width_figma *
                                          //                   97,
                                          //               height: 24,
                                          //               decoration: BoxDecoration(
                                          //                   borderRadius:
                                          //                       BorderRadius
                                          //                           .circular(16),
                                          //                   color: rediligal),
                                          //               child: Center(
                                          //                 child: Text(
                                          //                   "در حال انجام",
                                          //                   style: TextStyle(
                                          //                       fontWeight:
                                          //                           FontWeight.w800,
                                          //                       fontSize: 14,
                                          //                       color:
                                          //                           Colors.white),
                                          //                 ),
                                          //               ),
                                          //             ),
                                        ],
                                      ),
                                    ],
                                  ),
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
