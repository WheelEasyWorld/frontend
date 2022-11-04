import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RoundedButton extends StatelessWidget {
  final Function()? onPressed;
  final String label;
  final EdgeInsets? padding;
  final double? radius;
  final Color? textColor;
  final Color? btnColor;
  final double? fontSize;
  final double? elevation;
  final FontWeight? fontWeight;

  const RoundedButton({
    required this.onPressed,
    required this.label,
    this.padding,
    this.radius,
    this.textColor,
    this.btnColor,
    this.fontSize,
    this.elevation,
    this.fontWeight,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        elevation: elevation,
        backgroundColor: btnColor,
        padding: padding,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(radius ?? 10.r),
        ),
      ),
      child: Text(
        label,
        style: TextStyle(
            color: textColor,
            fontSize: fontSize,
            fontWeight: fontWeight),
      ),
    );
  }
}
