import 'package:flutter/material.dart';
import 'package:frontend/models/data.dart';
import 'package:frontend/screens/community/components/store_list.dart';
import 'package:frontend/screens/constants.dart';
import 'package:frontend/widgets/app_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HeartScreen extends StatelessWidget {
  const HeartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppbar("좋아요한 장소", true),
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.all(15.w),
          child: StoreList(data["heart"]),
        ),
      ),
    );
  }
}
