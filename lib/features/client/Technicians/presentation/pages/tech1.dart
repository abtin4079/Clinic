import 'package:clinic/features/client/Technicians/domain/entity.dart';
import 'package:clinic/features/client/Technicians/presentation/pages/add_tech.dart';
import 'package:clinic/features/client/Technicians/presentation/pages/tech_profile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../../../../../themes/colors.dart';

class Tech1 extends StatefulWidget {
  const Tech1({Key? key}) : super(key: key);

  @override
  State<Tech1> createState() => _Tech1State();
}

class _Tech1State extends State<Tech1> {
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
          "تکنسین ها",
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w700,
            color: fontcolor,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: screenwidth / width_figma * 396,
              height: screenheight / height_figma * 48,
              margin: EdgeInsets.only(
                left: screenwidth / width_figma * 15,
                right: screenwidth / width_figma * 15,
              ),
              child: TextField(
                textAlign: TextAlign.right,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(
                      vertical: screenwidth / width_figma * 10),
                  suffixIcon: Icon(Icons.search),
                  hintText: "جستجو در بین تکنسین ها",
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
            FutureBuilder(
              future: ReadJsonData2(),
              builder: (context, data) {
                if (data.hasError) {
                  return Text("${data.error}");
                } else if (data.hasData) {
                  var items2 = data.data as List<EntityTech>;
                  return ListView.builder(
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    itemCount: items2 == null ? 0 : items2.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          Get.to(TechProfile(),
                          arguments: [items2[index].id , items2[index].tech_name , items2[index].phone , items2[index].kodemelli]
                          );
                        },
                        child: Card(
                          child: Container(
                            width: screenwidth / width_figma * 396,
                            height: screenheight / height_figma * 126,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(16),
                                color: Colors.white),
                            child: Stack(
                              alignment: Alignment.topRight,
                              children: [
                                Padding(
                                  padding:  EdgeInsets.only(
                                    top: screenheight / height_figma * 13,
                                    right: screenwidth / width_figma * 122.5,
                                  ),
                                  child: Text(
                                    items2[index].tech_name.toString(),
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                      color: fontcolor,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding:  EdgeInsets.only(
                                    top: screenheight / height_figma * 48,
                                    right: screenwidth / width_figma * 122.5,
                                  ),
                                  child: Text(
                                    ":شماره تماس",
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                      color: grayColorHome,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding:  EdgeInsets.only(
                                    top: screenheight / height_figma * 48,
                                    right: screenwidth / width_figma * 232.5,
                                  ),
                                  child: Text(
                                    items2[index].phone.toString(),
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                      color: fontcolor,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding:  EdgeInsets.only(
                                    top: screenheight / height_figma * 81,
                                    right: screenwidth / width_figma * 122.5,
                                  ),
                                  child: Text(
                                    ":کد ملی",
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                      color: grayColorHome,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding:  EdgeInsets.only(
                                    top: screenheight / height_figma * 81,
                                    right: screenwidth / width_figma * 232.5,
                                  ),
                                  child: Text(
                                    items2[index].kodemelli.toString(),
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                      color: fontcolor,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding:  EdgeInsets.only(
                                    top: screenheight / height_figma * 13,
                                    right: screenwidth / width_figma * 12.5,
                                  ),
                                  child: Container(
                                    width: 100,
                                    height: 100,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(100),
                                      color: Colors.red
                                    ),
                                  ),
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
              },
            ),
            SizedBox(
              height: screenheight / height_figma * 15,
            ),
            GestureDetector(
              onTap: (){
                Get.to(AddTech());
              },
              child: Center(
                child: Container(
                  height: screenheight / height_figma * 50,
                  width: screenwidth / width_figma * 364,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(48),
                    gradient: LinearGradient(
                      begin: Alignment.topRight,
                      end: Alignment.bottomLeft,
                      colors: [
                        rediligal,
                        whiteiligal
                      ]
                    ),
                  ),
                  child: Center(
                    child: Text("افزودن تکنسین جدید", style: TextStyle(
                      fontWeight: FontWeight.w800,
                      fontSize: 14,
                      color: Colors.white
                    ),),
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
