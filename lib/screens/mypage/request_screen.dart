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
      appBar: buildAppbar("민원 모아보기", true),
      body: SafeArea(
        child: ListView.builder(
          padding: EdgeInsets.all(15.w),
          itemCount: data["request"].length,
          itemBuilder: (context, index) {
            return Container(
              margin: EdgeInsets.only(bottom: 10.h),
              decoration: BoxDecoration(
                border: Border.all(
                  width: 2,
                  color: kGreyColor,
                ),
                borderRadius: BorderRadius.all(Radius.circular(15.0)),
              ),
              child: Padding(
                padding: EdgeInsets.all(10.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          data["request"][index]["type"] ?? "type",
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 16.sp,
                          ),
                        ),
                        Container(
                          width: 60.w,
                          height: 25.h,
                          decoration: BoxDecoration(
                            color: (data["request"][index]["status"] == "처리중")
                                ? kPinkColor
                                : kGreenColor,
                            borderRadius:
                                BorderRadius.all(Radius.circular(30.r)),
                          ),
                          child: Center(
                            child: Text(
                              data["request"][index]["status"] ?? "status",
                              style: TextStyle(
                                  color: Colors.white, fontSize: 13.sp),
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
                          data["request"][index]["address"] ?? "address",
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
