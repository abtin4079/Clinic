import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../../../../../themes/colors.dart';
import 'package:clinic/features/client/Home/Models/list_of_process.dart';
import 'package:clinic/features/client/Home/Controller/process_controller.dart';
import 'package:clinic/features/client/Home/Models/full_process.dart';
import 'dart:ui';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:clinic/features/client/NavigationBar/navigation_bar.dart';
import 'package:clinic/features/client/Home/presentation/pages/home.dart';

class PlantInfo extends StatefulWidget {
  const PlantInfo({Key? key}) : super(key: key);

  @override
  State<PlantInfo> createState() => _PlantInfoState();
}

class _PlantInfoState extends State<PlantInfo> {
  TextEditingController tarcontroller = TextEditingController();
  ItemProcess appointment = Get.arguments as ItemProcess;
  ProcessController zibajoyanManSecondPage = Get.put(ProcessController());
  void _showImagePreview(FullProcess item, int index) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          child: PhotoViewGallery.builder(
            itemCount: item.beforeProcessImages.length,
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

  Widget _buildImageWidget(FullProcess item, int index) {
    if (item.beforeProcessImages.isNotEmpty &&
        index < item.beforeProcessImages.length) {
      if (item.beforeProcessImages[index] != null) {
        // Check if the corresponding image file has been fetched
        if (item.beforeProcessImages.length > index) {
          return CircleAvatar(
            radius: 50,
            backgroundColor: Colors.grey[300],
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: CachedNetworkImage(
                imageUrl:
                    'http://185.221.237.51/clinic/images/${item.beforeProcessImages[index].filename}',
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

  Widget _buildImageWidget_after(FullProcess item, int index) {
    if (item.afterProcessImages.isNotEmpty &&
        index < item.afterProcessImages.length) {
      if (item.afterProcessImages[index] != null) {
        // Check if the corresponding image file has been fetched
        if (item.afterProcessImages.length > index) {
          return CircleAvatar(
            radius: 50,
            backgroundColor: Colors.grey[300],
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: CachedNetworkImage(
                imageUrl:
                    'http://185.221.237.51/clinic/images/${item.afterProcessImages[index].filename}',
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

  void _showImagePreview_after(FullProcess item, int index) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          child: PhotoViewGallery.builder(
            itemCount: item.afterProcessImages.length,
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
  Widget build(BuildContext context) {
    final screenheight = MediaQuery.of(context).size.height;
    final height_figma = 926;
    final screenwidth = MediaQuery.of(context).size.width;
    final width_figma = 428;

    // var items = Get.arguments;

    return Scaffold(
      backgroundColor: backgroundHome,
      appBar: AppBar(
        iconTheme: IconThemeData(color: phonecolor),
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
        child: FutureBuilder(
            future: zibajoyanManSecondPage
                .getProcessById(appointment.id.toString()),
            builder: (context, data) {
              if (data.hasError) {
                return Text("${data.error}");
              } else if (data.hasData) {
                var item = data.data as FullProcess;
                if (item == null) {
                  return Center(
                    child: Text("مشکلی به وجود آمده است"),
                  );
                }
                return Padding(
                  padding: EdgeInsets.all(screenheight / screenwidth * 10),
                  child: Center(
                    child: Container(
                      width: screenwidth / width_figma * 396,
                      //  height: screenheight / height_figma * 950,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(16)),
                      child: Column(
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
                              item.operation,
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
                                  color: (item.status == "created")
                                      ? graycoloranjamnashode
                                      : (item.status == "started")
                                          ? rediligal
                                          : (item.status == "ended")
                                              ? rediligal
                                              : (item.status == "saved")
                                                  ? processColor
                                                  : SendagainColorblue),
                              child: Center(
                                child: Text(
                                  (item.status == "created")
                                      ? "انجام نشده"
                                      : (item.status == "started")
                                          ? "در حال انجام"
                                          : (item.status == "ended")
                                              ? "در حال انجام"
                                              : (item.status == "saved")
                                                  ? "در انتظار تایید"
                                                  : "تایید شده",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w800,
                                      fontSize: 14,
                                      color: (item.status == "created")
                                          ? blackwhite
                                          : Colors.white),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: screenheight / height_figma * 16,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: EdgeInsets.only(
                                    // left: screenwidth / width_figma * 59,
                                    // right: screenwidth / width_figma * 59,
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
                                      item.pationt_phone_number,
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
                                      item.hair_count,
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
                                      item.visit_date,
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
                                      item.end_date,
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500,
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
                                      item.pationt_name,
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
                                      item.operation,
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
                                      item.technecian_name,
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
                                      item.start_date,
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
                                right: screenwidth / width_figma * 62,
                                left: screenwidth / width_figma * 62,
                                top: 20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
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
                                  height: screenheight / height_figma * 16,
                                ),
                                Container(
                                  child: item.beforeProcessImages.isNotEmpty
                                      ? Container(
                                          padding: EdgeInsets.only(
                                              left: 10, right: 10),
                                          height: 120,
                                          child: item.beforeProcessImages
                                                  .isNotEmpty
                                              ? GridView.builder(
                                                  physics:
                                                      NeverScrollableScrollPhysics(),
                                                  shrinkWrap: false,
                                                  gridDelegate:
                                                      SliverGridDelegateWithFixedCrossAxisCount(
                                                    crossAxisCount: item
                                                        .beforeProcessImages
                                                        .length,
                                                    crossAxisSpacing: 3.0,
                                                    mainAxisSpacing: 3.0,
                                                  ),
                                                  itemCount: item
                                                          .beforeProcessImages
                                                          .length +
                                                      (item.beforeProcessImages
                                                                  .length <
                                                              3
                                                          ? 1
                                                          : 0),
                                                  itemBuilder:
                                                      (context, index) {
                                                    return Stack(
                                                      children: [
                                                        GestureDetector(
                                                          onTap: () =>
                                                              _showImagePreview(
                                                                  item, index),
                                                          child:
                                                              _buildImageWidget(
                                                                  item, index),
                                                        ),
                                                      ],
                                                    );
                                                  },
                                                )
                                              : Container(),
                                        )
                                      : Center(
                                          child: Text("عکسی اضافه نشده است"),
                                        ),
                                ),
                                SizedBox(
                                  height: screenheight / height_figma * 24,
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
                                  height: screenheight / height_figma * 16,
                                ),
                                Container(
                                  child: item.afterProcessImages.isNotEmpty
                                      ? Container(
                                          padding: EdgeInsets.only(
                                              left: 10, right: 10),
                                          height: 120,
                                          child: item
                                                  .afterProcessImages.isNotEmpty
                                              ? GridView.builder(
                                                  physics:
                                                      NeverScrollableScrollPhysics(),
                                                  shrinkWrap: false,
                                                  gridDelegate:
                                                      SliverGridDelegateWithFixedCrossAxisCount(
                                                    crossAxisCount: item
                                                        .afterProcessImages
                                                        .length,
                                                    crossAxisSpacing: 3.0,
                                                    mainAxisSpacing: 3.0,
                                                  ),
                                                  itemCount: item
                                                          .afterProcessImages
                                                          .length +
                                                      (item.afterProcessImages
                                                                  .length <
                                                              3
                                                          ? 1
                                                          : 0),
                                                  itemBuilder:
                                                      (context, index) {
                                                    return Stack(
                                                      children: [
                                                        GestureDetector(
                                                          onTap: () =>
                                                              _showImagePreview_after(
                                                                  item, index),
                                                          child:
                                                              _buildImageWidget_after(
                                                                  item, index),
                                                        ),
                                                      ],
                                                    );
                                                  },
                                                )
                                              : Container(),
                                        )
                                      : Center(
                                          child: Text("عکسی اضافه نشده است"),
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
                            child: item.description.isEmpty
                                ? Center(child: Text("!توضیحاتی وجود ندارد"))
                                : Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Text(
                                        item.description,
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
                          Padding(
                            padding: EdgeInsets.only(
                              top: screenheight / height_figma * 16,
                            ),
                            child: item.status == "saved"
                                ? Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      GestureDetector(
                                        onTap: () {
                                          showDialog(
                                            context: context,
                                            builder: (context) => Dialog(
                                              child: Container(
                                                width: screenwidth /
                                                    width_figma *
                                                    356,
                                                height: screenheight /
                                                    height_figma *
                                                    265,
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
                                                              BorderRadius
                                                                  .circular(32),
                                                          color: backgroundHome,
                                                        ),
                                                        child: TextField(
                                                          controller:
                                                              tarcontroller,
                                                          textAlign:
                                                              TextAlign.center,
                                                          decoration:
                                                              InputDecoration(
                                                            hintText:
                                                                'تعداد تار مو',
                                                            hintStyle:
                                                                TextStyle(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                              fontSize: 14,
                                                              color: phonecolor,
                                                            ),
                                                            focusedBorder:
                                                                OutlineInputBorder(
                                                              borderSide: BorderSide(
                                                                  color: Colors
                                                                      .black),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          48),
                                                            ),
                                                            enabledBorder:
                                                                OutlineInputBorder(
                                                              borderSide:
                                                                  BorderSide(
                                                                      color:
                                                                          outlineborder,
                                                                      width: 2),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          32),
                                                            ),
                                                            border:
                                                                OutlineInputBorder(),
                                                          ),
                                                          keyboardType:
                                                              TextInputType
                                                                  .number,
                                                        )),
                                                    SizedBox(
                                                      height: screenheight /
                                                          height_figma *
                                                          55,
                                                    ),
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        GestureDetector(
                                                          onTap: () {
                                                            Get.back(
                                                                result: false);
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
                                                                        .circular(
                                                                            48),
                                                                gradient: LinearGradient(
                                                                    begin: Alignment
                                                                        .topRight,
                                                                    end: Alignment.bottomLeft,
                                                                    colors: [
                                                                      rediligal,
                                                                      whiteiligal
                                                                    ])),
                                                            child: Center(
                                                              child: Text(
                                                                "انصراف",
                                                                style:
                                                                    TextStyle(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w700,
                                                                  fontSize: 14,
                                                                  color: Colors
                                                                      .white,
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
                                                          onTap: () async {
                                                            zibajoyanManSecondPage
                                                                .changeHairCount(
                                                                    item.id
                                                                        .toString(),
                                                                    tarcontroller
                                                                        .text)
                                                                .then((value) {
                                                              if (value ==
                                                                  true) {
                                                                Get.back();
                                                              } else {
                                                                showDialog(
                                                                  context:
                                                                      context,
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
                                                                            BorderRadius.circular(28),
                                                                        color: Colors
                                                                            .white,
                                                                      ),
                                                                      child:
                                                                          Column(
                                                                        children: [
                                                                          SizedBox(
                                                                            height: screenheight /
                                                                                height_figma *
                                                                                41,
                                                                          ),
                                                                          Text(
                                                                            "مشکلی پیش آمده دوباره تلاش کنید",
                                                                            style:
                                                                                TextStyle(
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
                                                                        .circular(
                                                                            48),
                                                                gradient: LinearGradient(
                                                                    begin: Alignment
                                                                        .topRight,
                                                                    end: Alignment.bottomLeft,
                                                                    colors: [
                                                                      LightBlue,
                                                                      White
                                                                    ])),
                                                            child: Center(
                                                              child: Text(
                                                                "تایید",
                                                                style:
                                                                    TextStyle(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w700,
                                                                  fontSize: 14,
                                                                  color: Colors
                                                                      .white,
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
                                          width: (screenwidth * 4) / 10,
                                          height: 48,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10),
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
                                                width: screenwidth /
                                                    width_figma *
                                                    356,
                                                height: screenheight /
                                                    height_figma *
                                                    170,
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
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        GestureDetector(
                                                          onTap: () {
                                                            Get.back(
                                                                result: false);
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
                                                                        .circular(
                                                                            48),
                                                                gradient: LinearGradient(
                                                                    begin: Alignment
                                                                        .topRight,
                                                                    end: Alignment.bottomLeft,
                                                                    colors: [
                                                                      rediligal,
                                                                      whiteiligal
                                                                    ])),
                                                            child: Center(
                                                              child: Text(
                                                                "انصراف",
                                                                style:
                                                                    TextStyle(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w700,
                                                                  fontSize: 14,
                                                                  color: Colors
                                                                      .white,
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
                                                            zibajoyanManSecondPage
                                                                .acceptProcess(item
                                                                    .id
                                                                    .toString())
                                                                .then((value) {
                                                              if (value ==
                                                                  true) {
                                                                Get.back(
                                                                    result:
                                                                        true);
                                                              } else {
                                                                showDialog(
                                                                  context:
                                                                      context,
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
                                                                            BorderRadius.circular(28),
                                                                        color: Colors
                                                                            .white,
                                                                      ),
                                                                      child:
                                                                          Column(
                                                                        children: [
                                                                          SizedBox(
                                                                            height: screenheight /
                                                                                height_figma *
                                                                                41,
                                                                          ),
                                                                          Text(
                                                                            "مشکلی پیش آمده دوباره تلاش کنید",
                                                                            style:
                                                                                TextStyle(
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
                                                                                  Get.off(ClientPage(), arguments: 0);
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
                                                                        .circular(
                                                                            48),
                                                                gradient: LinearGradient(
                                                                    begin: Alignment
                                                                        .topRight,
                                                                    end: Alignment.bottomLeft,
                                                                    colors: [
                                                                      LightBlue,
                                                                      White
                                                                    ])),
                                                            child: Center(
                                                              child: Text(
                                                                "تایید",
                                                                style:
                                                                    TextStyle(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w700,
                                                                  fontSize: 14,
                                                                  color: Colors
                                                                      .white,
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
                                          width: (screenwidth * 4) / 10,
                                          height: 48,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(10),
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
                                  )
                                : null,
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              } else {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
            }),
      ),
    );
  }
}
