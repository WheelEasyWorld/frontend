import 'package:flutter/material.dart';
import 'package:frontend/models/data.dart';
import 'package:frontend/screens/constants.dart';
import 'package:frontend/widgets/app_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HeartScreen extends StatelessWidget {
  const HeartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppbar("좋아요한 장소"),
      body: SafeArea(
        child: ListView.builder(
          padding: EdgeInsets.all(15.w),
          itemCount: data["heart"].length,
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
                padding: EdgeInsets.all(15.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.place,
                              color: Colors.grey,
                              size: 22.h,
                            ),
                            Text(
                              data["heart"][index]["name"],
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                              textAlign: TextAlign.right,
                              style: TextStyle(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(width: 40.w),
                        IconButton(
                          padding: EdgeInsets.zero,
                          constraints: const BoxConstraints(),
                          onPressed: () {},
                          icon: Icon(
                            Icons.favorite_rounded,
                            color: Colors.red,
                            size: 22.h,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 14.h),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(10.r),
                          child: Image.asset(
                            data["heart"][index]["img"],
                            width: 120.w,
                            height: 120.h,
                            fit: BoxFit.fill,
                          ),
                        ),
                        // Column(
                        //   children: buildFacility(),
                        // ),
                        SizedBox(
                          width: 180.w,
                          height: 116.h,
                          child: GridView(
                            padding: EdgeInsets.all(10.w),
                            shrinkWrap: true,
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              childAspectRatio: 3 / 1,
                            ),
                            children: buildFacility(index),
                          ),
                        ),
                      ],
                    ),
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

List<Widget> buildFacility(int i) {
  List<Widget> list = [];
  for (int j = 0; j < data["heart"][i]["facility"].length; j++) {
    list.add(Text(
      "• ${data["heart"][i]["facility"][j]}",
      textAlign: TextAlign.start,
    ));
  }
  return list;
}
