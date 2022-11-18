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
        "imageurl":
            "https://github.com/WheelEasyWorld/frontend/blob/feature/community/assets/images/store02.png?raw=true",
        "title": "도마29",
        "address": "대구 중구 동성로1길 46-2",
        "distance": "347m",
        "like": "true",
        "infonum": "1",
        "siteurl":
            "https://search.naver.com/search.naver?sm=tab_sug.top&where=nexearch&query=%EB%8C%80%EA%B5%AC+%EB%8F%99%EC%84%B1%EB%A1%9C+%EB%8F%84%EB%A7%8829&oquery=%EB%8F%84%EB%A7%8829&tqi=h3n5rdp0J1sss7fygYwssssssD8-245184&acq=%EB%8F%84%EB%A7%8829&acr=2&qdt=0",
      },
      {
        "images": "assets/images/store03.png",
        "imageurl":
            "https://github.com/WheelEasyWorld/frontend/blob/feature/community/assets/images/store03.png?raw=true",
        "title": "수야",
        "address": "대구 중구 동성로3길 32-37",
        "distance": "563m",
        "like": "false",
        "infonum": "2",
        "siteurl":
            "https://search.naver.com/search.naver?sm=tab_hty.top&where=nexearch&query=%EB%8F%99%EC%84%B1%EB%A1%9C+%EC%88%98%EC%95%BC&oquery=%EC%88%98%EC%95%BC&tqi=h3n5%2FwprvTossnoQ1J8ssssstOC-034582",
      },
      {
        "images": "assets/images/detail01.png",
        "imageurl":
            "https://github.com/WheelEasyWorld/frontend/blob/feature/community/assets/images/detail01.png?raw=true",
        "title": "츠바키노하나",
        "address": "대구 중구 문우관길 25 1층",
        "distance": "708m",
        "like": "true",
        "infonum": "0",
        "siteurl":
            "https://search.naver.com/search.naver?where=nexearch&sm=top_hty&fbm=1&ie=utf8&query=%EC%B8%A0%EB%B0%94%ED%82%A4%EB%85%B8%ED%95%98%EB%82%98",
      },
      {
        "images": "assets/images/store01.png",
        "imageurl":
            "https://github.com/WheelEasyWorld/frontend/blob/feature/community/assets/images/store01.png?raw=true",
        "title": "사야까",
        "address": "대구 중구 국채보상로125길 4 1층",
        "distance": "765m",
        "like": "false",
        "infonum": "2",
        "siteurl":
            "https://search.naver.com/search.naver?sm=tab_hty.top&where=nexearch&query=%EC%82%AC%EC%95%BC%EA%B9%8C&oquery=%EB%8F%99%EC%84%B1%EB%A1%9C+%EC%88%98%EC%95%BC&tqi=h3n6tdprvTossnhJaLNssssssP8-500472",
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
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w800),
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
              "imageurl":
                  "https://github.com/WheelEasyWorld/frontend/blob/feature/community/assets/images/store02.png?raw=true",
              "title": "도마29",
              "address": "대구 중구 동성로1길 46-2",
              "distance": "347m",
              "like": "true",
              "infonum": "1",
              "siteurl":
                  "https://search.naver.com/search.naver?sm=tab_sug.top&where=nexearch&query=%EB%8C%80%EA%B5%AC+%EB%8F%99%EC%84%B1%EB%A1%9C+%EB%8F%84%EB%A7%8829&oquery=%EB%8F%84%EB%A7%8829&tqi=h3n5rdp0J1sss7fygYwssssssD8-245184&acq=%EB%8F%84%EB%A7%8829&acr=2&qdt=0",
            },
            {
              "images": "assets/images/store03.png",
              "imageurl":
                  "https://github.com/WheelEasyWorld/frontend/blob/feature/community/assets/images/store03.png?raw=true",
              "title": "수야",
              "address": "대구 중구 동성로3길 32-37",
              "distance": "563m",
              "like": "false",
              "infonum": "2",
              "siteurl":
                  "https://search.naver.com/search.naver?sm=tab_hty.top&where=nexearch&query=%EB%8F%99%EC%84%B1%EB%A1%9C+%EC%88%98%EC%95%BC&oquery=%EC%88%98%EC%95%BC&tqi=h3n5%2FwprvTossnoQ1J8ssssstOC-034582",
            },
            {
              "images": "assets/images/detail01.png",
              "imageurl":
                  "https://github.com/WheelEasyWorld/frontend/blob/feature/community/assets/images/detail01.png?raw=true",
              "title": "츠바키노하나",
              "address": "대구 중구 문우관길 25 1층",
              "distance": "708m",
              "like": "true",
              "infonum": "0",
              "siteurl":
                  "https://search.naver.com/search.naver?where=nexearch&sm=top_hty&fbm=1&ie=utf8&query=%EC%B8%A0%EB%B0%94%ED%82%A4%EB%85%B8%ED%95%98%EB%82%98",
            },
            {
              "images": "assets/images/store01.png",
              "imageurl":
                  "https://github.com/WheelEasyWorld/frontend/blob/feature/community/assets/images/store01.png?raw=true",
              "title": "사야까",
              "address": "대구 중구 국채보상로125길 4 1층",
              "distance": "765m",
              "like": "fasle",
              "infonum": "2",
              "siteurl":
                  "https://search.naver.com/search.naver?sm=tab_hty.top&where=nexearch&query=%EC%82%AC%EC%95%BC%EA%B9%8C&oquery=%EB%8F%99%EC%84%B1%EB%A1%9C+%EC%88%98%EC%95%BC&tqi=h3n6tdprvTossnhJaLNssssssP8-500472",
            },
          ];
          break;
        case 1:
          _storeList = [
            {
              "images": "assets/images/cafe03.png",
              "imageurl":
                  "https://github.com/WheelEasyWorld/frontend/blob/feature/community/assets/images/cafe03.png?raw=true",
              "title": "팡팡팡",
              "address": "대구 중구 동성로1길 15 2층",
              "distance": "157m",
              "like": "fasle",
              "infonum": "3",
              "siteurl":
                  "https://search.naver.com/search.naver?sm=tab_hty.top&where=nexearch&query=%EB%8F%99%EC%84%B1%EB%A1%9C+%ED%8C%A1%ED%8C%A1%ED%8C%A1&oquery=%ED%8C%A1%ED%8C%A1%ED%8C%A1&tqi=h3n6KwprvTossnjbc8lssssssGw-108045",
            },
            {
              "images": "assets/images/cafe01.png",
              "imageurl":
                  "https://github.com/WheelEasyWorld/frontend/blob/feature/community/assets/images/cafe01.png?raw=true",
              "title": "핑퐁커피",
              "address": "대구 중구 동성로2길 23 1층",
              "distance": "366m",
              "like": "fasle",
              "infonum": "1",
              "siteurl":
                  "https://search.naver.com/search.naver?sm=tab_hty.top&where=nexearch&query=%EB%8F%99%EC%84%B1%EB%A1%9C+%ED%95%91%ED%90%81%EC%BB%A4%ED%94%BC&oquery=%ED%95%91%ED%90%81%EC%BB%A4%ED%94%BC&tqi=h3n6esprvTossnP%2FTNCssssssE4-258615",
            },
            {
              "images": "assets/images/cafe02.png",
              "imageurl":
                  "https://github.com/WheelEasyWorld/frontend/blob/feature/community/assets/images/cafe02.png?raw=true",
              "title": "구삼커피",
              "address": "대구 중구 봉산문화2길 16-3",
              "distance": "787m",
              "like": "fasle",
              "infonum": "2",
              "siteurl":
                  "https://search.naver.com/search.naver?sm=tab_hty.top&where=nexearch&query=%EB%B4%89%EC%82%B0%EB%8F%99+%EA%B5%AC%EC%82%BC%EC%BB%A4%ED%94%BC&oquery=%EA%B5%AC%EC%82%BC%EC%BB%A4%ED%94%BC&tqi=h3n6TdprvTossnEcW58ssssstBZ-078474",
            },
          ];
          break;
        case 2:
          _storeList = [
            {
              "images": "assets/images/convenience_store01.png",
              "imageurl":
                  "https://github.com/WheelEasyWorld/frontend/blob/feature/community/assets/images/convenience_store01.png?raw=true",
              "title": "GS25 뉴동성로점",
              "address": "대구 중구 중앙대로 390",
              "distance": "11m",
              "like": "fasle",
              "infonum": "4",
              "siteurl":
                  "https://search.naver.com/search.naver?sm=tab_hty.top&where=nexearch&query=GS25+%EB%89%B4%EB%8F%99%EC%84%B1%EB%A1%9C%EC%A0%90&oquery=%EB%B4%89%EC%82%B0%EB%8F%99+%EA%B5%AC%EC%82%BC%EC%BB%A4%ED%94%BC&tqi=h3n6hsprvTossnod1uVssssstYG-150357",
            },
            {
              "images": "assets/images/convenience_store03.png",
              "imageurl":
                  "https://github.com/WheelEasyWorld/frontend/blob/feature/community/assets/images/convenience_store03.png?raw=true",
              "title": "세븐일레븐 대구동성로토요코인점",
              "address": "대구 중구 동성로1길 15 1층",
              "distance": "157m",
              "like": "fasle",
              "infonum": "5",
              "siteurl":
                  "https://search.naver.com/search.naver?sm=tab_hty.top&where=nexearch&query=%EC%84%B8%EB%B8%90%EC%9D%BC%EB%A0%88%EB%B8%90+%EB%8C%80%EA%B5%AC%EB%8F%99%EC%84%B1%EB%A1%9C%ED%86%A0%EC%9A%94%EC%BD%94%EC%9D%B8%EC%A0%90&oquery=GS25+%EB%89%B4%EB%8F%99%EC%84%B1%EB%A1%9C%EC%A0%90&tqi=h3n6NlprvTossnWA5iKssssstuG-000762",
            },
            {
              "images": "assets/images/convenience_store02.png",
              "imageurl":
                  "https://github.com/WheelEasyWorld/frontend/blob/feature/community/assets/images/convenience_store02.png?raw=true",
              "title": "이마트24 대구반월당점",
              "address": "대구 중구 중앙대로 372",
              "distance": "165m",
              "like": "fasle",
              "infonum": "4",
              "siteurl":
                  "https://search.naver.com/search.naver?sm=tab_hty.top&where=nexearch&query=%EC%9D%B4%EB%A7%88%ED%8A%B824+%EB%8C%80%EA%B5%AC%EB%B0%98%EC%9B%94%EB%8B%B9%EC%A0%90&oquery=%EC%84%B8%EB%B8%90%EC%9D%BC%EB%A0%88%EB%B8%90+%EB%8C%80%EA%B5%AC%EB%8F%99%EC%84%B1%EB%A1%9C%ED%86%A0%EC%9A%94%EC%BD%94%EC%9D%B8%EC%A0%90&tqi=h3n6llprvTossnzHugGssssssjl-514332",
            },
          ];
          break;
        case 3:
          _storeList = [
            {
              "images": "assets/images/mart01.png",
              "imageurl":
                  "https://github.com/WheelEasyWorld/frontend/blob/feature/community/assets/images/mart01.png?raw=true",
              "title": "일광슈퍼",
              "address": "대구 중구 달구벌대로 2113",
              "distance": "349m",
              "like": "fasle",
              "infonum": "5",
              "siteurl":
                  "https://search.naver.com/search.naver?sm=tab_hty.top&where=nexearch&query=%EB%8F%99%EC%84%B1%EB%A1%9C+%EC%9D%BC%EA%B4%91%EC%8A%88%ED%8D%BC&oquery=%EC%9D%BC%EA%B4%91%EC%8A%88%ED%8D%BC&tqi=h3n6osprvTossnPbR44ssssssAd-500885",
            },
          ];
          break;
        case 4:
          _storeList = [
            {
              "images": "assets/images/hospital01.png",
              "imageurl":
                  "https://github.com/WheelEasyWorld/frontend/blob/feature/community/assets/images/hospital01.png?raw=true",
              "title": "일맥한의원 대구",
              "address": "대구 중구 동성로 2 협성빌딩 5층",
              "distance": "110m",
              "like": "fasle",
              "infonum": "6",
              "siteurl":
                  "https://search.naver.com/search.naver?sm=tab_hty.top&where=nexearch&query=%EC%9D%BC%EB%A7%A5%ED%95%9C%EC%9D%98%EC%9B%90+%EB%8C%80%EA%B5%AC&oquery=%EB%8F%99%EC%84%B1%EB%A1%9C+%EC%9D%BC%EA%B4%91%EC%8A%88%ED%8D%BC&tqi=h3n6pdprvTossnP8Tfdssssss7h-307092",
            },
            {
              "images": "assets/images/hospital02.png",
              "imageurl":
                  "https://github.com/WheelEasyWorld/frontend/blob/feature/community/assets/images/hospital02.png?raw=true",
              "title": "엣지성형외과의원",
              "address": "대구 중구 동성로1길 28 4층",
              "distance": "248m",
              "like": "fasle",
              "infonum": "6",
              "siteurl":
                  "https://search.naver.com/search.naver?sm=tab_hty.top&where=nexearch&query=%EB%8C%80%EA%B5%AC+%EC%97%A3%EC%A7%80%EC%84%B1%ED%98%95%EC%99%B8%EA%B3%BC%EC%9D%98%EC%9B%90&oquery=%EC%97%A3%EC%A7%80%EC%84%B1%ED%98%95%EC%99%B8%EA%B3%BC%EC%9D%98%EC%9B%90&tqi=h3n6ydprvTossnV6ZcGsssssst0-136501",
            },
            {
              "images": "assets/images/hospital03.png",
              "imageurl":
                  "https://github.com/WheelEasyWorld/frontend/blob/feature/community/assets/images/hospital03.png?raw=true",
              "title": "류마내과의원",
              "address": "대구 중구 달구벌대로 2120",
              "distance": "461m",
              "like": "fasle",
              "infonum": "6",
              "siteurl":
                  "https://search.naver.com/search.naver?sm=tab_hty.top&where=nexearch&query=%EB%8F%99%EC%84%B1%EB%A1%9C+%EB%A5%98%EB%A7%88%EB%82%B4%EA%B3%BC&oquery=%EB%8F%99%EC%84%B1%EB%A1%9C+%EB%A5%98%EB%A7%88%EB%82%B4%EA%B3%BC%EC%9D%98%EC%9B%90&tqi=h3n69wprvTossnGiRTwsssssstZ-258350",
            },
          ];
          break;
        case 5:
          _storeList = [
            {
              "images": "assets/images/drug_store01.png",
              "imageurl":
                  "https://github.com/WheelEasyWorld/frontend/blob/feature/community/assets/images/drug_store01.png?raw=true",
              "title": "한성약국",
              "address": "대구 중구 중앙대로 386-1",
              "distance": "39m",
              "like": "fasle",
              "infonum": "5",
              "siteurl":
                  "https://search.naver.com/search.naver?sm=tab_hty.top&where=nexearch&query=%EB%8F%99%EC%84%B1%EB%A1%9C+%ED%95%9C%EC%84%B1%EC%95%BD%EA%B5%AD&oquery=%EB%8F%99%EC%84%B1%EB%A1%9C+%EB%A5%98%EB%A7%88%EB%82%B4%EA%B3%BC&tqi=h3n6%2FdprvTossnkN7BdssssssiZ-084527",
            },
            {
              "images": "assets/images/drug_store02.png",
              "imageurl":
                  "https://github.com/WheelEasyWorld/frontend/blob/feature/community/assets/images/drug_store02.png?raw=true",
              "title": "푸른약국",
              "address": "대구 중구 중앙대로 372 현대투자신탁",
              "distance": "165m",
              "like": "fasle",
              "infonum": "4",
              "siteurl":
                  "https://search.naver.com/search.naver?sm=tab_hty.top&where=nexearch&query=%EB%8F%99%EC%84%B1%EB%A1%9C+%ED%91%B8%EB%A5%B8%EC%95%BD%EA%B5%AD&oquery=%EB%8F%99%EC%84%B1%EB%A1%9C+%ED%95%9C%EC%84%B1%EC%95%BD%EA%B5%AD&tqi=h3n7vwprvTossnA0As8ssssssOh-330561",
            },
            {
              "images": "assets/images/drug_store03.png",
              "imageurl":
                  "https://github.com/WheelEasyWorld/frontend/blob/feature/community/assets/images/drug_store03.png?raw=true",
              "title": "세민약국",
              "address": "대구 중구 달구벌대로 2095",
              "distance": "274m",
              "like": "fasle",
              "infonum": "7",
              "siteurl":
                  "https://search.naver.com/search.naver?sm=tab_hty.top&where=nexearch&query=%EB%8F%99%EC%84%B1%EB%A1%9C+%EC%84%B8%EB%AF%BC%EC%95%BD%EA%B5%AD&oquery=%EB%8F%99%EC%84%B1%EB%A1%9C+%ED%91%B8%EB%A5%B8%EC%95%BD%EA%B5%AD&tqi=h3n7bwprvTossnCWoGZssssstyw-306483",
            },
          ];
          break;
        case 6:
          _storeList = [
            {
              "images": "assets/images/bank01.png",
              "imageurl":
                  "https://github.com/WheelEasyWorld/frontend/blob/feature/community/assets/images/bank01.png?raw=true",
              "title": "KB국민은행 대구",
              "address": "대구 중구 중앙대로 401",
              "distance": "132m",
              "like": "fasle",
              "infonum": "6",
              "siteurl":
                  "https://search.naver.com/search.naver?sm=tab_hty.top&where=nexearch&query=kb%EA%B5%AD%EB%AF%BC%EC%9D%80%ED%96%89+%EB%8C%80%EA%B5%AC&oquery=%EB%8F%99%EC%84%B1%EB%A1%9C+%EC%84%B8%EB%AF%BC%EC%95%BD%EA%B5%AD&tqi=h3n76lprvTossnoN1w8ssssstso-178137",
            },
            {
              "images": "assets/images/bank03.png",
              "imageurl":
                  "https://github.com/WheelEasyWorld/frontend/blob/feature/community/assets/images/bank03.png?raw=true",
              "title": "우리은행 대구지점",
              "address": "대구 중구 중앙대로 418",
              "distance": "276m",
              "like": "fasle",
              "infonum": "4",
              "siteurl":
                  "https://search.naver.com/search.naver?sm=tab_hty.top&where=nexearch&query=%EC%9A%B0%EB%A6%AC%EC%9D%80%ED%96%89+%EB%8C%80%EA%B5%AC%EC%A7%80%EC%A0%90&oquery=kb%EA%B5%AD%EB%AF%BC%EC%9D%80%ED%96%89+%EB%8C%80%EA%B5%AC&tqi=h3n7fwprvTossn1bcq8ssssssPG-469158",
            },
            {
              "images": "assets/images/bank02.png",
              "imageurl":
                  "https://github.com/WheelEasyWorld/frontend/blob/feature/community/assets/images/bank02.png?raw=true",
              "title": "대구은행 중앙로지점",
              "address": "대구 중구 중앙대로 425",
              "distance": "387m",
              "like": "fasle",
              "infonum": "4",
              "siteurl":
                  "https://search.naver.com/search.naver?sm=tab_hty.top&where=nexearch&query=%EB%8C%80%EA%B5%AC%EC%9D%80%ED%96%89+%EC%A4%91%EC%95%99%EB%A1%9C%EC%A7%80%EC%A0%90&oquery=%EC%9A%B0%EB%A6%AC%EC%9D%80%ED%96%89+%EB%8C%80%EA%B5%AC%EC%A7%80%EC%A0%90&tqi=h3n7UsprvTossnkILuKssssssNh-243948",
            },
          ];
          break;
        case 7:
          _storeList = [
            {
              "images": "assets/images/post_office01.png",
              "imageurl":
                  "https://github.com/WheelEasyWorld/frontend/blob/feature/community/assets/images/post_office01.png?raw=true",
              "title": "대구반월당우체국",
              "address": "대구 중구 달구벌대로 2141 1층",
              "distance": "561m",
              "like": "fasle",
              "infonum": "7",
              "siteurl":
                  "https://search.naver.com/search.naver?sm=tab_hty.top&where=nexearch&query=%EB%8C%80%EA%B5%AC%EB%B0%98%EC%9B%94%EB%8B%B9%EC%9A%B0%EC%B2%B4%EA%B5%AD&oquery=%EB%8C%80%EA%B5%AC%EC%9D%80%ED%96%89+%EC%A4%91%EC%95%99%EB%A1%9C%EC%A7%80%EC%A0%90&tqi=h3n7kwprvTossnQ%2BiLNssssss8N-328664",
            },
          ];
          break;
      }
    });
  }
}
