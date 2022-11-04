import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SNSButton extends StatelessWidget {
  final Function()? onPressed;
  final String icon;
  final String label;
  final Color? textColor;
  final Color? btnColor;
  final BorderSide? borderSide;

  const SNSButton({
    required this.onPressed,
    required this.icon,
    required this.label,
    this.textColor,
    this.btnColor,
    this.borderSide,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton.icon(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          elevation: 0,
          backgroundColor: btnColor,
          padding: EdgeInsets.fromLTRB(20.w, 12.h, 20.w, 12.h),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30.r),
            side: borderSide ?? BorderSide.none,
          ),
        ),
        icon: Image.asset(
          'assets/images/sns/$icon.png',
          width: 35.w,
        ),
        label: SizedBox(
          width: double.infinity,
          child: Text(
            label,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: textColor ?? Colors.black,
              fontSize: 16.sp,
            ),
          ),
        ),
      ),
    );
  }
}
