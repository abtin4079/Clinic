import 'package:flutter/material.dart';
import 'package:clinic/features/Calender/jalali_table_calendar.dart';

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
    return Column(
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
      ],
    );
  }
}
