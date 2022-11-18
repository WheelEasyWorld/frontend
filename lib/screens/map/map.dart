import 'package:flutter/material.dart';
import 'package:frontend/screens/constants.dart';
import 'package:frontend/screens/map/infoClass.dart';
import 'package:frontend/screens/map/locationClass.dart';
import 'package:frontend/screens/map/markerClass.dart';
import 'package:naver_map_plugin/naver_map_plugin.dart' as naver;

import 'dart:async';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:naver_map_plugin/naver_map_plugin.dart';

class MarkerMapPage extends StatefulWidget {
  @override
  _MarkerMapPageState createState() => _MarkerMapPageState();
}

class _MarkerMapPageState extends State<MarkerMapPage> {
  static const MODE_CHARGE = 0xF1;
  static const MODE_BORROW = 0xF2;
  static const MODE_COMPLAINT = 0xF3;
  int _currentMode = MODE_CHARGE;

  Completer<NaverMapController> _controller = Completer();
  List<CustomMarker> _markers = [];
  static final List<StoreType> mycomplaint = [
    Complaint(
      phoneNumber: " - ",
      address: "대구광역시 중구 동성로2가 160-1",
      detailInfo: "보도블럭이 울퉁불퉁해서 위험합니다.",
      uid: "p1",
      time: " - ",
      storeName: "보도블럭 불량",
      location: LocationClass(
          latitude: 35.8691219296831, longitude: 128.59556896573935),
    ),
    Complaint(
      phoneNumber: " - ",
      address: "대구광역시 중구 성내1동 68-1",
      detailInfo: "휠체어가 한 대가 겨우 지나갈 수 있는 너비 입니다",
      uid: "p2",
      time: " - ",
      storeName: "휠체어가 다니기 좁은 인도",
      location: LocationClass(
          latitude: 35.86968394543123, longitude: 128.59721599468156),
    ),
    Complaint(
      phoneNumber: " - ",
      address: "대구광역시 대봉동",
      detailInfo: "휠체어가 한 대가 겨우 지나갈 수 있는 너비 입니다",
      uid: "p3",
      time: " - ",
      storeName: "휠체어가 다니기 좁은 인도",
      location: LocationClass(
          latitude: 35.85996920622018, longitude: 128.60741412664407),
    ),
  ];
  static final List<StoreType> myborrow = [
    Borrow(
      phoneNumber: "053-665-3211",
      address: "대구광역시 북구 성북로 49",
      detailInfo: "대여 신청 필요",
      uid: "b1",
      time: "기본 1주일 (최대 2주)",
      storeName: "대구북구보건소",
      location: LocationClass(
          latitude: 35.89195276377569, longitude: 128.58891610672026),
    ),
    Borrow(
      phoneNumber: "053-662-3201",
      address: "대구광역시 동구 동촌로 79",
      detailInfo: "대여 신청 필요",
      uid: "b2",
      time: "기본 1주일 (최대 2주)",
      storeName: "대구동구보건소",
      location: LocationClass(
          latitude: 35.88814143356798, longitude: 128.65121288889407),
    ),
    Borrow(
      phoneNumber: "053-661-3121",
      address: "대구광역시 중구 태평로 45",
      detailInfo: "대여 신청 필요",
      uid: "b3",
      time: "기본 1주일 (최대 2주)",
      storeName: "대구중구보건소",
      location: LocationClass(
          latitude: 35.87969692843661, longitude: 128.58200591339073),
    ),
    Borrow(
      phoneNumber: "053-661-3304",
      address: "대구광역시 중구 성내1동 동성로2길 11",
      detailInfo: "대여 신청 필요",
      uid: "b4",
      time: "기본 1주일 (최대 2주)",
      storeName: "성내1동 행정복지센터",
      location: LocationClass(
          latitude: 35.86768885719687, longitude: 128.59612622984335),
    ),
    Borrow(
      phoneNumber: "053-661-3301",
      address: "대구광역시 중구 동인동4가 318-5",
      detailInfo: "대여 신청 필요",
      uid: "b5",
      time: "기본 1주일 (최대 2주)",
      storeName: "동인동 행정복지센터",
      location: LocationClass(
          latitude: 35.8684383893926, longitude: 128.60947631372935),
    ),
    Borrow(
      phoneNumber: "053-661-3305",
      address: "대구광역시 중구 달구벌대로415길 48",
      detailInfo: "대여 신청 필요",
      uid: "b6",
      time: "기본 1주일 (최대 2주)",
      storeName: "성내2동 행정복지센터",
      location: LocationClass(
          latitude: 35.869088545057494, longitude: 128.5906818990979),
    ),
    Borrow(
      phoneNumber: "053-661-3309",
      address: "대구광역시 중구 남산2동 573-1",
      detailInfo: "대여 신청 필요",
      uid: "b7",
      time: "기본 1주일 (최대 2주)",
      storeName: "남산2동행정복지센터",
      location: LocationClass(
          latitude: 35.86453265507296, longitude: 128.58956610025896),
    ),
    Borrow(
      phoneNumber: "1577-1000",
      address: "대구광역시 북구 침산남로 199",
      detailInfo: "대여 신청 필요",
      uid: "b8",
      time: "기본 2개월 (최대 4개월)",
      storeName: "국민건강보험공단",
      location: LocationClass(
          latitude: 35.8684383893926, longitude: 128.60947631372935),
    ),
  ];
  static final List<StoreType> myStores = [
    Charger(
      phoneNumber: "053-803-0114",
      address: "대구광역시 중구 공평로 88",
      detailInfo: "1층 현관",
      uid: "c1",
      time: "09:00	-	18:00",
      storeName: "대구시청",
      location: LocationClass(latitude: 35.8715411, longitude: 128.6012201),
    ),
    Charger(
      phoneNumber: "053-254-9405",
      address: "대구광역시 중구 동성로2길 80",
      detailInfo: "공원관리사무소 앞",
      uid: "c2",
      time: "00:00	-	23:59",
      storeName: "2.28기념중앙공원",
      location: LocationClass(latitude: 35.8692142, longitude: 128.5971828),
    ),
    Charger(
      uid: "c3",
      time: "09:00	-	18:00",
      address: "대구광역시 중구 국채보상로 139길 1",
      detailInfo: "1층 민원실",
      phoneNumber: "053-661-2665",
      storeName: "대구광역시 중구청",
      location: LocationClass(latitude: 35.86932522, longitude: 128.6061572),
    ),
    Charger(
      address: "대구광역시 중구 명덕로 185",
      phoneNumber: "053-643-2114",
      uid: "c4",
      time: "05:30	-	23:30",
      detailInfo: "지하1층 대합실 앞",
      storeName: "1호선 명덕역",
      location: LocationClass(latitude: 35.85795165, longitude: 128.5911458),
    ),
    Charger(
      address: "대구광역시 중구 달구벌대로 2190",
      phoneNumber: "053-643-2114",
      uid: "c5",
      time: "05:30	-	23:30",
      detailInfo: "지하1층 대합실 앞",
      storeName: "2호선 경대병원역",
      location: LocationClass(latitude: 35.8632024, longitude: 128.6028002),
    ),
    Charger(
      address: "대구광역시 중구 국채보상로 670",
      phoneNumber: "053-254-9401",
      uid: "c6",
      time: "00:00	-	23:59",
      detailInfo: "국채보상운동기념관 뒤편",
      storeName: "국채보상운동기념공원",
      location: LocationClass(latitude: 35.86930105, longitude: 128.6017388),
    ),
    Charger(
      address: "대구광역시 중구 태평로 45",
      phoneNumber: "053-661-3121",
      uid: "c7",
      time: "09:00	-	18:00",
      detailInfo: "1층 민원실",
      storeName: "대구광역시 중구 보건소",
      location: LocationClass(latitude: 35.87790436, longitude: 128.583387),
    ),
    Charger(
      address: "대구광역시 중구 경상감영길 99",
      phoneNumber: "053-254-9404",
      uid: "c8",
      time: "00:00	-	23:59",
      detailInfo: "공원화장실 앞",
      storeName: "경상감영공원",
      location: LocationClass(latitude: 35.87267548, longitude: 128.5916854),
    ),
    Charger(
      address: "대구광역시 중구 동덕로 130",
      phoneNumber: "1666-5114",
      uid: "c9",
      time: "08:30	-	17:30",
      detailInfo: "외래동 입구",
      storeName: "경북대학교병원",
      location: LocationClass(latitude: 35.8662355, longitude: 128.6043147),
    ),
    Charger(
      address: "대구광역시 중구 태평로 141",
      phoneNumber: "053-250-1400",
      uid: "c10",
      time: "09:00	-	18:00",
      detailInfo: "1층 그랜드홀 로비(비상문쪽)",
      storeName: "대구콘서트하우스",
      location: LocationClass(latitude: 35.8760471, longitude: 128.5936973),
    ),
    Charger(
      address: "대구광역시 중구 달구벌대로 2100",
      phoneNumber: "053-255-7735",
      uid: "c11",
      time: "05:30	-	23:30",
      detailInfo: "환승통로 대합실 내부 및 2층 대합실 쪽",
      storeName: "2호선 반월당역(2대)",
      location: LocationClass(latitude: 35.866801, longitude: 128.590545),
    ),
  ];

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      super.initState();
    });
  }

  _controlPanel() {
    return Container(
      color: Color.fromRGBO(255, 255, 255, 0),
      padding: EdgeInsets.all(16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          // 충전기 대여 장소
          Expanded(
            child: GestureDetector(
              onTap: () => setState(() => {
                    _currentMode = MODE_CHARGE,
                    _markers.clear(),
                    for (int i = 0; i < myStores.length; i++)
                      {
                        _markers.add(CustomMarker(
                          store: myStores[i],
                          position: myStores[i].location,
                        ))
                      }
                  }),
              child: Container(
                decoration: BoxDecoration(
                    color: _currentMode == MODE_CHARGE
                        ? kBrownColor
                        : Colors.white,
                    borderRadius: BorderRadius.circular(60),
                    border: Border.all(color: kBrownColor)),
                padding: EdgeInsets.all(8),
                margin: EdgeInsets.only(right: 8),
                child: Text(
                  '⚡️ 충전기 위치',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: _currentMode == MODE_CHARGE
                        ? Colors.white
                        : kBrownColor,
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                  ),
                ),
              ),
            ),
          ),
          // 휠체어 대여할 수 있는 장소
          Expanded(
            child: GestureDetector(
              onTap: () => setState(() => {
                    _currentMode = MODE_BORROW,
                    _markers.clear(),
                    for (int i = 0; i < myborrow.length; i++)
                      {
                        _markers.add(CustomMarker(
                          store: myborrow[i],
                          position: myborrow[i].location,
                        ))
                      }
                  }),
              child: Container(
                decoration: BoxDecoration(
                    color: _currentMode == MODE_BORROW
                        ? kStrongYellowColor
                        : Colors.white,
                    borderRadius: BorderRadius.circular(50),
                    border: Border.all(color: kStrongYellowColor)),
                padding: EdgeInsets.all(8),
                margin: EdgeInsets.only(right: 8),
                child: Text(
                  '🦽 휠체어 대여',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: _currentMode == MODE_BORROW
                        ? Colors.white
                        : kStrongYellowColor,
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                  ),
                ),
              ),
            ),
          ),
          // 민원 발생한 장소
          Expanded(
            child: GestureDetector(
              onTap: () => setState(() => {
                    _currentMode = MODE_COMPLAINT,
                    _markers.clear(),
                    for (int i = 0; i < mycomplaint.length; i++)
                      {
                        _markers.add(CustomMarker(
                          store: mycomplaint[i],
                          position: mycomplaint[i].location,
                        ))
                      }
                  }),
              child: Container(
                decoration: BoxDecoration(
                    color: _currentMode == MODE_COMPLAINT
                        ? kCoralColor
                        : Colors.white,
                    borderRadius: BorderRadius.circular(50),
                    border: Border.all(color: kCoralColor)),
                padding: EdgeInsets.all(8),
                margin: EdgeInsets.only(right: 8),
                child: Text(
                  '⛔️ 민원 발생',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: _currentMode == MODE_COMPLAINT
                        ? Colors.white
                        : kCoralColor,
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                  ),
                ),
              ),
            ),
          ),

          // // none
          // GestureDetector(
          //   onTap: () => setState(() => _currentMode = MODE_NONE),
          //   child: Container(
          //     decoration: BoxDecoration(
          //         color:
          //             _currentMode == MODE_NONE ? Colors.black : Colors.white,
          //         borderRadius: BorderRadius.circular(6),
          //         border: Border.all(color: Colors.black)),
          //     padding: EdgeInsets.all(4),
          //     child: Icon(
          //       Icons.clear,
          //       color: _currentMode == MODE_NONE ? Colors.white : Colors.black,
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }

  _naverMap() {
    return Expanded(
      child: Stack(
        children: <Widget>[
          NaverMap(
            zoomGestureEnable: true,
            locationButtonEnable: true,
            onMapCreated: _onMapCreated,
            markers: _markers,
            initLocationTrackingMode: LocationTrackingMode.Follow,
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: <Widget>[
            _controlPanel(),
            _naverMap(),
          ],
        ),
      ),
    );

    // ================== method ==========================

    void _onMapCreated(NaverMapController controller) {
      // _controller.complete(controller);
    }

    void _onMapTap(LatLng latLng) {
      setState(() {
        for (int i = 0; i < myStores.length; i++) {
          _markers[i].captionText = "";
        }
      });
    }

    void _onMarkerTap(Marker? marker, Map<String, int?> iconSize) {
      int pos = _markers.indexWhere((m) => m.markerId == marker?.markerId);
      // int pos = 0;
      setState(() {
        _markers[pos].infoWindow = _markers[pos].store.detailInfo;
        // _markers[pos].captionTextSize = 5.0;
      });
    }
  }

  void _onMapCreated(naver.NaverMapController controller) {}
}
