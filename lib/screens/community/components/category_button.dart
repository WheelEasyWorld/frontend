import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:frontend/screens/constants.dart';

class CategoryButton extends StatelessWidget {
  final int num;
  final int selectedCategoryNum;
  final String title;
  final Function changeButton;

  const CategoryButton(
      this.num, this.selectedCategoryNum, this.title, this.changeButton,
      {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      highlightColor: Color.fromARGB(85, 255, 232, 227),
      splashColor: Colors.transparent,
      borderRadius: BorderRadius.circular(15.0),
      onTap: () {
        changeButton(num);
      },
      child: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.all(0),
        width: 80.w,
        height: 30.h,
        decoration: BoxDecoration(
          border: Border.all(
            width: 2,
            color: num == selectedCategoryNum ? kCoralColor : kGreyColor,
          ),
          borderRadius: BorderRadius.all(Radius.circular(25.0)),
        ),
        child: Text(
          title,
          style: TextStyle(
              fontSize: 12, color: Colors.black, fontWeight: FontWeight.w500),
        ),
      ),
    );
  }
}
