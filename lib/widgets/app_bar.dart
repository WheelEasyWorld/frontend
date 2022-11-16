import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:frontend/screens/constants.dart';
import 'package:get/route_manager.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

PreferredSizeWidget buildAppbar(String label) {
  return AppBar(
    backgroundColor: kCoralColor,
    systemOverlayStyle: SystemUiOverlayStyle.light,
    elevation: 1.sp,
    leading: IconButton(
      icon: Icon(
        Icons.arrow_back_ios,
        size: 15.h,
        color: Colors.white,
      ),
      onPressed: () {
        Get.back();
      },
    ),
    title: Text(
      label,
      style: TextStyle(
        color: Colors.white,
        fontSize: 18.sp,
        fontWeight: FontWeight.w700,
      ),
    ),
    centerTitle: true,
  );
}
