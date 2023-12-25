import 'dart:ui';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:clinic/features/technicians/NobatDehyJadid/controller/first_page_tech_processes_controller.dart';
import 'package:clinic/features/technicians/NobatDehyJadid/presentation/pages/nav_bar.dart';
import 'package:clinic/features/technicians/Shoroefarayand/controller/shoroe_farayand_page_1_controller.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:image_picker/image_picker.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';
import '../../../../../themes/colors.dart';
import '../../../NobatDehy/Controllers/nobat_dehy_main_controller.dart';
import '../../../NobatDehy/Controllers/nobat_dehy_page_2_controller.dart';
import '../../../NobatDehy/Models/nobat_tech.dart';
import '../../../Shoroefarayand/controller/shoroe_farayand_page_2_controller.dart';
import '../../../ZibajoyanMan/controllers/zibajo_page_2_controller.dart';
import '../../../ZibajoyanMan/models/each_approved_appointment.dart';
import '../../model/main_tech_model.dart';
import 'dart:io';


class TechMainPage extends StatefulWidget {
  const TechMainPage({Key? key}) : super(key: key);

  @override
  State<TechMainPage> createState() => _TechMainPageState();
}

class _TechMainPageState extends State<TechMainPage> {
  NobatDehiMainController listOfAppointmentController = Get.put(NobatDehiMainController());
  NobatDehiSecondPageController eachAppointment = Get.put(NobatDehiSecondPageController());
  FirstPageTechProcessesController firstPageTechProcessesController = Get.put(FirstPageTechProcessesController());
  ZibajoyanManSecondPage zibajoyanManSecondPage = Get.put(ZibajoyanManSecondPage());
  ShoroFarayandFirstPageController shoroefarayandfirstPageController = Get.put(ShoroFarayandFirstPageController());
  ShoroFarayandSecondPageController shoroefarayandsecondPageController = Get.put(ShoroFarayandSecondPageController());


  Future<void> _pickImage({required bool isBeforeProcess, required EachApprovedAppointments approvedAppointment}) async {
    if (approvedAppointment.beforeProcessImages.length < 3) {
      final ImagePicker picker = ImagePicker();
      final XFile? pickedFile = await showModalBottomSheet<XFile?>(
        context: context,
        builder: (BuildContext context) {
          return Container(
            height: 150,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                ListTile(
                  leading: Icon(Icons.camera),
                  title: Text('Take a photo'),
                  onTap: () async {
                    Navigator.pop(context,
                        await picker.pickImage(source: ImageSource.camera));
                  },
                ),
                ListTile(
                  leading: Icon(Icons.photo),
                  title: Text('Choose from gallery'),
                  onTap: () async {
                    Navigator.pop(context,
                        await picker.pickImage(source: ImageSource.gallery));
                  },
                ),
              ],
            ),
          );
        },
      );

