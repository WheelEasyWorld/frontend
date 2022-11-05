import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:frontend/screens/community/components/category_button.dart';
import 'package:frontend/screens/community/components/store_list.dart';

class CommunityHomeBody extends StatefulWidget {
  CommunityHomeBody({Key? key}) : super(key: key);

  @override
  State<CommunityHomeBody> createState() => _CommunityHomeBodyState();
}

class _CommunityHomeBodyState extends State<CommunityHomeBody> {
  int selectedCategoryNum = 0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    selectedCategoryNum = 0;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 10.h,
          ),
          Column(
            children: [
              Row(
                children: [
                  CategoryButton(0, selectedCategoryNum, '음식점', changeButton),
                  SizedBox(
                    width: 5.w,
                  ),
                  CategoryButton(1, selectedCategoryNum, '카페', changeButton),
                  SizedBox(
                    width: 5.w,
                  ),
                  CategoryButton(2, selectedCategoryNum, '편의점', changeButton),
                  SizedBox(
                    width: 5.w,
                  ),
                  CategoryButton(3, selectedCategoryNum, '마트', changeButton),
                ],
              ),
              SizedBox(
                height: 5.h,
              ),
              Row(
                children: [
                  CategoryButton(4, selectedCategoryNum, '병원', changeButton),
                  SizedBox(
                    width: 5.w,
                  ),
                  CategoryButton(5, selectedCategoryNum, '약국', changeButton),
                  SizedBox(
                    width: 5.w,
                  ),
                  CategoryButton(6, selectedCategoryNum, '은행', changeButton),
                  SizedBox(
                    width: 5.w,
                  ),
                  CategoryButton(7, selectedCategoryNum, '우체국', changeButton),
                ],
              ),
            ],
          ),
          SizedBox(
            height: 20.h,
          ),
          Text(
            '가까운 장소',
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.w800),
          ),
          SizedBox(
            height: 30.h,
          ),
          Expanded(
            child: StoreList(),
          ),
        ],
      ),
    );
  }

  void changeButton(int num) {
    setState(() {
      selectedCategoryNum = num;
    });
  }
}
