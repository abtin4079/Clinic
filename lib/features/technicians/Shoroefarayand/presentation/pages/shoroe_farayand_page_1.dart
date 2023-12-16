import 'dart:ui';
import 'package:clinic/features/technicians/ZibajoyanMan/models/each_approved_appointment.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

import '../../../../../themes/colors.dart';
import '../../../../client/NavigationBar/Icons/navigation_bar_icons.dart';
import '../../../Home/presentation/pages/home_for_tech.dart';
import '../../../NavigationBar/Icons/tech_navigation_icons.dart';
import '../../../NavigationBar/navigation_bar_for_tech.dart';
import '../../../Profile/presentation/pages/profile_for_tech.dart';
import '../../../ZibajoyanMan/presentation/pages/zibajo_page_1.dart';
import 'package:clinic/features/technicians/Shoroefarayand/controller/shoroe_farayand_page_1_controller.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';

class ShoroyeFarayandPage1 extends StatefulWidget {
  const ShoroyeFarayandPage1({Key? key}) : super(key: key);

  @override
  State<ShoroyeFarayandPage1> createState() => _ShoroyeFarayandPage1State();
}

class _ShoroyeFarayandPage1State extends State<ShoroyeFarayandPage1> {
  ShoroFarayandFirstPageController shoroefarayandfirstPageController =
      Get.put(ShoroFarayandFirstPageController());
  int currenttab = 2;
  List<Widget> screens = [
    HomeForTech(),
    ProfileForTech(),
    ZibajoPage1(),
  ];

  final PageStorageBucket bucket = PageStorageBucket();
  Widget currentscreen = ShoroyeFarayandPage1();
  EachApprovedAppointments approvedAppointment =
      Get.arguments as EachApprovedAppointments;

