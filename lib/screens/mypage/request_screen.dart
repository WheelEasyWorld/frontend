import 'package:flutter/material.dart';
import 'package:frontend/models/data.dart';
import 'package:frontend/screens/constants.dart';
import 'package:frontend/widgets/app_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RequestScreen extends StatelessWidget {
  const RequestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppbar("민원 모아보기"),
      body: SafeArea(
        child: ListView.builder(
          padding: EdgeInsets.all(15.w),
          itemCount: data["request"].length,
          itemBuilder: (context, index) {
            return Card(
              elevation: 3,
              margin: EdgeInsets.only(bottom: 15.h),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.r),
              ),
              color: Colors.grey.shade200,
              child: Padding(
                padding: EdgeInsets.all(10.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          data["request"][index]["type"],
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 16.sp,
                          ),
                        ),
                        Container(
                          width: 48.w,
                          height: 21.h,
                          decoration: BoxDecoration(
                            color: (data["request"][index]["status"] == "처리중")
                                ? kPinkColor
                                : kGreenColor,
                            borderRadius:
                                BorderRadius.all(Radius.circular(30.r)),
                          ),
                          child: Center(
                            child: Text(
                              data["request"][index]["status"],
                              style: TextStyle(
                                  color: Colors.white, fontSize: 10.sp),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 14.h),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.place,
                          color: Colors.grey,
                          size: 22.h,
                        ),
                        Text(
                          data["request"][index]["address"],
                          textAlign: TextAlign.left,
                          style: TextStyle(fontSize: 14.sp),
                        ),
                      ],
                    ),
                    SizedBox(height: 11.h),
                    Text(
                      data["request"][index]["date"] ?? "####.##.##. ##:##",
                      style: TextStyle(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w200,
                      ),
                    )
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