      if (pickedFile != null) {
        String result = await shoroefarayandfirstPageController.addImage(
            File(pickedFile.path), true, approvedAppointment.id.toString());
        print("fsfdsfdfsdf");
        print(result);
        print("fsfdsfdfsdf");
        if (result != "") {
          var sth = new ProcessedImage(filename: result);
          setState(() {
            approvedAppointment.beforeProcessImages.add(sth);
          });
        }
      }
    }
  }

  Future<void> _pickImage_after({required bool isBeforeProcess, required EachApprovedAppointments approvedAppointment}) async {
    if (approvedAppointment.afterProcessImages.length < 3) {
      final ImagePicker picker = ImagePicker();
      final XFile? pickedFile = await showModalBottomSheet<XFile?>(
        context: context,
        builder: (BuildContext context) {
          return Container(
            height: 150,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                ListTile(
                  leading: Icon(Icons.camera),
                  title: Text('Take a photo'),
                  onTap: () async {
                    Navigator.pop(context,
                        await picker.pickImage(source: ImageSource.camera));
                  },
                ),
                ListTile(
                  leading: Icon(Icons.photo),
                  title: Text('Choose from gallery'),
                  onTap: () async {
                    Navigator.pop(context,
                        await picker.pickImage(source: ImageSource.gallery));
                  },
                ),
              ],
            ),
          );
        },
      );

      if (pickedFile != null) {
        await shoroefarayandfirstPageController.addImage(
            File(pickedFile.path), false, approvedAppointment.id.toString());
      }
    }
  }

  void _showImagePreview(int index , EachApprovedAppointments approvedAppointment) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          child: PhotoViewGallery.builder(
            itemCount: approvedAppointment.beforeProcessImages.length,
            builder: (context, galleryIndex) {
              return PhotoViewGalleryPageOptions.customChild(
                child: Stack(
                  children: [
                    Container(
                      width: double.infinity,
                      height: double.infinity,
                      child: _buildImageWidget(galleryIndex, approvedAppointment),
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

  void _showImagePreview_after(int index, EachApprovedAppointments approvedAppointment) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          child: PhotoViewGallery.builder(
            itemCount: approvedAppointment.afterProcessImages.length,
            builder: (context, galleryIndex) {
              return PhotoViewGalleryPageOptions.customChild(
                child: Stack(
                  children: [
                    Container(
                      width: double.infinity,
                      height: double.infinity,
                      child: _buildImageWidget_after(galleryIndex, approvedAppointment),
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

  Widget _buildImageWidget(int index, EachApprovedAppointments approvedAppointment) {
    if (approvedAppointment.beforeProcessImages.isNotEmpty &&
        index < approvedAppointment.beforeProcessImages.length) {
      if (approvedAppointment.beforeProcessImages[index] != null) {
        // Check if the corresponding image file has been fetched
        if (approvedAppointment.beforeProcessImages.length > index) {
          return CachedNetworkImage(
            imageUrl:
            'http://185.221.237.51/clinic/images/${approvedAppointment.beforeProcessImages[index].filename}',
            placeholder: (context, url) => _buildPlaceholder(),
            errorWidget: (context, url, error) => _buildPlaceholder(),
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

  Widget _buildImageWidget_after(int index, EachApprovedAppointments approvedAppointment) {
    if (approvedAppointment.afterProcessImages.isNotEmpty &&
        index < approvedAppointment.afterProcessImages.length) {
      if (approvedAppointment.afterProcessImages[index] != []) {
        // Check if the corresponding image file has been fetched
        if (approvedAppointment.afterProcessImages.length > index) {
          return CachedNetworkImage(
            imageUrl:
            'http://185.221.237.51/clinic/images/${approvedAppointment.afterProcessImages[index].filename}',
            placeholder: (context, url) => _buildPlaceholder(),
            errorWidget: (context, url, error) => _buildPlaceholder(),
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

  @override
  Widget build(BuildContext context) {
    final screenheight = MediaQuery.of(context).size.height;
    final height_figma = 926;
    final screenwidth = MediaQuery.of(context).size.width;
    final width_figma = 428;

    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        drawer: NavBar(),
        appBar: AppBar(
          iconTheme: IconThemeData(color: phonecolor),
          automaticallyImplyLeading: true,
          elevation: 0,
          backgroundColor: LightBlue,
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: screenheight / height_figma * 50,
              ),
              // Padding(
              //   padding: EdgeInsets.only(
              //     right: screenwidth / width_figma * 11,
              //    ),
              //    child: Image.asset("lib/features/Technecian/images/menu.png"),
              //  ),
              //SizedBox(
              //height: screenheight / height_figma * 33,
              //),
              Padding(
                padding: EdgeInsets.only(
                  right: screenwidth / width_figma * 11,
                ),
                child: Container(
                  width: screenwidth,
                  child: Text(
                    "نوبت های جدید",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w700,
                      color: fontcolor,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: screenheight / height_figma * 20,
              ),
              Padding(
                padding: EdgeInsets.only(right: screenwidth / width_figma * 13),
                child: Container(
                  height: screenheight / height_figma * 260,
                  child: FutureBuilder(
                      future: listOfAppointmentController.getTechAppointments(),
                      builder: (context, data) {
                        if (data.hasError) {
                          return Center(child: Text("${data.error}"));
                        } else if (data.hasData) {
                          var items = data.data as List<NobatTech>;
                          if (items.length == 0) {
                            return Center(
                              child: Text("نوبت جدیدی در حال حاضر وجود ندارد"),
                            );
                          } else {
                            return ListView.builder(
                                shrinkWrap: true,
                                scrollDirection: Axis.horizontal,
                                itemCount: items.length,
                                itemBuilder: (context, index) {
                                  return Padding(
                                    padding: const EdgeInsets.all(10),
                                    child: Container(
                                      width: screenwidth / width_figma * 190,
                                      height: screenheight / height_figma * 200,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(16),
                                        color: Colors.white,
                                      ),
                                      child: Padding(
                                        padding: EdgeInsets.only(
                                            right:
                                                screenwidth / width_figma * 7),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            SizedBox(
                                              height: screenheight /
                                                  height_figma *
                                                  14,
                                            ),
                                            Text(
                                              items[index].operation.toString(),
                                              style: TextStyle(
                                                fontWeight: FontWeight.w700,
                                                fontSize: 16,
                                                color: fontcolor,
                                              ),
                                            ),
                                            SizedBox(
                                              height: screenheight /
                                                  height_figma *
                                                  9,
                                            ),
                                            Text(
                                              items[index]
                                                  .visit_date
                                                  .toString(),
                                              style: TextStyle(
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w500,
                                                  color: fontcolor),
                                            ),
                                            SizedBox(
                                              height: screenheight /
                                                  height_figma *
                                                  9,
                                            ),
                                            Text(
                                              "زیباجو:",
                                              style: TextStyle(
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w500,
                                                  color: grayColorHome),
                                            ),
                                            SizedBox(
                                              height: screenheight /
                                                  height_figma *
                                                  4,
                                            ),
                                            Text(
                                              items[index]
                                                  .pationt_name
                                                  .toString(),
                                              style: TextStyle(
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w500,
                                                  color: fontcolor),
                                            ),
                                            SizedBox(
                                              height: screenheight /
                                                  height_figma *
                                                  9,
                                            ),
                                            Text(
                                              "کلینیک:",
                                              style: TextStyle(
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w500,
                                                  color: grayColorHome),
                                            ),
                                            SizedBox(
                                              height: screenheight /
                                                  height_figma *
                                                  4,
                                            ),
                                            Text(
                                              items[index].operation.toString(),
                                              style: TextStyle(
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w500,
                                                  color: fontcolor),
                                            ),
                                            SizedBox(
                                              height: screenheight /
                                                  height_figma *
                                                  10,
                                            ),
                                            Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                children: [
                                                  GestureDetector(
                                                    onTap: () {
                                                      showDialog(
                                                          context: context,
                                                          builder: (BuildContext
                                                              context) {
                                                            return FutureBuilder<bool>(
                                                                future: eachAppointment.acceptOrRejectProcess(true, items[index].id.toString()),
                                                                builder: (context, data) {
                                                                  if (data.connectionState == ConnectionState.waiting) {
                                                                    // Display a loading indicator while waiting for the future to complete
                                                                    return Center(
                                                                      child:
                                                                          CircularProgressIndicator(),
                                                                    );
                                                                  } else if (data
                                                                      .hasError) {
                                                                    // Handle any errors that might occur during the asynchronous call
                                                                    return Dialog(
                                                                      child: Text(
                                                                          "مشکلی به وجود آمد: ${data.error}"),
                                                                    );
                                                                  } else {
                                                                    // Future has completed, check the result
                                                                    bool
                                                                        result =
                                                                        data.data!;
                                                                    if (result ==
                                                                        false) {
                                                                      // Show the dialog if there is an issue
                                                                      return Dialog(
                                                                        child: Text(
                                                                            "مشکلی به وجود آمد"),
                                                                      );
                                                                    } else {
                                                                      // Return a custom designed Dialog if the result is true
                                                                      return Dialog(
                                                                        child:
                                                                            Container(
                                                                          width: screenwidth / width_figma * 356,
                                                                          height: 232,
                                                                          decoration:
                                                                              BoxDecoration(
                                                                            borderRadius:
                                                                                BorderRadius.circular(32),
                                                                            color:
                                                                                Colors.white,
                                                                          ),
                                                                          child:
                                                                              Column(
                                                                                crossAxisAlignment: CrossAxisAlignment.center,
                                                                                mainAxisAlignment: MainAxisAlignment.center,
                                                                            children: [
                                                                              SizedBox(
                                                                                height: 40,
                                                                              ),
                                                                              Image.asset("lib/features/technicians/ZibajoyanMan/Images/popped_up.png"),
                                                                              SizedBox(
                                                                                height: 8,
                                                                              ),
                                                                              Directionality(
                                                                                textDirection: TextDirection.rtl,
                                                                                child: Center(
                                                                                  child: Text(
                                                                                    "نوبت کاشت مو با موفقیت به لیست زیباجویان شما اضافه شد",
                                                                                    style: TextStyle(
                                                                                      color: fontcolor,
                                                                                      fontSize: 16,
                                                                                      fontWeight: FontWeight.w500,
                                                                                      fontFeatures: [
                                                                                        FontFeature('ss01', 1)
                                                                                      ],
                                                                                    ),
                                                                                    maxLines: null,
                                                                                    textAlign: TextAlign.center,
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                              SizedBox(
                                                                                height: 24,
                                                                              ),
                                                                              Center(
                                                                                child: Center(
                                                                                  child: GestureDetector(
                                                                                    onTap: () {
                                                                                      setState(() {
                                                                                        items.removeAt(index);
                                                                                        Get.back(result: true);
                                                                                      });
                                                                                    },
                                                                                    child: Container(
                                                                                      height: 36,
                                                                                      width: screenwidth / width_figma * 152,
                                                                                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(48), gradient: LinearGradient(begin: Alignment.topRight, end: Alignment.bottomLeft, colors: [LightBlue, White])),
                                                                                      child: Center(
                                                                                        child: Text(
                                                                                          "!متوجه شدم",
                                                                                          style: TextStyle(
                                                                                            fontWeight: FontWeight.w700,
                                                                                            fontSize: 12,
                                                                                            color: Colors.white,
                                                                                          ),
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        ),
                                                                      );
                                                                    }
                                                                  }
                                                                });
                                                          });
                                                    },
                                                    child: Container(
                                                      width: screenwidth /
                                                          width_figma *
                                                          100,
                                                      height: screenheight /
                                                          height_figma *
                                                          27,
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
                                                              floatingActionColor,
                                                              techaccept
                                                            ]),
                                                      ),
                                                      child: Center(
                                                        child: Text(
                                                          "قبول نوبت",
                                                          style: TextStyle(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w800,
                                                              fontSize: 12,
                                                              color:
                                                                  Colors.white),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    width: screenwidth /
                                                        width_figma *
                                                        30,
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
                                                            height: 170,
                                                            decoration: BoxDecoration(
                                                              borderRadius:
                                                              BorderRadius.circular(28),
                                                              color: Colors.white,
                                                            ),
                                                            child: Column(
                                                              children: [
                                                                SizedBox(
                                                                  height: 41,
                                                                ),
                                                                Directionality(
                                                                  textDirection:
                                                                  TextDirection.rtl,
                                                                  child: Center(
                                                                    child: Text(
                                                                      "آیا از رد نوبت  مطمعن هستید؟",
                                                                      style: TextStyle(
                                                                          color: fontcolor,
                                                                          fontSize: 16,
                                                                          fontWeight:
                                                                          FontWeight
                                                                              .w700,
                                                                          fontFeatures: [
                                                                            FontFeature(
                                                                                'ss01', 1),
                                                                          ]),
                                                                    ),
                                                                  ),
                                                                ),
                                                                SizedBox(
                                                                  height: 39,
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
                                                                        showDialog(
                                                                            context:
                                                                            context,
                                                                            builder:
                                                                                (BuildContext
                                                                            context) {
                                                                              return FutureBuilder<
                                                                                  bool>(
                                                                                  future: eachAppointment.acceptOrRejectProcess(false, items[index].id.toString()),
                                                                                  builder:
                                                                                      (context,
                                                                                      data) {
                                                                                    if (data.connectionState ==
                                                                                        ConnectionState
                                                                                            .waiting) {
                                                                                      // Display a loading indicator while waiting for the future to complete
                                                                                      return Center(
                                                                                        child:
                                                                                        CircularProgressIndicator(),
                                                                                      );
                                                                                    } else if (data
                                                                                        .hasError) {
                                                                                      // Handle any errors that might occur during the asynchronous call
                                                                                      return Dialog(
                                                                                        child:
                                                                                        Text("مشکلی به وجود آمد: ${data.error}"),
                                                                                      );
                                                                                    } else {
                                                                                      // Future has completed, check the result
                                                                                      bool
                                                                                      result =
                                                                                      data.data!;
                                                                                      if (result ==
                                                                                          false) {
                                                                                        // Show the dialog if there is an issue
                                                                                        return Dialog(
                                                                                          child: Text("مشکلی به وجود آمد"),
                                                                                        );
                                                                                      } else {
                                                                                        // Return a custom designed Dialog if the result is true
                                                                                        return Dialog(
                                                                                          child: Container(
                                                                                            width: screenwidth / width_figma * 356,
                                                                                            height: 232,
                                                                                            decoration: BoxDecoration(
                                                                                              borderRadius: BorderRadius.circular(50),
                                                                                              color: Colors.white,
                                                                                            ),
                                                                                            child: Padding(
                                                                                              padding: EdgeInsets.only(),
                                                                                              child: Column(
                                                                                                crossAxisAlignment: CrossAxisAlignment.center,
                                                                                                mainAxisAlignment: MainAxisAlignment.center,
                                                                                                children: [
                                                                                                  SizedBox(
                                                                                                    height: 40,
                                                                                                  ),
                                                                                                  Image.asset("lib/features/technicians/ZibajoyanMan/Images/popped_up.png"),
                                                                                                  SizedBox(
                                                                                                    height: 8,
                                                                                                  ),
                                                                                                  Directionality(
                                                                                                    textDirection: TextDirection.rtl,
                                                                                                    child: Center(
                                                                                                      child: Text(
                                                                                                        "با موفقیت حذف شد",
                                                                                                        style: TextStyle(
                                                                                                          color: fontcolor,
                                                                                                          fontSize: 16,
                                                                                                          fontWeight: FontWeight.w500,
                                                                                                          fontFeatures: [
                                                                                                            FontFeature('ss01', 1)
                                                                                                          ],
                                                                                                        ),
                                                                                                        maxLines: null,
                                                                                                        textAlign: TextAlign.center,
                                                                                                      ),
                                                                                                    ),
                                                                                                  ),
                                                                                                  SizedBox(
                                                                                                    height: 24,
                                                                                                  ),
                                                                                                  Center(
                                                                                                    child: Row(
                                                                                                      mainAxisAlignment: MainAxisAlignment.center,
                                                                                                      children: [
                                                                                                        GestureDetector(
                                                                                                          onTap: () {
                                                                                                            setState(() {
                                                                                                              Get.back(result: false);
                                                                                                              items.removeAt(index);
                                                                                                            });
                                                                                                          },
                                                                                                          child: Container(
                                                                                                            height: 36,
                                                                                                            width: screenwidth / width_figma * 142,
                                                                                                            decoration: BoxDecoration(borderRadius: BorderRadius.circular(48), gradient: LinearGradient(begin: Alignment.topRight, end: Alignment.bottomLeft, colors: [rediligal, whiteiligal])),
                                                                                                            child: Center(
                                                                                                              child: Text(
                                                                                                                "باشه",
                                                                                                                style: TextStyle(
                                                                                                                  fontWeight: FontWeight.w700,
                                                                                                                  fontSize: 12,
                                                                                                                  color: Colors.white,
                                                                                                                ),
                                                                                                              ),
                                                                                                            ),
                                                                                                          ),
                                                                                                        ),
                                                                                                      ],
                                                                                                    ),
                                                                                                  ),
                                                                                                ],
                                                                                              ),
                                                                                            ),
                                                                                          ),
                                                                                        );
                                                                                      }
                                                                                    }
                                                                                  });
                                                                            });
                                                                      },
                                                                      child: Container(
                                                                        height: 36,
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
                                                                            "رد نوبت",
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
                                                                        Get.back(
                                                                            result: true);
                                                                      },
                                                                      child: Container(
                                                                        height: 36,
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
                                                                  ],
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                      );
                                                    },
                                                    child: Text(
                                                      "رد نوبت",
                                                      style: TextStyle(
                                                          fontSize: 12,
                                                          fontWeight:
                                                              FontWeight.w800,
                                                          color: germeztiz),
                                                    ),
                                                  )
                                                ]),
                                          ],
                                        ),
                                      ),
                                    ),
                                  );
                                });
                          }
                        } else {
                          return Center(
                            child: CircularProgressIndicator(),
                          );
                        }
                      }),
                ),
              ),
              SizedBox(
                height: screenheight / height_figma * 34,
              ),
              Padding(
                padding: EdgeInsets.only(
                  right: screenwidth / width_figma * 11,
                ),
                child: Container(
                  width: screenwidth,
                  child: Text(
                    "نوبت های من",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w700,
                      color: fontcolor,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: screenheight / height_figma * 34,
              ),
              FutureBuilder(
                  future: firstPageTechProcessesController.getTechProcess(),
                  builder: (context, data){
                    if (data.hasError) {
                      return Center(child: Text("${data.error}"));
                    } else if (data.hasData) {
                      var TechItems = data.data as List<MainTechModel>;
                      if (TechItems.length == 0) {
                        return Center(
                          child: Text("نوبتی در حال حاضر وجود ندارد"),
                        );
                      } else {
                        return ListView.builder(
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemCount: TechItems.length,
                            itemBuilder: (context, index){
                              EachApprovedAppointments approvedAppointment = TechItems[index].approved.items as EachApprovedAppointments;
                              return Padding(
                                padding: EdgeInsets.only(
                                  right: screenwidth / width_figma * 42,
                                  left: screenwidth / width_figma * 42,
                                ),
                                child: Container(
                                  width: screenwidth / width_figma * 343,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(16),
                                  ),
                                  child: TechItems[index].approved.items[index].status == 'created' ? Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        height: 16,
                                      ),
                                      Center(
                                        child: Image.asset(
                                            "lib/features/technicians/ZibajoyanMan/Images/gol.png"),
                                      ),
                                      SizedBox(
                                        height: 8,
                                      ),
                                      Center(
                                        child: Text(TechItems[index].approved.items[index].operation,
                                          style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w700,
                                              color: fontcolor,
                                              fontFeatures: [
                                                FontFeature('ss01', 1),
                                              ]),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 8,
                                      ),
                                      Container(
                                        width: screenwidth / width_figma * 364,
                                        height: 36,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(36),
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
                                            TechItems[index].approved.items[index].visitDate,
                                            style: TextStyle(
                                                fontWeight: FontWeight.w700, fontSize: 14),
                                            colors: [LightBlue, LightBlue],
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 32,
                                      ),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Row(
                                                children: [
                                                  Image.asset(
                                                      "lib/features/technicians/ZibajoyanMan/Images/info.png"),
                                                  SizedBox(
                                                    width: screenwidth / width_figma * 5.5,
                                                  ),
                                                  Text(
                                                    "اطللاعات زیباجو",
                                                    style: TextStyle(
                                                        fontSize: 14,
                                                        fontWeight: FontWeight.w700,
                                                        color: phonecolor),
                                                  ),
                                                ],
                                              ),
                                              SizedBox(
                                                height: 16,
                                              ),
                                              Text(
                                                "زیباجو:",
                                                style: TextStyle(
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 14,
                                                  color: grayColorHome,
                                                ),
                                              ),
                                              SizedBox(
                                                height: 4,
                                              ),
                                              Text(
                                                TechItems[index].approved.items[index].pationtName,
                                                style: TextStyle(
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.w500,
                                                    color: fontcolor,
                                                    fontFeatures: [
                                                      FontFeature('ss01', 1),
                                                    ]),
                                              ),
                                              SizedBox(
                                                height: 32,
                                              ),
                                              Row(
                                                children: [
                                                  Image.asset(
                                                      "lib/features/technicians/ZibajoyanMan/Images/info.png"),
                                                  SizedBox(
                                                    width: screenwidth / width_figma * 5.5,
                                                  ),
                                                  Text(
                                                    "اطللاعات کاشت",
                                                    style: TextStyle(
                                                        fontSize: 14,
                                                        fontWeight: FontWeight.w700,
                                                        color: phonecolor,
                                                        fontFeatures: [
                                                          FontFeature('ss01', 1),
                                                        ]),
                                                  ),
                                                ],
                                              ),
                                              SizedBox(
                                                height: 16,
                                              ),
                                              Text(
                                                "عملیات مورد نیاز:",
                                                style: TextStyle(
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 14,
                                                  color: grayColorHome,
                                                ),
                                              ),
                                              SizedBox(
                                                height: 4,
                                              ),
                                              Text(
                                                TechItems[index].approved.items[index].operation,
                                                style: TextStyle(
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.w500,
                                                    color: fontcolor,
                                                    fontFeatures: [
                                                      FontFeature('ss01', 1),
                                                    ]),
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            width: screenwidth / width_figma * 113,
                                          ),
                                          Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              SizedBox(
                                                height: 34,
                                              ),
                                              Text(
                                                "شماره تماس:",
                                                style: TextStyle(
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 14,
                                                  color: grayColorHome,
                                                ),
                                              ),
                                              SizedBox(
                                                height: 4,
                                              ),
                                              Text(
                                                TechItems[index].approved.items[index].pationtPhoneNumber,
                                                style: TextStyle(
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.w500,
                                                    color: fontcolor),
                                              ),
                                              SizedBox(
                                                height: 72,
                                              ),
                                              Text(
                                                "تعداد تار مو:",
                                                style: TextStyle(
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 14,
                                                  color: grayColorHome,
                                                ),
                                              ),
                                              SizedBox(
                                                height: 4,
                                              ),
                                              Text(
                                                TechItems[index].approved.items[index].hairCount + "تار مو ",
                                                style: TextStyle(
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.w500,
                                                    color: fontcolor),
                                              ),
                                              SizedBox(
                                                height: 16,
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 32,
                                      ),
                                      GestureDetector(
                                        onTap: () {
                                          zibajoyanManSecondPage.startTheProcess(approvedAppointment);
                                        },
                                        child: Container(
                                          width: screenwidth / width_figma * 364,
                                          height: 36,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(48),
                                            gradient: LinearGradient(
                                                begin: Alignment.topRight,
                                                end: Alignment.bottomLeft,
                                                colors: [rediligal, whiteiligal]),
                                          ),
                                          child: Center(
                                            child: Text(
                                              "شروع فرایند کاشت",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w800,
                                                  fontSize: 14,
                                                  color: Colors.white,
                                                  fontFeatures: [
                                                    FontFeature('ss01', 1),
                                                  ]),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ) : TechItems[index].approved.items[index].status == 'started' ?
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        height: screenheight / height_figma * 16,
                                      ),
                                      Center(
                                        child: Image.asset(
                                            "lib/features/technicians/ZibajoyanMan/Images/gol.png"),
                                      ),
                                      SizedBox(
                                        height: screenheight / height_figma * 8,
                                      ),
                                      Center(
                                        child: Text(
                                          approvedAppointment.operation,
                                          style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w700,
                                              color: fontcolor,
                                              fontFeatures: [
                                                FontFeature('ss01', 1),
                                              ]),
                                        ),
                                      ),
                                      SizedBox(
                                        height: screenheight / height_figma * 8,
                                      ),
                                      Container(
                                        width: screenwidth / width_figma * 364,
                                        height: screenheight / height_figma * 36,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(36),
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
                                            approvedAppointment.visitDate,
                                            style:
                                            TextStyle(fontWeight: FontWeight.w700, fontSize: 14),
                                            colors: [LightBlue, LightBlue],
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: screenheight / height_figma * 32,
                                      ),
                                      Center(
                                        child: Text(
                                          "تار موی مورد نیاز برای کاشت:" +
                                              approvedAppointment.hairCount +
                                              " تار مو",
                                          style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w700,
                                              color: fontcolor,
                                              fontFeatures: [
                                                FontFeature('ss01', 1),
                                              ]),
                                        ),
                                      ),
                                      SizedBox(
                                        height: screenheight / height_figma * 48,
                                      ),
                                      Text(
                                        "افزودن تصویر قبل از کاشت:",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w700,
                                            fontSize: 14,
                                            color: Colors.black,
                                            fontFeatures: [
                                              FontFeature('ss01', 1),
                                            ]),
                                      ),
                                      SizedBox(
                                        height: screenheight / height_figma * 10,
                                      ),

                                      Container(
                                        padding: EdgeInsets.only(left: 10, right: 10),
                                        height: 120,
                                        child: GridView.builder(
                                          physics: NeverScrollableScrollPhysics(),
                                          shrinkWrap: false,
                                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                            crossAxisCount: 3,
                                            crossAxisSpacing: 3.0,
                                            mainAxisSpacing: 3.0,
                                          ),
                                          itemCount: approvedAppointment.beforeProcessImages.length +
                                              (approvedAppointment.beforeProcessImages.length < 3
                                                  ? 1
                                                  : 0),
                                          itemBuilder: (context, index) {
                                            if (index ==
                                                approvedAppointment.beforeProcessImages.length) {
                                              return DottedBorder(
                                                padding: EdgeInsets.all(5),
                                                borderType: BorderType.RRect,
                                                radius: Radius.circular(20),
                                                dashPattern: [10, 10],
                                                color: Color(0xffDDDDDD),
                                                strokeWidth: 2,
                                                child: Center(
                                                  child: ElevatedButton(
                                                    onPressed: () =>
                                                        _pickImage(isBeforeProcess: true, approvedAppointment: approvedAppointment),
                                                    style: ElevatedButton.styleFrom(
                                                      elevation: 0,
                                                      backgroundColor: Color(0xffEEEEEE),
                                                    ),
                                                    child: Text(
                                                      "آپلود+",
                                                      style: TextStyle(
                                                          fontSize: 10,
                                                          color: Color.fromARGB(255, 128, 114, 114)),
                                                    ),
                                                  ),
                                                ),
                                              );
                                            }
                                            return Stack(
                                              children: [
                                                GestureDetector(
                                                  onTap: () => _showImagePreview(index, approvedAppointment),
                                                  child: _buildImageWidget(index, approvedAppointment),
                                                ),
                                                if (approvedAppointment.beforeProcessImages[index] !=
                                                    [])
                                                  Positioned(
                                                    top: 0,
                                                    right: 0,
                                                    child: IconButton(
                                                      icon: Icon(Icons.close),
                                                      onPressed: () async {
                                                        bool result =
                                                        await shoroefarayandfirstPageController
                                                            .deleteImage(
                                                          approvedAppointment
                                                              .beforeProcessImages[index].filename,
                                                          true,
                                                          approvedAppointment.id.toString(),
                                                        );

                                                        if (result == true) {
                                                          setState(() {
                                                            approvedAppointment.beforeProcessImages
                                                                .removeAt(index);
                                                          });
                                                        }
                                                      },
                                                    ),
                                                  ),
                                              ],
                                            );
                                          },
                                        ),
                                      ),
                                      // Inja bayad Imgage picker bezari
                                      Text(
                                        "افزودن تصویر بعد از کاشت:",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w700,
                                            fontSize: 14,
                                            color: Colors.black,
                                            fontFeatures: [
                                              FontFeature('ss01', 1),
                                            ]),
                                      ),
                                      SizedBox(
                                        height: screenheight / height_figma * 10,
                                      ),
                                      Container(
                                        padding: EdgeInsets.only(left: 10, right: 10),
                                        height: 120,
                                        child: GridView.builder(
                                          physics: NeverScrollableScrollPhysics(),
                                          shrinkWrap: false,
                                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                            crossAxisCount: 3,
                                            crossAxisSpacing: 4.0,
                                            mainAxisSpacing: 4.0,
                                          ),
                                          itemCount: approvedAppointment.afterProcessImages.length +
                                              (approvedAppointment.afterProcessImages.length < 3
                                                  ? 1
                                                  : 0),
                                          itemBuilder: (context, index) {
                                            if (index ==
                                                approvedAppointment.afterProcessImages.length) {
                                              return DottedBorder(
                                                padding: EdgeInsets.all(5),
                                                borderType: BorderType.RRect,
                                                radius: Radius.circular(20),
                                                dashPattern: [10, 10],
                                                color: Color(0xffDDDDDD),
                                                strokeWidth: 2,
                                                child: Center(
                                                  child: ElevatedButton(
                                                    onPressed: () =>
                                                        _pickImage_after(isBeforeProcess: false, approvedAppointment: approvedAppointment),
                                                    style: ElevatedButton.styleFrom(
                                                      elevation: 0,
                                                      backgroundColor: Color(0xffEEEEEE),
                                                    ),
                                                    child: Text(
                                                      "آپلود+",
                                                      style: TextStyle(
                                                          fontSize: 10,
                                                          color: Color.fromARGB(255, 128, 114, 114)),
                                                    ),
                                                  ),
                                                ),
                                              );
                                            }
                                            return Stack(
                                              children: [
                                                GestureDetector(
                                                  onTap: () => _showImagePreview_after(index, approvedAppointment),
                                                  child: _buildImageWidget_after(index, approvedAppointment),
                                                ),
                                                if (approvedAppointment.afterProcessImages[index] !=
                                                    [])
                                                  Positioned(
                                                    top: 0,
                                                    right: 0,
                                                    child: IconButton(
                                                      icon: Icon(Icons.close),
                                                      onPressed: () async {
                                                        bool result =
                                                        await shoroefarayandfirstPageController
                                                            .deleteImage(
                                                          approvedAppointment
                                                              .afterProcessImages[index].filename,
                                                          false,
                                                          approvedAppointment.id.toString(),
                                                        );

                                                        if (result == true) {
                                                          setState(() {
                                                            approvedAppointment.afterProcessImages
                                                                .removeAt(index);
                                                          });
                                                        }
                                                      },
                                                    ),
                                                  ),
                                              ],
                                            );
                                          },
                                        ),
                                      ),
                                      SizedBox(
                                        height: screenheight / height_figma * 10,
                                      ),
                                      GestureDetector(
                                        onTap: () {
                                          shoroefarayandfirstPageController
                                              .endProcess(approvedAppointment);
                                        },
                                        child: Container(
                                          width: screenwidth / width_figma * 364,
                                          height: screenheight / height_figma * 36,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(48),
                                            gradient: LinearGradient(
                                                begin: Alignment.topRight,
                                                end: Alignment.bottomLeft,
                                                colors: [rediligal, whiteiligal]),
                                          ),
                                          child: Center(
                                            child: Text(
                                              "پایان فرایند کاشت",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w800,
                                                  fontSize: 14,
                                                  color: Colors.white,
                                                  fontFeatures: [
                                                    FontFeature('ss01', 1),
                                                  ]),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ) : Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        height: screenheight / height_figma * 16,
                                      ),
                                      Center(
                                        child: Image.asset(
                                            "lib/features/technicians/ZibajoyanMan/Images/gol.png"),
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
                                              color: fontcolor,
                                              fontFeatures: [
                                                FontFeature('ss01', 1),
                                              ]),
                                        ),
                                      ),
                                      SizedBox(
                                        height: screenheight / height_figma * 32,
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(
                                          // right: screenwidth / width_figma * 62,
                                          // left: screenwidth / width_figma * 62,
                                        ),
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "قبل از کاشت مو:",
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
                                              padding: EdgeInsets.only(left: 10, right: 10),
                                              height: 120,
                                              child: approvedAppointment
                                                  .beforeProcessImages.isNotEmpty
                                                  ? GridView.builder(
                                                physics: NeverScrollableScrollPhysics(),
                                                shrinkWrap: false,
                                                gridDelegate:
                                                SliverGridDelegateWithFixedCrossAxisCount(
                                                  crossAxisCount: approvedAppointment
                                                      .beforeProcessImages.length,
                                                  crossAxisSpacing: 3.0,
                                                  mainAxisSpacing: 3.0,
                                                ),
                                                itemCount: approvedAppointment
                                                    .beforeProcessImages.length +
                                                    (approvedAppointment.beforeProcessImages
                                                        .length <
                                                        3
                                                        ? 1
                                                        : 0),
                                                itemBuilder: (context, index) {
                                                  return Stack(
                                                    children: [
                                                      GestureDetector(
                                                        onTap: () =>
                                                            _showImagePreview(index, approvedAppointment),
                                                        child: _buildImageWidget(index, approvedAppointment),
                                                      ),
                                                    ],
                                                  );
                                                },
                                              )
                                                  : Container(),
                                            ),
                                            SizedBox(
                                              height: screenheight / height_figma * 24,
                                            ),
                                            Text(
                                              "بعد از کاشت مو:",
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
                                              padding: EdgeInsets.only(left: 10, right: 10),
                                              height: 120,
                                              child: approvedAppointment
                                                  .afterProcessImages.isNotEmpty
                                                  ? GridView.builder(
                                                physics: NeverScrollableScrollPhysics(),
                                                shrinkWrap: false,
                                                gridDelegate:
                                                SliverGridDelegateWithFixedCrossAxisCount(
                                                  crossAxisCount: approvedAppointment
                                                      .afterProcessImages.length,
                                                  crossAxisSpacing: 3.0,
                                                  mainAxisSpacing: 3.0,
                                                ),
                                                itemCount: approvedAppointment
                                                    .afterProcessImages.length +
                                                    (approvedAppointment
                                                        .afterProcessImages.length <
                                                        3
                                                        ? 1
                                                        : 0),
                                                itemBuilder: (context, index) {
                                                  return Stack(
                                                    children: [
                                                      GestureDetector(
                                                        onTap: () =>
                                                            _showImagePreview_after(index, approvedAppointment),
                                                        child:
                                                        _buildImageWidget_after(index, approvedAppointment),
                                                      ),
                                                    ],
                                                  );
                                                },
                                              )
                                                  : Container(),
                                            ),
                                          ],
                                        ),
                                      ),

                                      SizedBox(
                                        height: screenheight / height_figma * 32,
                                      ),

                                      Text(
                                        "آیا در فرایند کاشت مو به مشکل خوردید",
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w700,
                                            color: fontcolor,
                                            fontFeatures: [
                                              FontFeature('ss01', 1),
                                            ]),
                                      ),
                                      SizedBox(
                                        height: screenheight / height_figma * 16,
                                      ),
                                      Text(
                                        "توضیحات خود را وارد کنید",
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500,
                                            color: fontcolor,
                                            fontFeatures: [
                                              FontFeature('ss01', 1),
                                            ]),
                                      ),
                                      SizedBox(
                                        height: screenheight / height_figma * 4,
                                      ),
                                      Container(
                                        // width: screenwidth / width_figma * 380,
                                        // height: screenheight / height_figma * 111,
                                        // padding: EdgeInsets.symmetric(
                                        //     vertical: screenheight / height_figma * 111),

                                        child: TextField(
                                          textAlign: TextAlign.right,
                                          textAlignVertical: TextAlignVertical.top,
                                          decoration: InputDecoration(
                                            contentPadding: EdgeInsets.symmetric(
                                                vertical: screenheight / height_figma * 111),
                                            hintText: "    توضیحات",
                                            hintStyle: TextStyle(
                                                fontWeight: FontWeight.w500,
                                                fontSize: 14,
                                                color: phonecolor,
                                                fontFeatures: [
                                                  FontFeature('ss01', 1),
                                                ]),
                                            alignLabelWithHint: true,
                                            border: OutlineInputBorder(
                                              borderRadius: BorderRadius.circular(16),
                                              borderSide: BorderSide(
                                                color: SendagainColorwhite,
                                                width: 2,
                                              ),
                                            ),
                                            enabledBorder: OutlineInputBorder(
                                              borderSide:
                                              BorderSide(color: outlineborder, width: 2),
                                              borderRadius: BorderRadius.circular(16),
                                            ),
                                          ),
                                        ),
                                      ),
                                      // Inja bayad Imgage picker bezari
                                      SizedBox(
                                        height: screenheight / height_figma * 34,
                                      ),
                                      GestureDetector(
                                        onTap: () async {
                                          shoroefarayandsecondPageController.saveProcess(approvedAppointment).then((value) {
                                            if (value == true) {
                                              showDialog(
                                                context: context,
                                                builder: (context) => Dialog(
                                                  child: Container(
                                                    width: screenwidth / width_figma * 356,
                                                    height: 200,
                                                    decoration: BoxDecoration(
                                                      borderRadius: BorderRadius.circular(32),
                                                      color: Colors.white,
                                                    ),
                                                    child: Column(
                                                      children: [
                                                        SizedBox(
                                                          height:
                                                          screenheight / height_figma * 40,
                                                        ),
                                                        Image.asset(
                                                            "lib/features/technicians/ZibajoyanMan/Images/popped_up.png"),
                                                        SizedBox(
                                                          height: screenheight / height_figma * 8,
                                                        ),
                                                        Directionality(
                                                          textDirection: TextDirection.rtl,
                                                          child: Center(
                                                            child: Text(
                                                              "کاشت موی شما با موفقیت ثبت شد",
                                                              style: TextStyle(
                                                                  color: fontcolor,
                                                                  fontSize: 16,
                                                                  fontWeight: FontWeight.w500,
                                                                  fontFeatures: [
                                                                    FontFeature('ss01', 1),
                                                                  ]),
                                                            ),
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          height:
                                                          screenheight / height_figma * 46,
                                                        ),
                                                        Center(
                                                          child: Row(
                                                            mainAxisAlignment:
                                                            MainAxisAlignment.center,
                                                            children: [
                                                              GestureDetector(
                                                                onTap: () {
                                                                  // Get.back(result: false);
                                                                },
                                                                child: Container(
                                                                  height: screenheight /
                                                                      height_figma *
                                                                      36,
                                                                  width: screenwidth /
                                                                      width_figma *
                                                                      142,
                                                                  decoration: BoxDecoration(
                                                                      borderRadius:
                                                                      BorderRadius.circular(
                                                                          48),
                                                                      gradient: LinearGradient(
                                                                          begin:
                                                                          Alignment.topRight,
                                                                          end: Alignment
                                                                              .bottomLeft,
                                                                          colors: [
                                                                            rediligal,
                                                                            whiteiligal
                                                                          ])),
                                                                  child: Center(
                                                                    child: Text(
                                                                      "سوابق",
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
                                                                width:
                                                                screenwidth / width_figma * 8,
                                                              ),
                                                              GestureDetector(
                                                                onTap: () {
                                                                },
                                                                child: Container(
                                                                  height: screenheight /
                                                                      height_figma *
                                                                      36,
                                                                  width: screenwidth /
                                                                      width_figma *
                                                                      152,
                                                                  decoration: BoxDecoration(
                                                                      borderRadius:
                                                                      BorderRadius.circular(
                                                                          48),
                                                                      gradient: LinearGradient(
                                                                          begin:
                                                                          Alignment.topRight,
                                                                          end: Alignment
                                                                              .bottomLeft,
                                                                          colors: [
                                                                            LightBlue,
                                                                            White
                                                                          ])),
                                                                  child: Center(
                                                                    child: Text(
                                                                      "!متوجه شدم",
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
                                          // width: screenwidth / width_figma * 364,
                                          height: screenheight / height_figma * 36,

                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(48),
                                            gradient: LinearGradient(
                                                begin: Alignment.topRight,
                                                end: Alignment.bottomLeft,
                                                colors: [rediligal, whiteiligal]),
                                          ),
                                          child: Center(
                                            child: Text(
                                              "ثبت نهایی",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w800,
                                                  fontSize: 14,
                                                  color: Colors.white,
                                                  fontFeatures: [
                                                    FontFeature('ss01', 1),
                                                  ]),
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: screenheight / height_figma * 34,
                                      ),
                                    ],
                                  ),
                                ),
                              );
                        });
                      }
                    } else {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    }
              })
            ],
          ),
        ),
      ),
    );
  }
}