  Future<void> _pickImage({required bool isBeforeProcess}) async {
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

  Future<void> _pickImage_after({required bool isBeforeProcess}) async {
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

  void _showImagePreview(int index) {
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
                      child: _buildImageWidget(galleryIndex),
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

  void _showImagePreview_after(int index) {
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
                      child: _buildImageWidget_after(galleryIndex),
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

  Widget _buildImageWidget(int index) {
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

  Widget _buildImageWidget_after(int index) {
    if (approvedAppointment.afterProcessImages.isNotEmpty &&
        index < approvedAppointment.afterProcessImages.length) {
      if (approvedAppointment.afterProcessImages[index] != null) {
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

    return Scaffold(
      backgroundColor: backgroundHome,
      appBar: AppBar(
        iconTheme: IconThemeData(color: phonecolor),
        backgroundColor: backgroundHome,
        elevation: 0,
        centerTitle: true,
        title: Text(
          "زیباجویان من",
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w700,
            color: fontcolor,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: Padding(
            padding: EdgeInsets.only(
              right: screenwidth / width_figma * 16,
              left: screenwidth / width_figma * 16,
              top: screenheight / screenwidth * 16,
              bottom: screenheight / height_figma * 16,
            ),
            // child: Container(
            //   // width: screenwidth / width_figma * 396,
            //   // height: screenheight / height_figma * 659,
            //   decoration: BoxDecoration(
            //       borderRadius: BorderRadius.circular(16), color: Colors.white),
            //   child: Padding(
            //     padding: EdgeInsets.only(
            //         // right: screenwidth / width_figma * 16,
            //         // left: screenwidth / width_figma * 16,
            //         ),
            child: Column(
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
                                  _pickImage(isBeforeProcess: true),
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
                            onTap: () => _showImagePreview(index),
                            child: _buildImageWidget(index),
                          ),
                          if (approvedAppointment.beforeProcessImages[index] !=
                              null)
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
                                  _pickImage_after(isBeforeProcess: false),
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
                            onTap: () => _showImagePreview_after(index),
                            child: _buildImageWidget_after(index),
                          ),
                          if (approvedAppointment.afterProcessImages[index] !=
                              null)
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
            ),
            //   ),
            // ),
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        child: Container(
          height: screenheight / height_figma * 96,
          child: Center(
            child: Padding(
              padding: EdgeInsets.only(
                  // left: screenwidth / width_figma * 24,
                  // right: screenwidth / width_figma * 23,
                  ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  currenttab == 0
                      ? MaterialButton(
                          minWidth: screenwidth / width_figma * 40,
                          onPressed: () {
                            setState(() {
                              currentscreen = ProfileForTech();
                              currenttab = 0;
                              Get.to(
                                Techpages(),
                                arguments: currenttab,
                              );
                            });
                          },
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                width: 36,
                                height: 36,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  gradient: LinearGradient(
                                    begin: Alignment.topLeft,
                                    end: Alignment.bottomRight,
                                    colors: [LightBlue, White],
                                  ),
                                ),
                                child: Icon(
                                  TechNavigation.profile,
                                  color: currenttab == 0
                                      ? Colors.white
                                      : phonecolor,
                                  size: 22,
                                ),
                              ),
                              GradientText(
                                "پروفایل من",
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                ),
                                colors: [
                                  LightBlue,
                                  White,
                                ],
                              )
                            ],
                          ),
                        )
                      : MaterialButton(
                          minWidth: screenwidth / width_figma * 40,
                          onPressed: () {
                            setState(() {
                              currentscreen = ProfileForTech();
                              currenttab = 0;
                              Get.to(
                                Techpages(),
                                arguments: currenttab,
                              );
                            });
                          },
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                width: 36,
                                height: 36,
                                child: Icon(
                                  TechNavigation.profile,
                                  color: currenttab == 0
                                      ? Colors.blue
                                      : Colors.grey,
                                ),
                              ),
                              Text(
                                "پروفایل من",
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  color: currenttab == 0
                                      ? Colors.blue
                                      : Colors.grey,
                                ),
                              )
                            ],
                          ),
                        ),
                  currenttab == 1
                      ? MaterialButton(
                          minWidth: screenwidth / width_figma * 40,
                          onPressed: () {
                            setState(() {
                              currentscreen = HomeForTech();
                              currenttab = 1;
                              Get.to(
                                Techpages(),
                                arguments: currenttab,
                              );
                            });
                          },
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                width: 36,
                                height: 36,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  gradient: LinearGradient(
                                    begin: Alignment.topLeft,
                                    end: Alignment.bottomRight,
                                    colors: [LightBlue, White],
                                  ),
                                ),
                                child: Icon(
                                  TechNavigation.nobat_dehi,
                                  color: currenttab == 1
                                      ? Colors.white
                                      : phonecolor,
                                  size: 22,
                                ),
                              ),
                              GradientText(
                                "نوبت دهی",
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                ),
                                colors: [
                                  LightBlue,
                                  White,
                                ],
                              )
                            ],
                          ),
                        )
                      : MaterialButton(
                          minWidth: screenwidth / width_figma * 40,
                          onPressed: () {
                            setState(() {
                              currentscreen = HomeForTech();
                              currenttab = 1;
                              Get.to(
                                Techpages(),
                                arguments: currenttab,
                              );
                            });
                          },
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                width: 36,
                                height: 36,
                                child: Icon(
                                  TechNavigation.nobat_dehi,
                                  color: currenttab == 1
                                      ? Colors.blue
                                      : Colors.grey,
                                ),
                              ),
                              Text(
                                "نوبت دهی",
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  color: currenttab == 1
                                      ? Colors.blue
                                      : Colors.grey,
                                ),
                              )
                            ],
                          ),
                        ),
                  currenttab == 2
                      ? MaterialButton(
                          minWidth: screenwidth / width_figma * 40,
                          onPressed: () {
                            setState(() {
                              currentscreen = ZibajoPage1();
                              currenttab = 2;
                              Get.to(
                                Techpages(),
                                arguments: currenttab,
                              );
                            });
                          },
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                width: 36,
                                height: 36,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  gradient: LinearGradient(
                                    begin: Alignment.topLeft,
                                    end: Alignment.bottomRight,
                                    colors: [LightBlue, White],
                                  ),
                                ),
                                child: Icon(
                                  NavigationBarIcons.tech,
                                  color: currenttab == 2
                                      ? Colors.white
                                      : phonecolor,
                                  size: 22,
                                ),
                              ),
                              GradientText(
                                "زیباجویان من",
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                ),
                                colors: [
                                  LightBlue,
                                  White,
                                ],
                              )
                            ],
                          ),
                        )
                      : MaterialButton(
                          minWidth: screenwidth / width_figma * 40,
                          onPressed: () {
                            setState(() {
                              currentscreen = ZibajoPage1();
                              currenttab = 2;
                              Get.to(
                                Techpages(),
                                arguments: currenttab,
                              );
                            });
                          },
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                width: 36,
                                height: 36,
                                child: Icon(
                                  NavigationBarIcons.tech,
                                  color: currenttab == 2
                                      ? Colors.blue
                                      : Colors.grey,
                                  size: 22,
                                ),
                              ),
                              Text(
                                "زیباجویان من",
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  color: currenttab == 2
                                      ? Colors.blue
                                      : Colors.grey,
                                ),
                              )
                            ],
                          ),
                        ),
                  currenttab == 3
                      ? MaterialButton(
                          minWidth: screenwidth / width_figma * 40,
                          onPressed: () {
                            setState(() {
                              currentscreen = HomeForTech();
                              currenttab = 3;
                              Get.to(
                                Techpages(),
                                arguments: currenttab,
                              );
                            });
                          },
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                width: 36,
                                height: 36,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  gradient: LinearGradient(
                                    begin: Alignment.topLeft,
                                    end: Alignment.bottomRight,
                                    colors: [LightBlue, White],
                                  ),
                                ),
                                child: Icon(
                                  NavigationBarIcons.khane,
                                  color: currenttab == 3
                                      ? Colors.white
                                      : phonecolor,
                                  size: 22,
                                ),
                              ),
                              GradientText(
                                "خانه",
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                ),
                                colors: [
                                  LightBlue,
                                  White,
                                ],
                              )
                            ],
                          ),
                        )
                      : MaterialButton(
                          minWidth: screenwidth / width_figma * 40,
                          onPressed: () {
                            setState(() {
                              currentscreen = HomeForTech();
                              currenttab = 3;
                              Get.to(
                                Techpages(),
                                arguments: currenttab,
                              );
                            });
                          },
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                width: 36,
                                height: 36,
                                child: Icon(
                                  NavigationBarIcons.khane,
                                  color: currenttab == 3
                                      ? Colors.blue
                                      : Colors.grey,
                                  size: 22,
                                ),
                              ),
                              Text(
                                "خانه",
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  color: currenttab == 3
                                      ? Colors.blue
                                      : Colors.grey,
                                ),
                              )
                            ],
                          ),
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
