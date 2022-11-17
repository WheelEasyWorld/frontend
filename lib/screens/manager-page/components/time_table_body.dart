import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:frontend/screens/constants.dart';

class TimeTableBody extends StatefulWidget {
  TimeTableBody({Key? key}) : super(key: key);

  @override
  State<TimeTableBody> createState() => _TimeTableBodyState();
}

class _TimeTableBodyState extends State<TimeTableBody> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 30.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Time Table',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          Text(
            '01 November 2022, Tuesday',
            style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: Color(0xff908f8c)),
          ),
          SizedBox(
            height: 70.h,
          ),
          Container(
            height: 2.h,
            width: double.infinity,
            color: kGreyColor,
          ),
          SizedBox(
            height: 60.h,
          ),
          _TimeDetail(
              "07:45", Color(0xFFE9EAF4), "보도블럭 불량", "대구광역시 중구 동성로2가 160-1"),
          SizedBox(
            height: 30.h,
          ),
          _TimeDetail("13:13", Color(0xFFFFEEEA), "휠체어가 다니기 좁은 인도",
              "대구광역시 중구 성내1동 68-1")
        ],
      ),
    );
  }

  Widget _TimeDetail(
      String _time, Color _backcolor, String _detail, String _address) {
    return Container(
        width: double.infinity,
        height: 60.h,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              _time,
              style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.bold,
                  color: Color(0xff908f8c)),
            ),
            Container(
              padding: EdgeInsets.all(11.0),
              width: 250.w,
              decoration: BoxDecoration(
                color: _backcolor,
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
              ),
              child: Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(100.0),
                    child: Image.asset(
                      'assets/images/default_profile.png',
                      height: 25.h,
                    ),
                  ),
                  SizedBox(
                    width: 20.w,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        _detail,
                        style: TextStyle(
                          fontSize: 11,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                      Text(
                        _address,
                        style: TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ],
        ));
  }
}
