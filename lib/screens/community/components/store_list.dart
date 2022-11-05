import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:frontend/screens/community/store_detail_screen.dart';
import 'package:frontend/screens/constants.dart';
import 'package:get/get.dart';

class StoreList extends StatefulWidget {
  StoreList({Key? key}) : super(key: key);

  @override
  State<StoreList> createState() => _StoreListState();
}

class _StoreListState extends State<StoreList> {
  final storeList = [
    {
      "images": "assets/images/detail01.png",
      "title": "츠바키노하나",
      "address": "대구 중구 문우관길 25 1층",
      "distance": "684m",
    },
    {
      "images": "assets/images/store01.png",
      "title": "사야까",
      "address": "대구 중구 국채보상로125길 4 1층",
      "distance": "822m",
    },
    {
      "images": "assets/images/detail01.png",
      "title": "츠바키노하나",
      "address": "대구 중구 문우관길 25 1층",
      "distance": "684m",
    },
    {
      "images": "assets/images/store01.png",
      "title": "사야까",
      "address": "대구 중구 국채보상로125길 4 1층",
      "distance": "822m",
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20.h),
      width: double.infinity,
      child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 1,
            childAspectRatio: 336 / 233,
            mainAxisSpacing: 20.h,
          ),
          itemCount: storeList.length,
          itemBuilder: (BuildContext context, int index) {
            return InkWell(
              highlightColor: Color.fromARGB(85, 255, 232, 227),
              splashColor: Colors.transparent,
              borderRadius: BorderRadius.circular(15.0),
              onTap: () {
                Get.toNamed('store_detail');
              },
              child: Container(
                  padding: EdgeInsets.all(15.0),
                  width: 336.w,
                  height: 233.h,
                  decoration: BoxDecoration(
                    border: Border.all(
                      width: 2,
                      color: kGreyColor,
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(15.0)),
                  ),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Container(
                            height: 100.h,
                            width: 100.w,
                            margin: EdgeInsets.fromLTRB(5.w, 5.h, 0, 0),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10.0),
                              child: Image.asset(storeList[index]["images"]!),
                            ),
                          ),
                          SizedBox(
                            width: 12.w,
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  storeList[index]["title"]!,
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  height: 5.h,
                                ),
                                Text(
                                  storeList[index]["address"]!,
                                  style: TextStyle(
                                    fontSize: 10,
                                  ),
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Text(
                                      storeList[index]["distance"]!,
                                      style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    SizedBox(
                                      height: 14.h,
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        InkWell(
                                          splashColor: Colors.transparent,
                                          child: Icon(
                                            Icons.favorite_border_rounded,
                                            size: 15.h,
                                          ),
                                          onTap: () {},
                                        ),
                                        SizedBox(
                                          width: 7.w,
                                        ),
                                        InkWell(
                                          splashColor: Colors.transparent,
                                          child: Icon(
                                            Icons.share_rounded,
                                            size: 15.h,
                                          ),
                                          onTap: () {},
                                        ),
                                      ],
                                    )
                                  ],
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(0, 20.h, 0, 15.h),
                        height: 2.h,
                        width: 305.w,
                        color: kGreyColor,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Image.asset(
                            "assets/images/first_floor.png",
                            height: 50.h,
                          ),
                          Image.asset(
                            "assets/images/threshold.png",
                            height: 50.h,
                          ),
                          Image.asset(
                            "assets/images/ramp.png",
                            height: 50.h,
                          ),
                          Image.asset(
                            "assets/images/table_seat.png",
                            height: 50.h,
                          ),
                          Image.asset(
                            "assets/images/elevator.png",
                            height: 50.h,
                          ),
                          Image.asset(
                            "assets/images/handicapped_wc.png",
                            height: 50.h,
                          ),
                        ],
                      )
                    ],
                  )),
            );
          }),
    );
  }
}
