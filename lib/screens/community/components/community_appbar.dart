import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:frontend/screens/constants.dart';
import 'package:get/get.dart';

PreferredSizeWidget CommunityAppbar() {
  return AppBar(
    backgroundColor: kCoralColor,
    elevation: 0,
    leading: IconButton(
      icon: Icon(Icons.arrow_back_ios),
      onPressed: () {
        Get.back();
      },
    ),
    title: Text(
      "Can Go 커뮤니티",
      style: TextStyle(
          color: Colors.white, fontSize: 19, fontWeight: FontWeight.w700),
    ),
    centerTitle: true,
  );
}
