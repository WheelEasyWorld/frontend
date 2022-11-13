import 'package:get/get.dart';

class StoreListControllers extends GetxController {
  int selectedCategoryNum = 0;
  List<Map<String, String>> storeList = [
    {
      "images": "assets/images/store02.png",
      "url":
          "https://github.com/WheelEasyWorld/frontend/blob/feature/community/assets/images/store02.png?raw=true",
      "title": "도마29",
      "address": "대구 중구 동성로1길 46-2",
      "distance": "347m",
      "like": "true",
      "infonum": "1",
    },
    {
      "images": "assets/images/store03.png",
      "url":
          "https://github.com/WheelEasyWorld/frontend/blob/feature/community/assets/images/store03.png?raw=true",
      "title": "수야",
      "address": "대구 중구 동성로3길 32-37",
      "distance": "563m",
      "like": "true",
      "infonum": "2",
    },
    {
      "images": "assets/images/detail01.png",
      "url":
          "https://github.com/WheelEasyWorld/frontend/blob/feature/community/assets/images/detail01.png?raw=true",
      "title": "츠바키노하나",
      "address": "대구 중구 문우관길 25 1층",
      "distance": "708m",
      "like": "true",
      "infonum": "0",
    },
    {
      "images": "assets/images/store01.png",
      "url":
          "https://github.com/WheelEasyWorld/frontend/blob/feature/community/assets/images/store01.png?raw=true",
      "title": "사야까",
      "address": "대구 중구 국채보상로125길 4 1층",
      "distance": "765m",
      "like": "true",
      "infonum": "2",
    },
  ];

  String? getLikeValue(int idx) {
    return this.storeList[idx]["like"];
  }

  int getCategoryNum() {
    return this.selectedCategoryNum;
  }

  void changeLikeValue(int idx) {
    if (this.storeList[idx]["like"] == "true") {
      this.storeList[idx]["like"] = "false";
    } else {
      this.storeList[idx]["like"] = "true";
    }
  }

