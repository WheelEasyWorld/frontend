import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:frontend/screens/community/components/kakao_share_manager.dart';
import 'package:frontend/screens/community/store_detail_screen.dart';
import 'package:frontend/screens/constants.dart';
import 'package:get/get.dart';

class StoreList extends StatefulWidget {
  final storeList;
  StoreList(this.storeList, {Key? key}) : super(key: key);

  @override
  State<StoreList> createState() => _StoreListState();
}

class _StoreListState extends State<StoreList> {
  bool like_value = true;
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
          itemCount: widget.storeList.length,
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
                            child:
                                Image.asset(widget.storeList[index]["images"]!),
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
                                widget.storeList[index]["title"]!,
                                style: TextStyle(
                                    fontSize: 15.sp,
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                height: 5.h,
                              ),
                              Text(
                                widget.storeList[index]["address"]!,
                                style: TextStyle(
                                  fontSize: 12.sp,
                                ),
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text(
                                    widget.storeList[index]["distance"]!,
                                    style: TextStyle(
                                        fontSize: 11.sp,
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
                                        child: widget.storeList[index]
                                                    ["like"] ==
                                                "true"
                                            ? Icon(
                                                Icons.favorite_border_rounded,
                                                size: 18.h,
                                              )
                                            : Icon(
                                                Icons.favorite_rounded,
                                                size: 18.h,
                                                color: Color.fromARGB(
                                                    255, 255, 26, 45),
                                              ),
                                        onTap: () {
                                          setState(() {
                                            if (widget.storeList[index]
                                                    ["like"] ==
                                                "true") {
                                              widget.storeList[index]["like"] =
                                                  "false";
                                            } else {
                                              widget.storeList[index]["like"] =
                                                  "true";
                                            }
                                          });
                                        },
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
                                        onTap: () {
                                          String _address = widget
                                              .storeList[index]["address"]!;
                                          String _title =
                                              widget.storeList[index]["title"]!;
                                          String _imageurl = widget
                                              .storeList[index]["imageurl"]!;
                                          String _siteurl = widget
                                              .storeList[index]["siteurl"]!;
                                          KakaoShareManager(_address, _title,
                                              _imageurl, _address, _siteurl);
                                        },
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
                    changeStoreInfo(
                        int.parse(widget.storeList[index]["infonum"]))
                  ],
                ),
              ),
            );
          }),
    );
  }

  Row changeStoreInfo(int storeNum) {
    Row storeInfo = Row();
    switch (storeNum) {
      case 0:
        storeInfo = Row(
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
        );
        break;
      case 1:
        storeInfo = Row(
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
              "assets/images/table_seat.png",
              height: 50.h,
            ),
            SizedBox(
              width: 35.w,
              height: 50.h,
            ),
            SizedBox(
              width: 40.w,
              height: 50.h,
            ),
            SizedBox(
              width: 50.w,
              height: 50.h,
            ),
          ],
        );
        break;
      case 2:
        storeInfo = Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.asset(
              "assets/images/first_floor.png",
              height: 50.h,
            ),
            Image.asset(
              "assets/images/table_seat.png",
              height: 50.h,
            ),
            SizedBox(
              width: 35.w,
              height: 50.h,
            ),
            SizedBox(
              width: 35.w,
              height: 50.h,
            ),
            SizedBox(
              width: 40.w,
              height: 50.h,
            ),
            SizedBox(
              width: 50.w,
              height: 50.h,
            ),
          ],
        );
        break;
      case 3:
        storeInfo = Row(
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
            SizedBox(
              width: 50.w,
              height: 50.h,
            ),
          ],
        );
        break;
      case 4:
        storeInfo = Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.asset(
              "assets/images/first_floor.png",
              height: 50.h,
            ),
            Image.asset(
              "assets/images/ramp.png",
              height: 50.h,
            ),
            SizedBox(
              width: 35.w,
              height: 50.h,
            ),
            SizedBox(
              width: 35.w,
              height: 50.h,
            ),
            SizedBox(
              width: 40.w,
              height: 50.h,
            ),
            SizedBox(
              width: 50.w,
              height: 50.h,
            ),
          ],
        );
        break;
      case 5:
        storeInfo = Row(
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
            SizedBox(
              width: 35.w,
              height: 50.h,
            ),
            SizedBox(
              width: 35.w,
              height: 50.h,
            ),
            SizedBox(
              width: 40.w,
              height: 50.h,
            ),
            SizedBox(
              width: 50.w,
              height: 50.h,
            ),
          ],
        );
        break;
      case 6:
        storeInfo = Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.asset(
              "assets/images/elevator.png",
              height: 50.h,
            ),
            Image.asset(
              "assets/images/handicapped_wc.png",
              height: 50.h,
            ),
            SizedBox(
              width: 35.w,
              height: 50.h,
            ),
            SizedBox(
              width: 35.w,
              height: 50.h,
            ),
            SizedBox(
              width: 35.w,
              height: 50.h,
            ),
            SizedBox(
              width: 35.w,
              height: 50.h,
            ),
          ],
        );
        break;
      case 7:
        storeInfo = Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.asset(
              "assets/images/first_floor.png",
              height: 50.h,
            ),
            SizedBox(
              width: 35.w,
              height: 50.h,
            ),
            SizedBox(
              width: 35.w,
              height: 50.h,
            ),
            SizedBox(
              width: 35.w,
              height: 50.h,
            ),
            SizedBox(
              width: 35.w,
              height: 50.h,
            ),
            SizedBox(
              width: 40.w,
              height: 50.h,
            ),
            SizedBox(
              width: 50.w,
              height: 50.h,
            ),
          ],
        );
        break;
    }
    return storeInfo;
  }
}
