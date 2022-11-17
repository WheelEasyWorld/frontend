import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:frontend/screens/constants.dart';

class ManagerHomeBody extends StatefulWidget {
  ManagerHomeBody({Key? key}) : super(key: key);

  @override
  State<ManagerHomeBody> createState() => _ManagerHomeBodyState();
}

class _ManagerHomeBodyState extends State<ManagerHomeBody> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
      height: 410.h,
      width: double.infinity,
      child: Column(
        children: [
          SizedBox(
            height: 50.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Icon(
                Icons.person_rounded,
                size: 35.h,
                color: Colors.white,
              ),
            ],
          ),
          SizedBox(
            height: 19.h,
          ),
          Container(
            padding: EdgeInsets.symmetric(vertical: 12, horizontal: 15),
            child: Text(
              '안녕하세요, 관리자님 :)\n현재 민원 3건 및 예약 5건이 있어요!',
              style: TextStyle(fontSize: 17),
            ),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(24),
                  bottomRight: Radius.circular(24),
                  topRight: Radius.circular(24)),
            ),
          ),
          SizedBox(
            height: 20.h,
          ),
          Image.asset(
            'assets/images/wheely_shadow.png',
            height: 171.h,
            width: 170.w,
            fit: BoxFit.fill,
          ),
        ],
      ),
      decoration: BoxDecoration(
        color: kYellowLightColor,
        borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(24), bottomRight: Radius.circular(24)),
      ),
    );
  }
}
