import 'package:clinic/features/client/Home/Controller/first_page_client_processes_controller.dart';
import 'package:clinic/features/client/Home/presentation/pages/nav_bar_client.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../../../../../themes/colors.dart';
import 'package:clinic/features/client/Home/Controller/process_controller.dart';
import 'dart:ui';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../../../Turn ratings/New_Client/presentation/pages/new_client_page_1.dart';
import '../../Models/process_model_client.dart';

class MasterPage extends StatefulWidget {
  const MasterPage({Key? key}) : super(key: key);

  @override
  State<MasterPage> createState() => _MasterPageState();
}

class _MasterPageState extends State<MasterPage> {
  TextEditingController tarcontroller = TextEditingController();

//  ItemProcess appointment = Get.arguments as ItemProcess;
  ProcessController zibajoyanManSecondPage = Get.put(ProcessController());

  FirstPageClientProcessesController firstPageClientProcessesController =
      Get.put(FirstPageClientProcessesController());
  late bool _isloading;

  void _showImagePreview(Item item, int index) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          child: PhotoViewGallery.builder(
            itemCount: item.beforeOperation.length,
            builder: (context, galleryIndex) {
              return PhotoViewGalleryPageOptions.customChild(
                child: Stack(
                  children: [
                    Container(
                      width: double.infinity,
                      height: double.infinity,
                      child: _buildImageWidget(item, galleryIndex),
                    ),
                    Positioned(
                      top: 16,
                      right: 16,
                      child: IconButton(
                        icon: Icon(Icons.close, color: Colors.white),
                        onPressed: () => Navigator.of(context).pop(),
                      ),
                    ),
                  ],
                ),
                minScale: PhotoViewComputedScale.contained * 0.8,
                maxScale: PhotoViewComputedScale.covered * 2,
                initialScale: PhotoViewComputedScale.contained,
              );
            },
            scrollPhysics: BouncingScrollPhysics(),
            backgroundDecoration: BoxDecoration(
              color: Colors.black,
            ),
            pageController: PageController(initialPage: index),
          ),
        );
      },
    );
  }

  Widget _buildImageWidget(Item item, int index) {
    if (item.beforeOperation.isNotEmpty &&
        index < item.beforeOperation.length) {
      if (item.beforeOperation[index] != []) {
        // Check if the corresponding image file has been fetched
        if (item.beforeOperation.length > index) {
          return CircleAvatar(
            radius: 50,
            backgroundColor: Colors.grey[300],
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: CachedNetworkImage(
                imageUrl:
                    'http://103.75.196.160/clinic/images/${item.beforeOperation[index].fileName}',
                placeholder: (context, url) => _buildPlaceholder(),
                errorWidget: (context, url, error) => _buildPlaceholder(),
                fit: BoxFit.cover,
              ),
            ),
          );
        } else {
          // Image file hasn't been fetched yet, return a placeholder
          return _buildPlaceholder();
        }
      } else {
        return _buildPlaceholder();
      }
    } else {
      return _buildPlaceholder();
    }
  }

  Widget _buildPlaceholder() {
    return Container(
      color: Colors.grey[300],
      child: Center(
        child: Icon(Icons.photo, size: 50, color: Colors.grey),
      ),
    );
  }

  Widget _buildImageWidget_after(Item item, int index) {
    if (item.afterOperation.isNotEmpty && index < item.afterOperation.length) {
      if (item.afterOperation[index] != []) {
        // Check if the corresponding image file has been fetched
        if (item.afterOperation.length > index) {
          return CircleAvatar(
            radius: 50,
            backgroundColor: Colors.grey[300],
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: CachedNetworkImage(
                imageUrl:
                    'http://185.221.237.51/clinic/images/${item.afterOperation[index].fileName}',
                placeholder: (context, url) => _buildPlaceholder(),
                errorWidget: (context, url, error) => _buildPlaceholder(),
                fit: BoxFit.cover,
              ),
            ),
          );
        } else {
          // Image file hasn't been fetched yet, return a placeholder
          return _buildPlaceholder();
        }
      } else {
        return _buildPlaceholder();
      }
    } else {
      return _buildPlaceholder();
    }
  }

  void _showImagePreview_after(Item item, int index) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          child: PhotoViewGallery.builder(
            itemCount: item.afterOperation.length,
            builder: (context, galleryIndex) {
              return PhotoViewGalleryPageOptions.customChild(
                child: Stack(
                  children: [
                    Container(
                      width: double.infinity,
                      height: double.infinity,
                      child: _buildImageWidget_after(item, galleryIndex),
                    ),
                    Positioned(
                      top: 16,
                      right: 16,
                      child: IconButton(
                        icon: Icon(Icons.close, color: Colors.white),
                        onPressed: () => Navigator.of(context).pop(),
                      ),
                    ),
                  ],
                ),
                minScale: PhotoViewComputedScale.contained * 0.8,
                maxScale: PhotoViewComputedScale.covered * 2,
                initialScale: PhotoViewComputedScale.contained,
              );
            },
            scrollPhysics: BouncingScrollPhysics(),
            // backgroundDecoration: BoxDecoration(
            //   color: Colors.black,
            // ),
            pageController: PageController(initialPage: index),
          ),
        );
      },
    );
  }

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
    firstPageClientProcessesController.fetchInformation();
    // Your one-time initialization code for the root widget goes here.
    // This code will run when the app is first launched.
  }

  @override
  Widget build(BuildContext context) {
    final screenheight = MediaQuery.of(context).size.height;
    final height_figma = 926;
    final screenwidth = MediaQuery.of(context).size.width;
    final width_figma = 428;

    // var items = Get.arguments;

    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: backgroundHome,
        drawer: NavBarClient(),
        appBar: AppBar(
          iconTheme: IconThemeData(color: phonecolor),
          automaticallyImplyLeading: true,
          elevation: 0,
          backgroundColor: backgroundHome,
        ),
        body: SingleChildScrollView(
          child: Directionality(
            textDirection: TextDirection.rtl,
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(
                    top: screenheight / height_figma * 10,
                    // right: screenwidth / width_figma * 11,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        child: Text(
                          "در انتظار تایید شما",
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.w700,
                            color: fontcolor,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: screenwidth / width_figma * 75,
                      ),
                      GestureDetector(
                        onTap: () {
                          Get.to(() => NewClientPage1());
                        },
                        child: Container(
                          height: screenheight / height_figma * 47,
                          width: screenwidth / width_figma * 140,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(48),
                            gradient: LinearGradient(
                                begin: Alignment.topRight,
                                end: Alignment.bottomLeft,
                                colors: [rediligal, whiteiligal]),
                          ),
                          child: Center(
                            child: Text(
                              "نوبت جدید",
                              style: TextStyle(
                                  fontWeight: FontWeight.w800,
                                  fontSize: 14,
                                  color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: screenheight / height_figma * 20,
                ),
                Directionality(
                  textDirection: TextDirection.ltr,
                  child: FutureBuilder(
                      // future: zibajoyanManSecondPage.getProcessById(appointment.id.toString()),
                      future: firstPageClientProcessesController.getProcess(),
                      builder: (context, data) {
                        if (data.hasError) {
                          return Text("${data.error}");
                        } else if (data.hasData) {
                          var masterItem = data.data as ProcessModuleClient;
                          if (data.data == []) {
                            return Center(
                              child: Text("مشکلی به وجود آمده است"),
                            );
                          } else if (masterItem.items.length == 0) {
                            return Container(
                                child: Center(
                              child: Text(
                                  "در حال حاضر نوبتی برای تایید شما وجود ندارد"),
                            ));
                          }
                          return ListView.builder(
                            scrollDirection: Axis.vertical,
                            physics: NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: masterItem.items.length,
                            itemBuilder: (context, index) {
                              //ProcessModuleClient masterItem = firstPageClientProcessesController.process_info[index];
                              return Padding(
                                padding: EdgeInsets.all(10),
                                // padding: EdgeInsets.all(
                                //     screenheight / screenwidth * 10),
                                child: Center(
                                  child: Container(
                                    width: screenwidth / width_figma * 396,
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius:
                                            BorderRadius.circular(16)),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        SizedBox(
                                          height:
                                              screenheight / screenwidth * 16,
                                        ),
                                        Center(
                                          child: Image.asset(
                                              "lib/features/client/Home/presentation/images/gol_squre.png"),
                                        ),
                                        SizedBox(
                                          height:
                                              screenheight / height_figma * 8,
                                        ),
                                        Center(
                                          child: Text(
                                            masterItem.items[index].operation
                                                .toString(),
                                            style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w700,
                                                color: fontcolor),
                                          ),
                                        ),
                                        Center(
                                          child: Container(
                                            margin: EdgeInsets.only(
                                              top: screenheight /
                                                  height_figma *
                                                  8,
                                            ),
                                            width:
                                                screenwidth / width_figma * 100,
                                            height: 24,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(16),
                                                color: (masterItem.items[index]
                                                            .status ==
                                                        "created")
                                                    ? graycoloranjamnashode
                                                    : (masterItem.items[index]
                                                                .status ==
                                                            "started")
                                                        ? rediligal
                                                        : (masterItem
                                                                    .items[
                                                                        index]
                                                                    .status ==
                                                                "ended")
                                                            ? rediligal
                                                            : (masterItem
                                                                        .items[
                                                                            index]
                                                                        .status ==
                                                                    "saved")
                                                                ? processColor
                                                                : SendagainColorblue),
                                            child: Center(
                                              child: Text(
                                                (masterItem.items[index]
                                                            .status ==
                                                        "created")
                                                    ? "انجام نشده"
                                                    : (masterItem.items[index]
                                                                .status ==
                                                            "started")
                                                        ? "در حال انجام"
                                                        : (masterItem
                                                                    .items[
                                                                        index]
                                                                    .status ==
                                                                "ended")
                                                            ? "در حال انجام"
                                                            : (masterItem
                                                                        .items[
                                                                            index]
                                                                        .status ==
                                                                    "saved")
                                                                ? "در انتظار تایید"
                                                                : "تایید شده",
                                                style: TextStyle(
                                                    fontWeight: FontWeight.w800,
                                                    fontSize: 14,
                                                    color: (masterItem
                                                                .items[index]
                                                                .status ==
                                                            "created")
                                                        ? blackwhite
                                                        : Colors.white),
                                              ),
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          height:
                                              screenheight / height_figma * 16,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Padding(
                                              padding: EdgeInsets.only(
                                                  // left: screenwidth / width_figma * 59,
                                                  // right: screenwidth / width_figma * 59,
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
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        fontSize: 14,
                                                        color: grayColorHome),
                                                  ),
                                                  Text(
                                                    masterItem.items[index]
                                                        .pationtPhoneNumber,
                                                    style: TextStyle(
                                                        fontSize: 14,
                                                        fontWeight:
                                                            FontWeight.w500,
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
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        fontSize: 14,
                                                        color: grayColorHome),
                                                  ),
                                                  Text(
                                                    masterItem
                                                        .items[index].hairCount,
                                                    style: TextStyle(
                                                        fontSize: 14,
                                                        fontWeight:
                                                            FontWeight.w500,
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
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        fontSize: 14,
                                                        color: grayColorHome),
                                                  ),
                                                  Text(
                                                    masterItem
                                                        .items[index].visitDate,
                                                    style: TextStyle(
                                                        fontSize: 14,
                                                        fontWeight:
                                                            FontWeight.w500,
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
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        fontSize: 14,
                                                        color: grayColorHome),
                                                  ),
                                                  Text(
                                                    masterItem
                                                        .items[index].endDate,
                                                    style: TextStyle(
                                                        fontSize: 14,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        color: fontcolor),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            // SizedBox(
                                            //   width: screenwidth / width_figma * 40,
                                            // ),
                                            Padding(
                                              padding: EdgeInsets.only(
                                                right: screenwidth /
                                                    width_figma *
                                                    10,
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
                                                            fontWeight:
                                                                FontWeight.w700,
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
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        fontSize: 14,
                                                        color: grayColorHome),
                                                  ),
                                                  Text(
                                                    masterItem.items[index]
                                                        .pationtName,
                                                    style: TextStyle(
                                                        fontSize: 14,
                                                        fontWeight:
                                                            FontWeight.w500,
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
                                                            fontWeight:
                                                                FontWeight.w700,
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
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        fontSize: 14,
                                                        color: grayColorHome),
                                                  ),
                                                  Text(
                                                    masterItem
                                                        .items[index].operation,
                                                    style: TextStyle(
                                                        fontSize: 14,
                                                        fontWeight:
                                                            FontWeight.w500,
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
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        fontSize: 14,
                                                        color: grayColorHome),
                                                  ),
                                                  Text(
                                                    masterItem.items[index]
                                                        .technecianName,
                                                    style: TextStyle(
                                                        fontSize: 14,
                                                        fontWeight:
                                                            FontWeight.w500,
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
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        fontSize: 14,
                                                        color: grayColorHome),
                                                  ),
                                                  Text(
                                                    masterItem
                                                        .items[index].startDate,
                                                    style: TextStyle(
                                                        fontSize: 14,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        color: fontcolor),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(
                                            right:
                                                screenwidth / width_figma * 10,
                                            top: screenheight /
                                                height_figma *
                                                32,
                                          ),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
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
                                              right: screenwidth /
                                                  width_figma *
                                                  62,
                                              left: screenwidth /
                                                  width_figma *
                                                  62,
                                              top: 20),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.end,
                                            children: [
                                              Text(
                                                ":قبل از کاشت مو",
                                                style: TextStyle(
                                                    fontWeight: FontWeight.w500,
                                                    fontSize: 14,
                                                    color: fontcolor,
                                                    fontFeatures: [
                                                      FontFeature('ss01', 1),
                                                    ]),
                                              ),
                                              SizedBox(
                                                height: screenheight /
                                                    height_figma *
                                                    16,
                                              ),
                                              Container(
                                                child: masterItem
                                                        .items[index]
                                                        .beforeOperation
                                                        .isNotEmpty
                                                    ? Container(
                                                        padding:
                                                            EdgeInsets.only(
                                                                left: 10,
                                                                right: 10),
                                                        height: 120,
                                                        child: masterItem
                                                                .items[index]
                                                                .beforeOperation
                                                                .isNotEmpty
                                                            ? GridView.builder(
                                                                physics:
                                                                    NeverScrollableScrollPhysics(),
                                                                shrinkWrap:
                                                                    false,
                                                                gridDelegate:
                                                                    SliverGridDelegateWithFixedCrossAxisCount(
                                                                  crossAxisCount: masterItem
                                                                      .items[
                                                                          index]
                                                                      .beforeOperation
                                                                      .length,
                                                                  crossAxisSpacing:
                                                                      3.0,
                                                                  mainAxisSpacing:
                                                                      3.0,
                                                                ),
                                                                itemCount: masterItem
                                                                        .items[
                                                                            index]
                                                                        .beforeOperation
                                                                        .length +
                                                                    (masterItem.items[index].beforeOperation.length <
                                                                            3
                                                                        ? 1
                                                                        : 0),
                                                                itemBuilder:
                                                                    (context,
                                                                        index) {
                                                                  return Stack(
                                                                    children: [
                                                                      GestureDetector(
                                                                        onTap: () => _showImagePreview(
                                                                            masterItem.items[index],
                                                                            index),
                                                                        child: _buildImageWidget(
                                                                            masterItem.items[index],
                                                                            index),
                                                                      ),
                                                                    ],
                                                                  );
                                                                },
                                                              )
                                                            : Container(),
                                                      )
                                                    : Center(
                                                        child: Text(
                                                            "عکسی اضافه نشده است"),
                                                      ),
                                              ),
                                              SizedBox(
                                                height: screenheight /
                                                    height_figma *
                                                    24,
                                              ),
                                              Text(
                                                ":بعد از کاشت مو",
                                                style: TextStyle(
                                                    fontWeight: FontWeight.w500,
                                                    fontSize: 14,
                                                    color: fontcolor,
                                                    fontFeatures: [
                                                      FontFeature('ss01', 1),
                                                    ]),
                                              ),
                                              SizedBox(
                                                height: screenheight /
                                                    height_figma *
                                                    16,
                                              ),
                                              Container(
                                                child: masterItem
                                                        .items[index]
                                                        .afterOperation
                                                        .isNotEmpty
                                                    ? Container(
                                                        padding:
                                                            EdgeInsets.only(
                                                                left: 10,
                                                                right: 10),
                                                        height: 120,
                                                        child: masterItem
                                                                .items[index]
                                                                .afterOperation
                                                                .isNotEmpty
                                                            ? GridView.builder(
                                                                physics:
                                                                    NeverScrollableScrollPhysics(),
                                                                shrinkWrap:
                                                                    false,
                                                                gridDelegate:
                                                                    SliverGridDelegateWithFixedCrossAxisCount(
                                                                  crossAxisCount: masterItem
                                                                      .items[
                                                                          index]
                                                                      .afterOperation
                                                                      .length,
                                                                  crossAxisSpacing:
                                                                      3.0,
                                                                  mainAxisSpacing:
                                                                      3.0,
                                                                ),
                                                                itemCount: masterItem
                                                                        .items[
                                                                            index]
                                                                        .afterOperation
                                                                        .length +
                                                                    (masterItem.items[index].afterOperation.length <
                                                                            3
                                                                        ? 1
                                                                        : 0),
                                                                itemBuilder:
                                                                    (context,
                                                                        index) {
                                                                  return Stack(
                                                                    children: [
                                                                      GestureDetector(
                                                                        onTap: () => _showImagePreview_after(
                                                                            masterItem.items[index],
                                                                            index),
                                                                        child: _buildImageWidget_after(
                                                                            masterItem.items[index],
                                                                            index),
                                                                      ),
                                                                    ],
                                                                  );
                                                                },
                                                              )
                                                            : Container(),
                                                      )
                                                    : Center(
                                                        child: Text(
                                                            "عکسی اضافه نشده است"),
                                                      ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        SizedBox(
                                          width: screenwidth / width_figma * 32,
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(
                                            right:
                                                screenwidth / width_figma * 10,
                                            top: screenheight /
                                                height_figma *
                                                32,
                                          ),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
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
                                            right:
                                                screenwidth / width_figma * 10,
                                            top:
                                                screenheight / height_figma * 8,
                                          ),
                                          child: masterItem.items[index]
                                                  .description.isEmpty
                                              ? Center(
                                                  child: Text(
                                                      "!توضیحاتی وجود ندارد"))
                                              : Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.end,
                                                  children: [
                                                    Text(
                                                      masterItem.items[index]
                                                          .description,
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          fontSize: 14,
                                                          color: fontcolor),
                                                    ),
                                                  ],
                                                ),
                                        ),
                                        SizedBox(
                                          height:
                                              screenheight / height_figma * 40,
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(
                                            top: screenheight /
                                                height_figma *
                                                16,
                                          ),
                                          child:
                                              masterItem.items[index].status ==
                                                      "saved"
                                                  ? Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        GestureDetector(
                                                          onTap: () {
                                                            showDialog(
                                                              context: context,
                                                              builder:
                                                                  (context) =>
                                                                      Dialog(
                                                                child:
                                                                    Container(
                                                                  width: screenwidth /
                                                                      width_figma *
                                                                      356,
                                                                  height: screenheight /
                                                                      height_figma *
                                                                      265,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            28),
                                                                    color: Colors
                                                                        .white,
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
                                                                        style:
                                                                            TextStyle(
                                                                          color:
                                                                              fontcolor,
                                                                          fontSize:
                                                                              16,
                                                                          fontWeight:
                                                                              FontWeight.w700,
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
                                                                          decoration:
                                                                              BoxDecoration(
                                                                            borderRadius:
                                                                                BorderRadius.circular(32),
                                                                            color:
                                                                                backgroundHome,
                                                                          ),
                                                                          child:
                                                                              TextField(
                                                                            controller:
                                                                                tarcontroller,
                                                                            textAlign:
                                                                                TextAlign.center,
                                                                            decoration:
                                                                                InputDecoration(
                                                                              hintText: 'تعداد تار مو',
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
                                                                                borderSide: BorderSide(color: outlineborder, width: 2),
                                                                                borderRadius: BorderRadius.circular(32),
                                                                              ),
                                                                              border: OutlineInputBorder(),
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
                                                                            onTap:
                                                                                () {
                                                                              Get.back(result: false);
                                                                            },
                                                                            child:
                                                                                Container(
                                                                              height: screenheight / height_figma * 36,
                                                                              width: screenwidth / width_figma * 100,
                                                                              decoration: BoxDecoration(
                                                                                  borderRadius: BorderRadius.circular(
                                                                                      48),
                                                                                  gradient: LinearGradient(begin: Alignment.topRight, end: Alignment.bottomLeft, colors: [
                                                                                    rediligal,
                                                                                    whiteiligal
                                                                                  ])),
                                                                              child: Center(
                                                                                child: Text(
                                                                                  "انصراف",
                                                                                  style: TextStyle(
                                                                                    fontWeight: FontWeight.w700,
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
                                                                            onTap:
                                                                                () async {
                                                                              zibajoyanManSecondPage.changeHairCount(masterItem.items[index].id.toString(), tarcontroller.text).then((value) {
                                                                                if (value == true) {
                                                                                  setState(() {
                                                                                    firstPageClientProcessesController.fetchInformation();
                                                                                  });
                                                                                  Get.back();
                                                                                } else {
                                                                                  showDialog(
                                                                                    context: context,
                                                                                    builder: (context) => Dialog(
                                                                                      child: Container(
                                                                                        width: screenwidth / width_figma * 356,
                                                                                        height: screenheight / height_figma * 170,
                                                                                        decoration: BoxDecoration(
                                                                                          borderRadius: BorderRadius.circular(28),
                                                                                          color: Colors.white,
                                                                                        ),
                                                                                        child: Column(
                                                                                          children: [
                                                                                            SizedBox(
                                                                                              height: screenheight / height_figma * 41,
                                                                                            ),
                                                                                            Text(
                                                                                              "مشکلی پیش آمده دوباره تلاش کنید",
                                                                                              style: TextStyle(
                                                                                                color: fontcolor,
                                                                                                fontSize: 16,
                                                                                                fontWeight: FontWeight.w700,
                                                                                              ),
                                                                                            ),
                                                                                            SizedBox(
                                                                                              height: screenheight / height_figma * 39,
                                                                                            ),
                                                                                            Row(
                                                                                              mainAxisAlignment: MainAxisAlignment.center,
                                                                                              children: [
                                                                                                GestureDetector(
                                                                                                  onTap: () {
                                                                                                    Get.back(result: true);
                                                                                                  },
                                                                                                  child: Container(
                                                                                                    height: screenheight / height_figma * 36,
                                                                                                    width: screenwidth / width_figma * 100,
                                                                                                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(48), gradient: LinearGradient(begin: Alignment.topRight, end: Alignment.bottomLeft, colors: [LightBlue, White])),
                                                                                                    child: Center(
                                                                                                      child: Text(
                                                                                                        "باشه",
                                                                                                        style: TextStyle(
                                                                                                          fontWeight: FontWeight.w700,
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
                                                                                }
                                                                              });
                                                                            },
                                                                            child:
                                                                                Container(
                                                                              height: screenheight / height_figma * 36,
                                                                              width: screenwidth / width_figma * 100,
                                                                              decoration: BoxDecoration(
                                                                                  borderRadius: BorderRadius.circular(
                                                                                      48),
                                                                                  gradient: LinearGradient(begin: Alignment.topRight, end: Alignment.bottomLeft, colors: [
                                                                                    LightBlue,
                                                                                    White
                                                                                  ])),
                                                                              child: Center(
                                                                                child: Text(
                                                                                  "تایید",
                                                                                  style: TextStyle(
                                                                                    fontWeight: FontWeight.w700,
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
                                                            width:
                                                                (screenwidth *
                                                                        4) /
                                                                    10,
                                                            height: 48,
                                                            decoration:
                                                                BoxDecoration(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          10),
                                                              border:
                                                                  Border.all(
                                                                color:
                                                                    rediligal,
                                                                width: 2,
                                                              ),
                                                            ),
                                                            child: Center(
                                                              child: Text(
                                                                "تغییر تعداد تار مو",
                                                                style:
                                                                    TextStyle(
                                                                  fontSize: 14,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                  color:
                                                                      rediligal,
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          width: screenwidth /
                                                              width_figma *
                                                              14,
                                                        ),
                                                        GestureDetector(
                                                          onTap: () {
                                                            showDialog(
                                                              context: context,
                                                              builder:
                                                                  (context) =>
                                                                      Dialog(
                                                                child:
                                                                    Container(
                                                                  width: screenwidth /
                                                                      width_figma *
                                                                      356,
                                                                  height: screenheight /
                                                                      height_figma *
                                                                      170,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            28),
                                                                    color: Colors
                                                                        .white,
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
                                                                        style:
                                                                            TextStyle(
                                                                          color:
                                                                              fontcolor,
                                                                          fontSize:
                                                                              16,
                                                                          fontWeight:
                                                                              FontWeight.w700,
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
                                                                            onTap:
                                                                                () {
                                                                              Get.back(result: false);
                                                                            },
                                                                            child:
                                                                                Container(
                                                                              height: screenheight / height_figma * 36,
                                                                              width: screenwidth / width_figma * 100,
                                                                              decoration: BoxDecoration(
                                                                                  borderRadius: BorderRadius.circular(
                                                                                      48),
                                                                                  gradient: LinearGradient(begin: Alignment.topRight, end: Alignment.bottomLeft, colors: [
                                                                                    rediligal,
                                                                                    whiteiligal
                                                                                  ])),
                                                                              child: Center(
                                                                                child: Text(
                                                                                  "انصراف",
                                                                                  style: TextStyle(
                                                                                    fontWeight: FontWeight.w700,
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
                                                                            onTap:
                                                                                () {
                                                                              zibajoyanManSecondPage.acceptProcess(masterItem.items[index].id.toString()).then((value) {
                                                                                if (value == true) {
                                                                                  setState(() {
                                                                                    firstPageClientProcessesController.fetchInformation();
                                                                                  });
                                                                                  Get.back(result: true);
                                                                                } else {
                                                                                  showDialog(
                                                                                    context: context,
                                                                                    builder: (context) => Dialog(
                                                                                      child: Container(
                                                                                        width: screenwidth / width_figma * 356,
                                                                                        height: screenheight / height_figma * 170,
                                                                                        decoration: BoxDecoration(
                                                                                          borderRadius: BorderRadius.circular(28),
                                                                                          color: Colors.white,
                                                                                        ),
                                                                                        child: Column(
                                                                                          children: [
                                                                                            SizedBox(
                                                                                              height: screenheight / height_figma * 41,
                                                                                            ),
                                                                                            Text(
                                                                                              "مشکلی پیش آمده دوباره تلاش کنید",
                                                                                              style: TextStyle(
                                                                                                color: fontcolor,
                                                                                                fontSize: 16,
                                                                                                fontWeight: FontWeight.w700,
                                                                                              ),
                                                                                            ),
                                                                                            SizedBox(
                                                                                              height: screenheight / height_figma * 39,
                                                                                            ),
                                                                                            Row(
                                                                                              mainAxisAlignment: MainAxisAlignment.center,
                                                                                              children: [
                                                                                                GestureDetector(
                                                                                                  onTap: () {
                                                                                                    Get.off(MasterPage(), arguments: 0);
                                                                                                  },
                                                                                                  child: Container(
                                                                                                    height: screenheight / height_figma * 36,
                                                                                                    width: screenwidth / width_figma * 100,
                                                                                                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(48), gradient: LinearGradient(begin: Alignment.topRight, end: Alignment.bottomLeft, colors: [LightBlue, White])),
                                                                                                    child: Center(
                                                                                                      child: Text(
                                                                                                        "باشه",
                                                                                                        style: TextStyle(
                                                                                                          fontWeight: FontWeight.w700,
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
                                                                                }
                                                                              });
                                                                            },
                                                                            child:
                                                                                Container(
                                                                              height: screenheight / height_figma * 36,
                                                                              width: screenwidth / width_figma * 100,
                                                                              decoration: BoxDecoration(
                                                                                  borderRadius: BorderRadius.circular(
                                                                                      48),
                                                                                  gradient: LinearGradient(begin: Alignment.topRight, end: Alignment.bottomLeft, colors: [
                                                                                    LightBlue,
                                                                                    White
                                                                                  ])),
                                                                              child: Center(
                                                                                child: Text(
                                                                                  "تایید",
                                                                                  style: TextStyle(
                                                                                    fontWeight: FontWeight.w700,
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
                                                            width:
                                                                (screenwidth *
                                                                        4) /
                                                                    10,
                                                            height: 48,
                                                            decoration: BoxDecoration(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            10),
                                                                color:
                                                                    LightBlue),
                                                            child: Center(
                                                              child: Text(
                                                                "تایید اطلاعات کاشت",
                                                                style:
                                                                    TextStyle(
                                                                  fontSize: 14,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                  color:
                                                                      lightwhite,
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    )
                                                  : null,
                                        ),
                                      ],
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
                      }),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
