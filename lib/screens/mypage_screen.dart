import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:frontend/screens/constants.dart';


class MyPageScreen extends StatelessWidget {
  const MyPageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.w),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(15.w, 35.h, 15.w, 35.h),
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 50.w,
                      child: Image.asset('assets/images/profile.png'),
                    ),
                    SizedBox(width: 30.w),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '김민지 님',
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 16.sp,
                          ),
                        ),
                        SizedBox(height: 12.h),
                        Text(
                          '대구 북구',
                          style: TextStyle(
                            fontSize: 14.sp,
                            color: Colors.black45,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              const Divider(),
              Container(
                padding: EdgeInsets.all(14.w),
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.08),
                  borderRadius: BorderRadius.all(Radius.circular(10.r)),
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '민원 모아보기',
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 16.sp,
                          ),
                        ),
                        const Icon(Icons.add),
                      ],
                    ),
                    Row(
                      children: [
                        Card(
                          child: Padding(
                            padding: EdgeInsets.all(8.w),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Icon(
                                      Icons.place,
                                      color: Colors.grey,
                                      size: 25.w,
                                    ),
                                    Text(
                                      '대구 북구\n경대로',
                                      style: TextStyle(fontSize: 12.sp),
                                    ),
                                  ],
                                ),
                                Container(
                                  padding:
                                      EdgeInsets.fromLTRB(12.w, 3.h, 12.w, 3.h),
                                  decoration: BoxDecoration(
                                    color: kPinkColor,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(30.r)),
                                  ),
                                  child: Text(
                                    '처리중',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                                SizedBox(
                                  width: 90.w,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Flexible(
                                        child: RichText(
                                          overflow: TextOverflow.ellipsis,
                                          maxLines: 2,
                                          text: TextSpan(
                                            text: '일주일 전 도로공사후',
                                            style: TextStyle(
                                                fontWeight: FontWeight.w100),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
