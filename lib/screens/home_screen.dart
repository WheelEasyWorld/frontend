import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:frontend/models/data.dart';
import 'package:frontend/screens/constants.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Color.fromRGBO(255, 255, 255, 1),
        child: Padding(
          padding: EdgeInsets.fromLTRB(17.w, 0, 0, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.fromLTRB(0, 65.w, 0, 15.w),
                width: 100.w,
                alignment: Alignment.centerLeft,
                child: Image.asset('assets/images/logo.png'),
              ),
              Container(
                  height: 600.h,
                  width: 340.w,
                  // padding: EdgeInsets.symmetric(vertical: 100.h),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    image: DecorationImage(
                        image: AssetImage("assets/images/home_background.png"),
                        fit: BoxFit.cover),
                  ),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 40.h,
                      ),
                      Image.asset(
                        'assets/images/weather.png',
                        width: 250.w,
                        fit: BoxFit.fill,
                      ),
                      SizedBox(
                        height: 80.h,
                      ),
                      Image.asset(
                        'assets/images/character_tire.png',
                        width: 230.w,
                        fit: BoxFit.fill,
                      ),
                      SizedBox(
                        height: 70.h,
                      ),
                      Image.asset(
                        'assets/images/home_message.png',
                        width: 290.w,
                        // height: 57.h,
                        fit: BoxFit.fill,
                      ),
                    ],
                  )), // Foreground widget here
            ],
          ),
        ));
  }
}
