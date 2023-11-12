import 'package:flutter/material.dart';
import 'package:clinic/features/Calender/jalali_table_calendar.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import '../../../../../themes/colors.dart';

class HomeForTech extends StatefulWidget {
  const HomeForTech({Key? key}) : super(key: key);

  @override
  State<HomeForTech> createState() => _HomeForTechState();
}

DateTime today = DateTime.now();

class _HomeForTechState extends State<HomeForTech> {
  String _value = '';

  Future _selectDate() async {
    String? picked = await jalaliCalendarPicker(
        context: context,
        convertToGregorian: true,
        showTimePicker: false,
        hore24Format: true);
    if (picked != null) setState(() => _value = picked);
  }

  @override
  Widget build(BuildContext context) {
    final screenheight = MediaQuery.of(context).size.height;
    final height_figma = 926;
    final screenwidth = MediaQuery.of(context).size.width;
    final width_figma = 428;

    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(20),
            child: JalaliTableCalendar(
              showTimePicker: false,
              context: context,
              locale: Locale('fa'),
              // adding dates as rooz haye nobat
              events: {
                today: [],
                today.add(Duration(days: 1)): [],
                today.add(Duration(days: 2)): []
              },
            ),
          ),
          ElevatedButton(
            onPressed: _selectDate,
            child: const Text('نمایش تقویم'),
          ),
          Text(
            _value,
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: screenheight / height_figma * 16,
          ),
          Padding(
            padding: EdgeInsets.only(
              left: screenwidth / width_figma * 16,
              right: screenwidth / width_figma * 16,
            ),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: Colors.white,
              ),
              child: Directionality(
                textDirection: TextDirection.rtl,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                        top: screenheight / height_figma * 24,
                        right: screenwidth / width_figma * 24,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Image.asset(
                              "lib/features/client/Home/presentation/images/copy.png"),
                          SizedBox(
                            width: screenwidth / width_figma * 8,
                          ),
                          Text(
                            "فعالیت های اخبر",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w700,
                              color: fontcolor,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: screenheight / height_figma * 20,
                    ),
                    MasonryGridView.count(
                      crossAxisCount: 4,
                      mainAxisSpacing: 4,
                      crossAxisSpacing: 4,
                      itemBuilder: (context , index) {
                        return Container(
                          width: screenwidth / width_figma * 80,
                          height: screenheight / height_figma * 64,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(13.91),
                            color: phonecolor,
                          ),
                          child: Directionality(
                            textDirection: TextDirection.rtl,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("2", style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w800,
                                  color: fontcolor
                                ),),
                                Text("کاشت مو", style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w800,
                                  color: fontcolor
                                ),)
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
