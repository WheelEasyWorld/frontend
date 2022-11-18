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
                        width: 230.w,
                        fit: BoxFit.fill,
                      ),
                      SizedBox(
                        height: 80.h,
                      ),
                      InkWell(
                        splashColor: Colors.transparent,
                        child: Image.asset(
                          'assets/images/wheely.png',
                          width: 230.w,
                          fit: BoxFit.fill,
                        ),
                        onTap: () => Get.toNamed('/chat_screen'),
                      ),
                      SizedBox(
                        height: 70.h,
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: Stack(children: [
                          Image.asset(
                            'assets/images/home_message.png',
                            width: 290.w,
                            // height: 57.h,
                            fit: BoxFit.fill,
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(8.5, 10, 0, 0),
                            child: Text(
                              '안녕하세요 김민지님!\n오늘은 어디로 가시나요? :)\n궁금한게 있으면 언제든지 저에게 물어보세요!',
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          )
                        ]),
                      )
                    ],
                  )), // Foreground widget here
            ],
          ),
        ));
  }
}
