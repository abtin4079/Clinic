import 'package:clinic/features/Calender/calnerder.dart';
import 'package:flutter/material.dart';
import 'package:jalali_table_calendar/jalali_table_calendar.dart';
import 'package:shamsi_date/shamsi_date.dart';
import 'package:table_calendar/table_calendar.dart';

class CalenderV2 extends StatefulWidget {
  const CalenderV2({Key? key}) : super(key: key);

  @override
  State<CalenderV2> createState() => _CalenderV2State();
}

class _CalenderV2State extends State<CalenderV2> {
  Jalali jalali = Jalali.now();
  Gregorian gregorian = Gregorian.now();
  DateTime selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TableCalendar(
        focusedDay: gregorian.toDateTime(),
        firstDay: DateTime.utc(2000, 01, 01),
        lastDay: DateTime.utc(2030, 01 , 01),
      ),
    );
  }
}
