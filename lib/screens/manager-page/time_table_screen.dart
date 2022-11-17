import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:frontend/screens/constants.dart';
import 'package:frontend/screens/manager-page/components/manager_home_button.dart';
import 'package:frontend/screens/manager-page/components/time_table_body.dart';

class TimeTableScreen extends StatefulWidget {
  TimeTableScreen({Key? key}) : super(key: key);

  @override
  State<TimeTableScreen> createState() => _TimeTableScreenState();
}

class _TimeTableScreenState extends State<TimeTableScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            color: kCoralColor,
            height: 50.h,
          ),
          TimeTableBody(),
          SizedBox(
            height: 250.h,
          ),
          ManagerHomeButton(),
        ],
      ),
    ));
  }
}
