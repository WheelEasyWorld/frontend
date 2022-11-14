import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:frontend/screens/community/components/store_information.dart';
import 'package:frontend/screens/community/components/store_list.dart';
import 'package:frontend/screens/constants.dart';
// import 'package:carousel_slider/carousel_slider.dart';

class StoreDetailBody extends StatefulWidget {
  StoreDetailBody({Key? key}) : super(key: key);

  @override
  State<StoreDetailBody> createState() => _StoreDetailBodyState();
}

class _StoreDetailBodyState extends State<StoreDetailBody> {
  final reviewList = [
    {
      "name": "정현규",
      "profile": "assets/images/profile01.png",
      "dates": "2022.09.28",
      "content":
          "기념일이라 여자친구랑 맛있는거 먹고싶어서 오마카세 찾아보다가 처음이라 가성비 생각해서 예약하고 가게된곳인데 셰프님 넘 친절하셨어요. 입장할 때 문턱이 있어 넘어가기 힘들 수 있는데, 직원분이 직접 도와주시고 테이블에 휠체어가 바로 들어갈 수 있도록 세팅해주셨어요! \n음식은 말할것없이 너무 맛있네요☺️👍 비린것 하나없고, 재료의 최상의 맛을 끌어낸 초밥들이었어요.메뉴는 조금씩 달라지겠지만 오늘 먹은건 정말 완벽하게 최고였습니다! 이가격에 먹을 수 있다는게 행복하네요 리뷰 쓰다보니 또 가고싶어요..ㅠㅠ😭 나만알고싶은 찐맛집인데 사장님 돈쭐나셔서 오래하셨음 좋겠어서 여기저기 많이 입소문 내겠습니다!!💜💛💜💛"
    },
    {
      "name": "성해은",
      "profile": "assets/images/profile02.png",
      "dates": "2022.10.05",
      "content":
          "두달 전에 방문하고 또 재방문했어요! 1층에 위치해서 편했고, 문턱이 있지만 직원분들이 직접 도와주셔서 자리에 착석하기까지 문제없었답니다. \n그리고 이 가격에 이런 맛이라니ㅜㅜㅜ 너무 추천입니다. 대구 엔트리급에서는 무조건 탑이에요!!! 또 재재방문할게요💓💓 너무 친절하시고 맛있었어요!!!"
    },
    {
      "name": "정현규",
      "profile": "assets/images/profile01.png",
      "dates": "2022.09.28",
      "content":
          "기념일이라 여자친구랑 맛있는거 먹고싶어서 오마카세 찾아보다가 처음이라 가성비 생각해서 예약하고 가게된곳인데 셰프님 넘 친절하셨어요. 입장할 때 문턱이 있어 넘어가기 힘들 수 있는데, 직원분이 직접 도와주시고 테이블에 휠체어가 바로 들어갈 수 있도록 세팅해주셨어요! \n음식은 말할것없이 너무 맛있네요☺️👍 비린것 하나없고, 재료의 최상의 맛을 끌어낸 초밥들이었어요.메뉴는 조금씩 달라지겠지만 오늘 먹은건 정말 완벽하게 최고였습니다! 이가격에 먹을 수 있다는게 행복하네요 리뷰 쓰다보니 또 가고싶어요..ㅠㅠ😭 나만알고싶은 찐맛집인데 사장님 돈쭐나셔서 오래하셨음 좋겠어서 여기저기 많이 입소문 내겠습니다!!💜💛💜💛"
    },
    {
      "name": "성해은",
      "profile": "assets/images/profile02.png",
      "dates": "2022.10.05",
      "content":
          "두달 전에 방문하고 또 재방문했어요! 1층에 위치해서 편했고, 문턱이 있지만 직원분들이 직접 도와주셔서 자리에 착석하기까지 문제없었답니다. \n그리고 이 가격에 이런 맛이라니ㅜㅜㅜ 너무 추천입니다. 대구 엔트리급에서는 무조건 탑이에요!!! 또 재재방문할게요💓💓 너무 친절하시고 맛있었어요!!!"
    },
  ];
  final reviewPictureList = [
    [
      "assets/images/detail03.png",
      "assets/images/detail04.png",
      "assets/images/detail05.png",
      "assets/images/detail06.png",
    ],
    [
      "assets/images/detail06.png",
      "assets/images/detail07.png",
      "assets/images/detail08.png",
      "assets/images/detail01.png",
    ],
    [
      "assets/images/detail03.png",
      "assets/images/detail04.png",
      "assets/images/detail05.png",
      "assets/images/detail06.png",
    ],
    [
      "assets/images/detail06.png",
      "assets/images/detail07.png",
      "assets/images/detail08.png",
      "assets/images/detail01.png",
    ],
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      child: CustomScrollView(
        slivers: [
          SliverList(
            delegate: SliverChildListDelegate(
              [
                StoreInformation(),
              ],
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(childCount: reviewList.length,
                (context, index) {
              return Container(
                margin: EdgeInsets.fromLTRB(30.w, 17.h, 30.w, 13.h),
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.fromLTRB(0, 0, 0, 18.h),
                      height: 2.h,
                      width: 325.w,
                      color: kGreyColor,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(100.0),
                          child: Image.asset(
                            reviewList[index]["profile"]!,
                            height: 60.h,
                          ),
                        ),
                        SizedBox(
                          width: 16.w,
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                reviewList[index]["name"]!,
                                style: TextStyle(
                                    fontSize: 14, fontWeight: FontWeight.w600),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Text(
                                    reviewList[index]["dates"]!,
                                    style: TextStyle(
                                        fontSize: 12,
                                        color: Color.fromARGB(100, 0, 0, 0)),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 9.h,
                    ),
                    Container(
                      height: 100.h,
                      width: 325.w,
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: reviewPictureList[index].length,
                          itemBuilder: (cnt, idx) {
                            return Container(
                              margin: EdgeInsets.only(right: 12.w),
                              child: Image.asset(
                                reviewPictureList[index][idx],
                                height: 100.h,
                              ),
                            );
                          }),
                    ),
                    SizedBox(
                      height: 9.h,
                    ),
                    Text(
                      reviewList[index]["content"]!,
                      style: TextStyle(fontSize: 11),
                    )
                  ],
                ),
              );
            }),
          ),
        ],
      ),
    );
  }
}
