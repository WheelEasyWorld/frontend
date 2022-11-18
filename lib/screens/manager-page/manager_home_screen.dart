import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:frontend/screens/constants.dart';
import 'package:frontend/screens/manager-page/components/manager_calendar.dart';
import 'package:frontend/screens/manager-page/components/manager_home_body.dart';
import 'package:frontend/screens/manager-page/components/manager_home_button.dart';

class ManagerHomeScreen extends StatefulWidget {
  ManagerHomeScreen({Key? key}) : super(key: key);

  @override
  State<ManagerHomeScreen> createState() => _ManagerHomeScreenState();
}

class _ManagerHomeScreenState extends State<ManagerHomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [ManagerHomeBody(), ManagerCalendar(), ManagerHomeButton()],
        ),
      ),
    );
  }
}
