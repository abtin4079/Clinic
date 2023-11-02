import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:shamsi_date/shamsi_date.dart';
import 'package:jalali_table_calendar/jalali_table_calendar.dart';
class CalenderTable extends StatefulWidget {
  const CalenderTable({Key? key}) : super(key: key);

  @override
  State<CalenderTable> createState() => _CalenderTableState();
}

class _CalenderTableState extends State<CalenderTable> {
  @override
  Widget build(BuildContext context) {

    DateTime today = DateTime.now();
    Jalali today1 = Jalali.now();
    Jalali shamsiDate = Jalali.fromDateTime(today);
    DateTime gregorianDate = shamsiDate.toDateTime();
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 100,
            ),
            Card(
              margin: const EdgeInsets.all(8.0),
              elevation: 5.0,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
                side: BorderSide(width: 2.0),
              ),
              child: Directionality(
                textDirection: TextDirection.rtl,
                child: TableCalendar(
                  focusedDay: gregorianDate,
                  firstDay: DateTime.utc(2000, 01, 01),
                  lastDay: DateTime.utc(2030, 01, 01),
                  // default view when displayed
                  calendarFormat: CalendarFormat.month,
                  // default is Sunday but can be changed according to locale
                  startingDayOfWeek: StartingDayOfWeek.saturday,
                  // height between the day row and 1st date row, default is 16.0
                  daysOfWeekHeight: 32.0,
                  // height between the date rows, default is 52.0
                  rowHeight: 32.0,
                ),
              ),
            ),
            Text("${today.month}")
          ],
        ),
      ),

    );
  }
}

String gregorianToShamsi(DateTime gregorianDate) {
  Jalali jDate = Jalali.fromDateTime(gregorianDate);
  return '${jDate.year}/${jDate.month}/${jDate.day}';
}
