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
  List<Map<String, String>> _storeList = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    selectedCategoryNum = 0;
    _storeList = [
      {
        "images": "assets/images/store02.png",
        "title": "도마29",
        "address": "대구 중구 동성로1길 46-2",
        "distance": "347m",
        "like": "true"
      },
      {
        "images": "assets/images/store03.png",
        "title": "수야",
        "address": "대구 중구 동성로3길 32-37",
        "distance": "563m",
        "like": "true"
      },
      {
        "images": "assets/images/detail01.png",
        "title": "츠바키노하나",
        "address": "대구 중구 문우관길 25 1층",
        "distance": "708m",
        "like": "true"
      },
      {
        "images": "assets/images/store01.png",
        "title": "사야까",
        "address": "대구 중구 국채보상로125길 4 1층",
        "distance": "765m",
        "like": "true"
      },
    ];
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
            child: StoreList(_storeList),
          ),
        ],
      ),
    );
  }

  void changeButton(int num) {
    setState(() {
      selectedCategoryNum = num;
      switch (selectedCategoryNum) {
        case 0:
          _storeList = [
            {
              "images": "assets/images/store02.png",
              "title": "도마29",
              "address": "대구 중구 동성로1길 46-2",
              "distance": "347m",
              "like": "true",
              "infoNum": "1",
            },
            {
              "images": "assets/images/store03.png",
              "title": "수야",
              "address": "대구 중구 동성로3길 32-37",
              "distance": "563m",
              "like": "true",
              "infoNum": "2",
            },
            {
              "images": "assets/images/detail01.png",
              "title": "츠바키노하나",
              "address": "대구 중구 문우관길 25 1층",
              "distance": "708m",
              "like": "true",
              "infoNum": "0",
            },
            {
              "images": "assets/images/store01.png",
              "title": "사야까",
              "address": "대구 중구 국채보상로125길 4 1층",
              "distance": "765m",
              "like": "true",
              "infoNum": "2",
            },
          ];
          break;
        case 1:
          _storeList = [
            {
              "images": "assets/images/cafe03.png",
              "title": "팡팡팡",
              "address": "대구 중구 동성로1길 15 2층",
              "distance": "157m",
              "like": "true",
              "infoNum": "3",
            },
            {
              "images": "assets/images/cafe01.png",
              "title": "핑퐁커피",
              "address": "대구 중구 동성로2길 23 1층",
              "distance": "366m",
              "like": "true",
              "infoNum": "1",
            },
            {
              "images": "assets/images/cafe02.png",
              "title": "구삼커피",
              "address": "대구 중구 봉산문화2길 16-3",
              "distance": "787m",
              "like": "true",
              "infoNum": "2",
            },
          ];
          break;
        case 2:
          _storeList = [
            {
              "images": "assets/images/convenience_store01.png",
              "title": "GS25 뉴동성로점",
              "address": "대구 중구 중앙대로 390",
              "distance": "11m",
              "like": "true",
              "infoNum": "4",
            },
            {
              "images": "assets/images/convenience_store03.png",
              "title": "세븐일레븐 대구동성로토요코인점",
              "address": "대구 중구 동성로1길 15 1층",
              "distance": "157m",
              "like": "true",
              "infoNum": "5",
            },
            {
              "images": "assets/images/convenience_store02.png",
              "title": "이마트24 대구반월당점",
              "address": "대구 중구 중앙대로 372",
              "distance": "165m",
              "like": "true",
              "infoNum": "4",
            },
          ];
          break;
        case 3:
          _storeList = [
            {
              "images": "assets/images/mart01.png",
              "title": "일광슈퍼",
              "address": "대구 중구 달구벌대로 2113",
              "distance": "349m",
              "like": "true",
              "infoNum": "5",
            },
          ];
          break;
        case 4:
          _storeList = [
            {
              "images": "assets/images/hospital01.png",
              "title": "일맥한의원 대구",
              "address": "대구 중구 동성로 2 협성빌딩 5층",
              "distance": "110m",
              "like": "true",
              "infoNum": "6",
            },
            {
              "images": "assets/images/hospital02.png",
              "title": "엣지성형외과의원",
              "address": "대구 중구 동성로1길 28 4층",
              "distance": "248m",
              "like": "true",
              "infoNum": "6",
            },
            {
              "images": "assets/images/hospital03.png",
              "title": "류마내과의원",
              "address": "대구 중구 달구벌대로 2120",
              "distance": "461m",
              "like": "true",
              "infoNum": "6",
            },
          ];
          break;
        case 5:
          _storeList = [
            {
              "images": "assets/images/drug_store01.png",
              "title": "한성약국",
              "address": "대구 중구 중앙대로 386-1",
              "distance": "39m",
              "like": "true",
              "infoNum": "5",
            },
            {
              "images": "assets/images/drug_store02.png",
              "title": "푸른약국",
              "address": "대구 중구 중앙대로 372 현대투자신탁",
              "distance": "165m",
              "like": "true",
              "infoNum": "4",
            },
            {
              "images": "assets/images/drug_store03.png",
              "title": "세민약국",
              "address": "대구 중구 달구벌대로 2095",
              "distance": "274m",
              "like": "true",
              "infoNum": "7",
            },
          ];
          break;
        case 6:
          _storeList = [
            {
              "images": "assets/images/bank01.png",
              "title": "KB국민은행 대구",
              "address": "대구 중구 중앙대로 401",
              "distance": "132m",
              "like": "true",
              "infoNum": "6",
            },
            {
              "images": "assets/images/bank03.png",
              "title": "우리은행 대구지점",
              "address": "대구 중구 중앙대로 418",
              "distance": "276m",
              "like": "true",
              "infoNum": "4",
            },
            {
              "images": "assets/images/bank02.png",
              "title": "대구은행 중앙로지점",
              "address": "대구 중구 중앙대로 425",
              "distance": "387m",
              "like": "true",
              "infoNum": "4",
            },
          ];
          break;
        case 7:
          _storeList = [
            {
              "images": "assets/images/post_office01.png",
              "title": "대구반월당우체국",
              "address": "대구 중구 달구벌대로 2141 1층",
              "distance": "561m",
              "like": "true",
              "infoNum": "7",
            },
          ];
          break;
      }
    });
  }
}
