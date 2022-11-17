import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:frontend/screens/constants.dart';
import 'package:get/get.dart';

class ManagerHomeButton extends StatefulWidget {
  const ManagerHomeButton({Key? key}) : super(key: key);

  @override
  State<ManagerHomeButton> createState() => _ManagerHomeButtonState();
}

class _ManagerHomeButtonState extends State<ManagerHomeButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 58.h,
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          IconButton(
            onPressed: () {
              Get.toNamed('/manager_home');
            },
            icon: Icon(Icons.home_rounded),
            color: kBrownColor,
            iconSize: 32.h,
          ),
        ],
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10), topRight: Radius.circular(10)),
      ),
    );
  }
}
