import 'package:clinic/features/client/Technicians/Controller/create_tech_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../../../../../themes/colors.dart';

class AddTech extends StatefulWidget {
  const AddTech({Key? key}) : super(key: key);

  @override
  State<AddTech> createState() => _AddTechState();
}

class _AddTechState extends State<AddTech> {

  CreateTechController createTechController = Get.put(CreateTechController());

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
          "افزودن تکنسین جدید",
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w700,
            color: fontcolor,
          ),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Padding(
            padding: EdgeInsets.only(
              top: screenheight / height_figma * 62,
              right: screenwidth / width_figma * 15,
            ),
            child: Text("نام کامل", style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w700,
              color: fontcolor
            ),),
          ),
          SizedBox(
            height: screenheight / height_figma * 9,
          ),
          Container(
            width: screenwidth / width_figma * 396,
            height: screenheight / height_figma * 48,
            margin: EdgeInsets.only(
              left: screenwidth / width_figma * 15,
              right: screenwidth / width_figma * 15,
            ),
            child: TextField(
              controller: createTechController.nameController,
              textAlign: TextAlign.right,
              decoration: InputDecoration(
                hintText: " نام کامل تکنسین را وارد کنید ",
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
          Padding(
            padding: EdgeInsets.only(
              top: screenheight / height_figma * 7,
              right: screenwidth / width_figma * 15,
            ),
            child: Text("کد ملی", style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w700,
                color: fontcolor
            ),),
          ),
          SizedBox(
            height: screenheight / height_figma * 9,
          ),
          Container(
            width: screenwidth / width_figma * 396,
            height: screenheight / height_figma * 48,
            margin: EdgeInsets.only(
              left: screenwidth / width_figma * 15,
              right: screenwidth / width_figma * 15,
            ),
            child: TextField(
              controller: createTechController.cardIdController,
              textAlign: TextAlign.right,
              decoration: InputDecoration(
                hintText: " کد ملی تکنسین را وارد کنید ",
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
          Padding(
            padding: EdgeInsets.only(
              top: screenheight / height_figma * 7,
              right: screenwidth / width_figma * 15,
            ),
            child: Text("شماره تماس", style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w700,
                color: fontcolor
            ),),
          ),
          SizedBox(
            height: screenheight / height_figma * 9,
          ),
          Container(
            width: screenwidth / width_figma * 396,
            height: screenheight / height_figma * 48,
            margin: EdgeInsets.only(
              left: screenwidth / width_figma * 15,
              right: screenwidth / width_figma * 15,
            ),
            child: TextField(
              controller: createTechController.phoneController,
              textAlign: TextAlign.right,
              decoration: InputDecoration(
                hintText: " شماره تلفن معتبر تکنسین را وارد کنید ",
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
            height: screenheight / height_figma * 474,
          ),
          GestureDetector(
            onTap: (){
              createTechController.getNewTech();
            },
            child: Center(
              child: Container(
                width: screenwidth / width_figma * 330,
                height: screenheight / height_figma * 48,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: LightBlue,
                ),
                child: Center(
                  child: Text("ثبت تکنسین جدید", style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 14,
                    color: lightwhite
                  ),),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
