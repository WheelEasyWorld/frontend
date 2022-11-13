import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:frontend/screens/community/components/kakao_share_manager.dart';
import 'package:frontend/screens/constants.dart';

class StoreInformation extends StatefulWidget {
  const StoreInformation({Key? key}) : super(key: key);

  @override
  State<StoreInformation> createState() => _StoreInformationState();
}

class _StoreInformationState extends State<StoreInformation> {
  int like_count = 4;
  bool like_value = true;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Image.asset(
              'assets/images/detail01.png',
              width: 250.w,
            ),
            Column(
              children: [
                Image.asset(
                  'assets/images/detail02.png',
                  width: 125.w,
                ),
                Image.asset(
                  'assets/images/detail03.png',
                  width: 125.w,
                ),
              ],
            ),
          ],
        ),
        SizedBox(
          height: 20.h,
        ),
        Text(
          '츠바키노하나',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: 18.h,
        ),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 30.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset(
                "assets/images/first_floor.png",
                height: 55.h,
              ),
              Image.asset(
                "assets/images/threshold.png",
                height: 55.h,
              ),
              Image.asset(
                "assets/images/ramp.png",
                height: 55.h,
              ),
              Image.asset(
                "assets/images/table_seat.png",
                height: 55.h,
              ),
              Image.asset(
                "assets/images/elevator.png",
                height: 55.h,
              ),
              Image.asset(
                "assets/images/handicapped_wc.png",
                height: 55.h,
              ),
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.fromLTRB(0, 18.h, 0, 8.h),
          height: 2.h,
          width: 325.w,
          color: kGreyColor,
        ),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 60.w),
          // color: kBrownColor,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              InkWell(
                splashColor: Colors.transparent,
                child: like_value
                    ? Icon(
                        Icons.favorite_border_rounded,
                        size: 18.h,
                      )
                    : Icon(
                        Icons.favorite_rounded,
                        size: 18.h,
                        color: Color.fromARGB(255, 255, 26, 45),
                      ),
                onTap: () {
                  setState(() {
                    if (like_value == true) {
                      like_count += 1;
                    } else {
                      like_count -= 1;
                    }
                    like_value = !like_value;
                  });
                },
              ),
              Row(
                children: [
                  Text(
                    '좋아요',
                    style: TextStyle(
                        fontSize: 12, color: Color.fromARGB(100, 0, 0, 0)),
                  ),
                  SizedBox(
                    width: 7.w,
                  ),
                  Text(
                    like_count.toString(),
                    style: TextStyle(
                        fontSize: 12, color: Color.fromARGB(100, 0, 0, 0)),
                  )
                ],
              ),
              Container(
                height: 40.h,
                width: 2.w,
                color: kGreyColor,
              ),
              InkWell(
                splashColor: Colors.transparent,
                child: Icon(
                  Icons.share_rounded,
                  size: 18.h,
                ),
                onTap: () {
                  KakaoShareManager(
                      "대구 중구 문우관길 25 1층",
                      "츠바키노하나",
                      "https://github.com/WheelEasyWorld/frontend/blob/feature/community/assets/images/detail01.png?raw=true",
                      "1층 / 문턱있음 / 경사로 / 테이블석 / 엘리베이터 / 장애인화장실");
                },
              ),
              Text(
                '공유하기',
                style: TextStyle(
                    fontSize: 12, color: Color.fromARGB(100, 0, 0, 0)),
              ),
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.fromLTRB(0, 8.h, 0, 18.h),
          height: 10.h,
          width: double.infinity,
          color: kGreyColor,
        ),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 30.w),
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.fromLTRB(0, 0, 0, 18.h),
                child: Row(
                  children: [
                    Icon(
                      Icons.place_outlined,
                      size: 22.h,
                      color: kBrownColor,
                    ),
                    SizedBox(
                      width: 15.w,
                    ),
                    Text(
                      '대구 중구 문우관길 25 1층',
                      style: TextStyle(fontSize: 12),
                    )
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(0, 0, 0, 18.h),
                child: Row(
                  children: [
                    Icon(
                      Icons.call_rounded,
                      size: 22.h,
                      color: kBrownColor,
                    ),
                    SizedBox(
                      width: 15.w,
                    ),
                    Text(
                      '010-5682-6157',
                      style: TextStyle(fontSize: 12),
                    )
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(0, 0, 0, 18.h),
                child: Row(
                  children: [
                    Icon(
                      Icons.schedule_rounded,
                      size: 22.h,
                      color: kBrownColor,
                    ),
                    SizedBox(
                      width: 15.w,
                    ),
                    Text(
                      '월~목 18:00-22:00  금~토 12:00-22:00  (일 휴무)',
                      style: TextStyle(fontSize: 12),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.fromLTRB(0, 0, 0, 18.h),
          height: 10.h,
          width: double.infinity,
          color: kGreyColor,
        ),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 30.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                '사용자 리뷰',
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
              InkWell(
                splashColor: Colors.transparent,
                child: Icon(
                  Icons.add_rounded,
                  size: 25.h,
                  color: kBrownColor,
                ),
                onTap: () {},
              ),
            ],
          ),
        ),
      ],
    );
  }
}
