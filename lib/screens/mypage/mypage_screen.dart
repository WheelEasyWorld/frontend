import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:frontend/models/data.dart';
import 'package:frontend/screens/constants.dart';
import 'package:get/get.dart';

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
                padding: EdgeInsets.fromLTRB(15.w, 35.h, 15.w, 25.h),
                child: Row(
                  children: [
                    Column(
                      children: [
                        CircleAvatar(
                          radius: 50.w,
                          child: Image.asset('assets/images/profile.png'),
                        ),
                        TextButton(
                          onPressed: () {},
                          child: Text(
                            '사진변경',
                            style: TextStyle(
                              fontSize: 12.sp,
                              color: Colors.black54,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ),
                      ],
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
                        SizedBox(height: 8.h),
                        Text(
                          '대구 북구',
                          style: TextStyle(
                            fontSize: 14.sp,
                            color: Colors.black54,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              const Divider(),
              SizedBox(height: 15.h),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        buildCollection(
                          "민원 모아보기",
                          buildRequest(),
                          () => Get.toNamed('/mypage/request'),
                        ),
                        SizedBox(height: 15.h),
                        buildCollection(
                          "좋아요한 장소",
                          buildHeart(),
                          () {},
                        ),
                      ],
                    ),
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        '회원탈퇴',
                        style: TextStyle(
                          fontSize: 12.sp,
                          color: Colors.black54,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

List<Widget> buildHeart() {
  List<Widget> list = [];
  int itemCount = data["heart"].length;
  for (int i = 0; i < itemCount; i++) {
    list.add(SizedBox(
      width: 106.w,
      height: 135.h,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.r),
        ),
        child: Padding(
          padding: EdgeInsets.all(10.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10.r),
                child: Image.asset(
                  data["heart"][i]["img"],
                  width: 88.w,
                  height: 50.h,
                  fit: BoxFit.fill,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(
                    Icons.place,
                    color: Colors.grey,
                    size: 15.h,
                  ),
                  Flexible(
                    child: Text(
                      data["heart"][i]["name"],
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      textAlign: TextAlign.right,
                      style: TextStyle(fontSize: 12.sp),
                    ),
                  ),
                ],
              ),
              Flexible(
                child: Text(
                  data["heart"][i]["address"],
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style:
                      TextStyle(fontSize: 10.sp, fontWeight: FontWeight.w200),
                ),
              ),
            ],
          ),
        ),
      ),
    ));
  }

  for (int i = itemCount; i < 3; i++) {
    list.add(SizedBox(
        width: 106.w,
        height: 135.h,
        child: Card(
            elevation: 0,
            color: Colors.grey.withOpacity(0.5),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.r),
            ),
            child: Container())));
  }

  return list;
}

List<Widget> buildRequest() {
  List<Widget> list = [];
  int itemCount = data["request"].length;
  for (int i = 0; i < itemCount; i++) {
    list.add(SizedBox(
      width: 106.w,
      height: 135.h,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.r),
        ),
        child: Padding(
          padding: EdgeInsets.all(10.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(
                    Icons.place,
                    color: Colors.grey,
                    size: 22.h,
                  ),
                  SizedBox(width: 8.w),
                  Flexible(
                    child: Text(
                      data["request"][i]["address"],
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.right,
                      style: TextStyle(fontSize: 12.sp),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10.h),
              Container(
                width: 48.w,
                height: 21.h,
                decoration: BoxDecoration(
                  color: (data["request"][i]["status"] == "처리중")
                      ? kPinkColor
                      : kGreenColor,
                  borderRadius: BorderRadius.all(Radius.circular(30.r)),
                ),
                child: Center(
                  child: Text(
                    data["request"][i]["status"],
                    style: TextStyle(color: Colors.white, fontSize: 10.sp),
                  ),
                ),
              ),
              SizedBox(height: 10.h),
              Flexible(
                child: Text(
                  data["request"][i]["detail"],
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style:
                      TextStyle(fontSize: 10.sp, fontWeight: FontWeight.w200),
                ),
              ),
            ],
          ),
        ),
      ),
    ));
  }

  for (int i = itemCount; i < 3; i++) {
    list.add(SizedBox(
        width: 106.w,
        height: 135.h,
        child: Card(
            elevation: 0,
            color: Colors.grey.withOpacity(0.5),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.r),
            ),
            child: Container())));
  }

  return list;
}

Widget buildCollection(String title, dynamic item, Function()? onPressed) {
  return Card(
    elevation: 3,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10.r),
    ),
    color: Colors.grey.shade100,
    child: Padding(
      padding: EdgeInsets.all(10.w),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 14.sp,
                ),
              ),
              IconButton(
                padding: EdgeInsets.zero,
                constraints: const BoxConstraints(),
                onPressed: onPressed,
                icon: const Icon(Icons.add),
              ),
            ],
          ),
          SizedBox(height: 15.h),
          Row(
            children: item,
          )
        ],
      ),
    ),
  );
}
