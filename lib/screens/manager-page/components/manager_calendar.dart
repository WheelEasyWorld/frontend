import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:frontend/screens/constants.dart';
import 'package:get/get.dart';
import 'package:table_calendar/table_calendar.dart';

class ManagerCalendar extends StatefulWidget {
  ManagerCalendar({Key? key}) : super(key: key);

  @override
  State<ManagerCalendar> createState() => _ManagerCalendarState();
}

class _ManagerCalendarState extends State<ManagerCalendar> {
  DateTime selectedDay = DateTime(
    DateTime.now().year,
    DateTime.now().month,
    DateTime.now().day,
  );

  DateTime focusedDay = DateTime.now();

  Map<DateTime, List<Event>> events = {
    DateTime.utc(2022, 11, 1): [
      Event('김민지님의 민원'),
      Event('김은하님의 민원'),
    ],
    DateTime.utc(2022, 11, 10): [
      Event('이세은님의 민원'),
    ],
  };

  List<Event> _getEventsForDay(DateTime day) {
    return events[day] ?? [];
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 60),
      width: double.infinity,
      child: TableCalendar(
        firstDay: DateTime.utc(2020, 1, 1),
        lastDay: DateTime.utc(2030, 12, 31),
        focusedDay: DateTime.now(),
        headerStyle: HeaderStyle(
          titleCentered: true,
          formatButtonVisible: false,
        ),
        calendarStyle: CalendarStyle(
          isTodayHighlighted: true,
          todayDecoration:
              BoxDecoration(color: kBrownLightColor, shape: BoxShape.circle),
          selectedDecoration:
              BoxDecoration(color: kBrownColor, shape: BoxShape.circle),
          markerSize: 5.0,
          markerDecoration:
              BoxDecoration(color: kCoralColor, shape: BoxShape.circle),
          cellMargin: EdgeInsets.all(0.0),
          cellPadding: const EdgeInsets.all(0.0),
        ),
        eventLoader: _getEventsForDay,
        onDaySelected: (DateTime selectedDay, focusedDay) {
          setState(() {
            this.selectedDay = selectedDay;
            this.focusedDay = focusedDay;
          });
          Get.toNamed('/time_table');
        },
        selectedDayPredicate: (DateTime day) {
          return isSameDay(selectedDay, day);
        },
      ),
    );
  }
}

class Event {
  String title;
  Event(this.title);
}