  void changeButton(int num) {
    this.selectedCategoryNum = num;
    print(this.selectedCategoryNum);
    switch (this.selectedCategoryNum) {
      case 0:
        this.storeList = [
          {
            "images": "assets/images/store02.png",
            "url":
                "https://github.com/WheelEasyWorld/frontend/blob/feature/community/assets/images/store02.png?raw=true",
            "title": "도마29",
            "address": "대구 중구 동성로1길 46-2",
            "distance": "347m",
            "like": "true",
            "infonum": "1",
          },
          {
            "images": "assets/images/store03.png",
            "url":
                "https://github.com/WheelEasyWorld/frontend/blob/feature/community/assets/images/store03.png?raw=true",
            "title": "수야",
            "address": "대구 중구 동성로3길 32-37",
            "distance": "563m",
            "like": "true",
            "infonum": "2",
          },
          {
            "images": "assets/images/detail01.png",
            "url":
                "https://github.com/WheelEasyWorld/frontend/blob/feature/community/assets/images/detail01.png?raw=true",
            "title": "츠바키노하나",
            "address": "대구 중구 문우관길 25 1층",
            "distance": "708m",
            "like": "true",
            "infonum": "0",
          },
          {
            "images": "assets/images/store01.png",
            "url":
                "https://github.com/WheelEasyWorld/frontend/blob/feature/community/assets/images/store01.png?raw=true",
            "title": "사야까",
            "address": "대구 중구 국채보상로125길 4 1층",
            "distance": "765m",
            "like": "true",
            "infonum": "2",
          },
        ];
        break;
      case 1:
        this.storeList = [
          {
            "images": "assets/images/cafe03.png",
            "url":
                "https://github.com/WheelEasyWorld/frontend/blob/feature/community/assets/images/cafe03.png?raw=true",
            "title": "팡팡팡",
            "address": "대구 중구 동성로1길 15 2층",
            "distance": "157m",
            "like": "true",
            "infonum": "3",
          },
          {
            "images": "assets/images/cafe01.png",
            "url":
                "https://github.com/WheelEasyWorld/frontend/blob/feature/community/assets/images/cafe01.png?raw=true",
            "title": "핑퐁커피",
            "address": "대구 중구 동성로2길 23 1층",
            "distance": "366m",
            "like": "true",
            "infonum": "1",
          },
          {
            "images": "assets/images/cafe02.png",
            "url":
                "https://github.com/WheelEasyWorld/frontend/blob/feature/community/assets/images/cafe02.png?raw=true",
            "title": "구삼커피",
            "address": "대구 중구 봉산문화2길 16-3",
            "distance": "787m",
            "like": "true",
            "infonum": "2",
          },
        ];
        break;
      case 2:
        this.storeList = [
          {
            "images": "assets/images/convenience_store01.png",
            "url":
                "https://github.com/WheelEasyWorld/frontend/blob/feature/community/assets/images/convenience_store01.png?raw=true",
            "title": "GS25 뉴동성로점",
            "address": "대구 중구 중앙대로 390",
            "distance": "11m",
            "like": "true",
            "infonum": "4",
          },
          {
            "images": "assets/images/convenience_store03.png",
            "url":
                "https://github.com/WheelEasyWorld/frontend/blob/feature/community/assets/images/convenience_store03.png?raw=true",
            "title": "세븐일레븐 대구동성로토요코인점",
            "address": "대구 중구 동성로1길 15 1층",
            "distance": "157m",
            "like": "true",
            "infonum": "5",
          },
          {
            "images": "assets/images/convenience_store02.png",
            "url":
                "https://github.com/WheelEasyWorld/frontend/blob/feature/community/assets/images/convenience_store02.png?raw=true",
            "title": "이마트24 대구반월당점",
            "address": "대구 중구 중앙대로 372",
            "distance": "165m",
            "like": "true",
            "infonum": "4",
          },
        ];
        break;
      case 3:
        this.storeList = [
          {
            "images": "assets/images/mart01.png",
            "url":
                "https://github.com/WheelEasyWorld/frontend/blob/feature/community/assets/images/mart01.png?raw=true",
            "title": "일광슈퍼",
            "address": "대구 중구 달구벌대로 2113",
            "distance": "349m",
            "like": "true",
            "infonum": "5",
          },
        ];
        break;
      case 4:
        this.storeList = [
          {
            "images": "assets/images/hospital01.png",
            "url":
                "https://github.com/WheelEasyWorld/frontend/blob/feature/community/assets/images/hospital01.png?raw=true",
            "title": "일맥한의원 대구",
            "address": "대구 중구 동성로 2 협성빌딩 5층",
            "distance": "110m",
            "like": "true",
            "infonum": "6",
          },
          {
            "images": "assets/images/hospital02.png",
            "url":
                "https://github.com/WheelEasyWorld/frontend/blob/feature/community/assets/images/hospital02.png?raw=true",
            "title": "엣지성형외과의원",
            "address": "대구 중구 동성로1길 28 4층",
            "distance": "248m",
            "like": "true",
            "infonum": "6",
          },
          {
            "images": "assets/images/hospital03.png",
            "url":
                "https://github.com/WheelEasyWorld/frontend/blob/feature/community/assets/images/hospital03.png?raw=true",
            "title": "류마내과의원",
            "address": "대구 중구 달구벌대로 2120",
            "distance": "461m",
            "like": "true",
            "infonum": "6",
          },
        ];
        break;
      case 5:
        this.storeList = [
          {
            "images": "assets/images/drug_store01.png",
            "url":
                "https://github.com/WheelEasyWorld/frontend/blob/feature/community/assets/images/drug_store01.png?raw=true",
            "title": "한성약국",
            "address": "대구 중구 중앙대로 386-1",
            "distance": "39m",
            "like": "true",
            "infonum": "5",
          },
          {
            "images": "assets/images/drug_store02.png",
            "url":
                "https://github.com/WheelEasyWorld/frontend/blob/feature/community/assets/images/drug_store02.png?raw=true",
            "title": "푸른약국",
            "address": "대구 중구 중앙대로 372 현대투자신탁",
            "distance": "165m",
            "like": "true",
            "infonum": "4",
          },
          {
            "images": "assets/images/drug_store03.png",
            "url":
                "https://github.com/WheelEasyWorld/frontend/blob/feature/community/assets/images/drug_store03.png?raw=true",
            "title": "세민약국",
            "address": "대구 중구 달구벌대로 2095",
            "distance": "274m",
            "like": "true",
            "infonum": "7",
          },
        ];
        break;
      case 6:
        this.storeList = [
          {
            "images": "assets/images/bank01.png",
            "url":
                "https://github.com/WheelEasyWorld/frontend/blob/feature/community/assets/images/bank01.png?raw=true",
            "title": "KB국민은행 대구",
            "address": "대구 중구 중앙대로 401",
            "distance": "132m",
            "like": "true",
            "infonum": "6",
          },
          {
            "images": "assets/images/bank03.png",
            "url":
                "https://github.com/WheelEasyWorld/frontend/blob/feature/community/assets/images/bank03.png?raw=true",
            "title": "우리은행 대구지점",
            "address": "대구 중구 중앙대로 418",
            "distance": "276m",
            "like": "true",
            "infonum": "4",
          },
          {
            "images": "assets/images/bank02.png",
            "url":
                "https://github.com/WheelEasyWorld/frontend/blob/feature/community/assets/images/bank02.png?raw=true",
            "title": "대구은행 중앙로지점",
            "address": "대구 중구 중앙대로 425",
            "distance": "387m",
            "like": "true",
            "infonum": "4",
          },
        ];
        break;
      case 7:
        this.storeList = [
          {
            "images": "assets/images/post_office01.png",
            "url":
                "https://github.com/WheelEasyWorld/frontend/blob/feature/community/assets/images/post_office01.png?raw=true",
            "title": "대구반월당우체국",
            "address": "대구 중구 달구벌대로 2141 1층",
            "distance": "561m",
            "like": "true",
            "infonum": "7",
          },
        ];
        break;
    }
  }
}
