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
  static const MODE_RESTAU = 0xF2;
  static const MODE_PHARMA = 0xF3;
  static const MODE_COMPLAINT = 0xF5;
  int _currentMode = MODE_CHARGE;

  Completer<NaverMapController> _controller = Completer();
  List<CustomMarker> _markers = [];
  String _option = 'π΄ μμμ ';
  final List<String> _optionList = [
    'π΄ μμμ ',
    'πͺ νΈμμ ',
    'π μ½κ΅­',
    'βοΈ μΉ΄ν',
    'π₯ λ³μ',
    'π¬ λ§νΈ',
    'π¦ μν',
    'π£ μ°μ²΄κ΅­'
  ];
  static final List<StoreType> myRestaurant = [
    Borrow(
      phoneNumber: "010-5682-6157",
      address: "λκ΅¬κ΄μ­μ μ€κ΅¬ λ¬Έμ°κ΄κΈΈ 25 1μΈ΅",
      detailInfo: "μΌμμΌ ν΄λ¬΄",
      uid: "b1",
      time: "18:00 - 22:00",
      storeName: "μΈ λ°ν€λΈνλ",
      location: LocationClass(
          latitude: 35.864656274004936, longitude: 128.59036705521285),
    ),
  ];
  static final List<StoreType> myPharmacy = [
    Borrow(
      phoneNumber: "053-425-5575",
      address: "λκ΅¬κ΄μ­μ μ€κ΅¬ μ€μλλ‘386-1",
      detailInfo: "ν , μΌμμΌ ν΄λ¬΄",
      uid: "b1",
      time: "09:00 - 21:00",
      storeName: "νμ±μ½κ΅­",
      location: LocationClass(
          latitude: 35.86776017532598, longitude: 128.5934891460874),
    ),
  ];
  static final List<StoreType> mycomplaint = [
    Complaint(
      phoneNumber: " - ",
      address: "λκ΅¬κ΄μ­μ μ€κ΅¬ λμ±λ‘2κ° 160-1",
      detailInfo: "λ³΄λλΈλ­μ΄ μΈνλΆνν΄μ μνν©λλ€.",
      uid: "p1",
      time: " - ",
      storeName: "λλ‘ μ΄μ© λΆνΈ λ―Όμ",
      location: LocationClass(
          latitude: 35.8691219296831, longitude: 128.59556896573935),
    ),
    Complaint(
      phoneNumber: " - ",
      address: "λκ΅¬κ΄μ­μ μ€κ΅¬ μ±λ΄1λ 68-1",
      detailInfo: "ν±μ΄ λλ¬΄ λμ ν μ²΄μ΄κ° μ¬λΌκ°κΈ°μ λλ¬΄ νλ€μμ΅λλ€.",
      uid: "p2",
      time: " - ",
      storeName: "κ±°λ¦¬ νκ²½ κ°μ  λ―Όμ",
      location: LocationClass(
          latitude: 35.86968394543123, longitude: 128.59721599468156),
    ),
    Complaint(
      phoneNumber: " - ",
      address: "λκ΅¬κ΄μ­μ μ€κ΅¬ λλ΄1λ",
      detailInfo: "ν μ²΄μ΄κ° ν λκ° κ²¨μ° μ§λκ° μ μλ λλΉ μλλ€.",
      uid: "p3",
      time: " - ",
      storeName: "κ±°λ¦¬ νκ²½ κ°μ  λ―Όμ",
      location: LocationClass(
          latitude: 35.85996920622018, longitude: 128.60741412664407),
    ),
  ];
  static final List<StoreType> myborrow = [
    Borrow(
      phoneNumber: "053-665-3211",
      address: "λκ΅¬κ΄μ­μ λΆκ΅¬ μ±λΆλ‘ 49",
      detailInfo: "λμ¬ μ μ²­ νμ",
      uid: "b1",
      time: "κΈ°λ³Έ 1μ£ΌμΌ (μ΅λ 2μ£Ό)",
      storeName: "λκ΅¬λΆκ΅¬λ³΄κ±΄μ",
      location: LocationClass(
          latitude: 35.89195276377569, longitude: 128.58891610672026),
    ),
    Borrow(
      phoneNumber: "053-662-3201",
      address: "λκ΅¬κ΄μ­μ λκ΅¬ λμ΄λ‘ 79",
      detailInfo: "λμ¬ μ μ²­ νμ",
      uid: "b2",
      time: "κΈ°λ³Έ 1μ£ΌμΌ (μ΅λ 2μ£Ό)",
      storeName: "λκ΅¬λκ΅¬λ³΄κ±΄μ",
      location: LocationClass(
          latitude: 35.88814143356798, longitude: 128.65121288889407),
    ),
    Borrow(
      phoneNumber: "053-661-3121",
      address: "λκ΅¬κ΄μ­μ μ€κ΅¬ ννλ‘ 45",
      detailInfo: "λμ¬ μ μ²­ νμ",
      uid: "b3",
      time: "κΈ°λ³Έ 1μ£ΌμΌ (μ΅λ 2μ£Ό)",
      storeName: "λκ΅¬μ€κ΅¬λ³΄κ±΄μ",
      location: LocationClass(
          latitude: 35.87969692843661, longitude: 128.58200591339073),
    ),
    Borrow(
      phoneNumber: "053-661-3304",
      address: "λκ΅¬κ΄μ­μ μ€κ΅¬ μ±λ΄1λ λμ±λ‘2κΈΈ 11",
      detailInfo: "λμ¬ μ μ²­ νμ",
      uid: "b4",
      time: "κΈ°λ³Έ 1μ£ΌμΌ (μ΅λ 2μ£Ό)",
      storeName: "μ±λ΄1λ νμ λ³΅μ§μΌν°",
      location: LocationClass(
          latitude: 35.86768885719687, longitude: 128.59612622984335),
    ),
    Borrow(
      phoneNumber: "053-661-3301",
      address: "λκ΅¬κ΄μ­μ μ€κ΅¬ λμΈλ4κ° 318-5",
      detailInfo: "λμ¬ μ μ²­ νμ",
      uid: "b5",
      time: "κΈ°λ³Έ 1μ£ΌμΌ (μ΅λ 2μ£Ό)",
      storeName: "λμΈλ νμ λ³΅μ§μΌν°",
      location: LocationClass(
          latitude: 35.8684383893926, longitude: 128.60947631372935),
    ),
    Borrow(
      phoneNumber: "053-661-3305",
      address: "λκ΅¬κ΄μ­μ μ€κ΅¬ λ¬κ΅¬λ²λλ‘415κΈΈ 48",
      detailInfo: "λμ¬ μ μ²­ νμ",
      uid: "b6",
      time: "κΈ°λ³Έ 1μ£ΌμΌ (μ΅λ 2μ£Ό)",
      storeName: "μ±λ΄2λ νμ λ³΅μ§μΌν°",
      location: LocationClass(
          latitude: 35.869088545057494, longitude: 128.5906818990979),
    ),
    Borrow(
      phoneNumber: "053-661-3309",
      address: "λκ΅¬κ΄μ­μ μ€κ΅¬ λ¨μ°2λ 573-1",
      detailInfo: "λμ¬ μ μ²­ νμ",
      uid: "b7",
      time: "κΈ°λ³Έ 1μ£ΌμΌ (μ΅λ 2μ£Ό)",
      storeName: "λ¨μ°2λνμ λ³΅μ§μΌν°",
      location: LocationClass(
          latitude: 35.86453265507296, longitude: 128.58956610025896),
    ),
    Borrow(
      phoneNumber: "1577-1000",
      address: "λκ΅¬κ΄μ­μ λΆκ΅¬ μΉ¨μ°λ¨λ‘ 199",
      detailInfo: "λμ¬ μ μ²­ νμ",
      uid: "b8",
      time: "κΈ°λ³Έ 2κ°μ (μ΅λ 4κ°μ)",
      storeName: "κ΅­λ―Όκ±΄κ°λ³΄νκ³΅λ¨",
      location: LocationClass(
          latitude: 35.8684383893926, longitude: 128.60947631372935),
    ),
  ];
  static final List<StoreType> myStores = [
    Charger(
      phoneNumber: "053-803-0114",
      address: "λκ΅¬κ΄μ­μ μ€κ΅¬ κ³΅νλ‘ 88",
      detailInfo: "1μΈ΅ νκ΄",
      uid: "c1",
      time: "09:00	-	18:00",
      storeName: "λκ΅¬μμ²­",
      location: LocationClass(latitude: 35.8715411, longitude: 128.6012201),
    ),
    Charger(
      phoneNumber: "053-254-9405",
      address: "λκ΅¬κ΄μ­μ μ€κ΅¬ λμ±λ‘2κΈΈ 80",
      detailInfo: "κ³΅μκ΄λ¦¬μ¬λ¬΄μ μ",
      uid: "c2",
      time: "00:00	-	23:59",
      storeName: "2.28κΈ°λμ€μκ³΅μ",
      location: LocationClass(latitude: 35.8692142, longitude: 128.5971828),
    ),
    Charger(
      uid: "c3",
      time: "09:00	-	18:00",
      address: "λκ΅¬κ΄μ­μ μ€κ΅¬ κ΅­μ±λ³΄μλ‘ 139κΈΈ 1",
      detailInfo: "1μΈ΅ λ―Όμμ€",
      phoneNumber: "053-661-2665",
      storeName: "λκ΅¬κ΄μ­μ μ€κ΅¬μ²­",
      location: LocationClass(latitude: 35.86932522, longitude: 128.6061572),
    ),
    Charger(
      address: "λκ΅¬κ΄μ­μ μ€κ΅¬ λͺλλ‘ 185",
      phoneNumber: "053-643-2114",
      uid: "c4",
      time: "05:30	-	23:30",
      detailInfo: "μ§ν1μΈ΅ λν©μ€ μ",
      storeName: "1νΈμ  λͺλμ­",
      location: LocationClass(latitude: 35.85795165, longitude: 128.5911458),
    ),
    Charger(
      address: "λκ΅¬κ΄μ­μ μ€κ΅¬ λ¬κ΅¬λ²λλ‘ 2190",
      phoneNumber: "053-643-2114",
      uid: "c5",
      time: "05:30	-	23:30",
      detailInfo: "μ§ν1μΈ΅ λν©μ€ μ",
      storeName: "2νΈμ  κ²½λλ³μμ­",
      location: LocationClass(latitude: 35.8632024, longitude: 128.6028002),
    ),
    Charger(
      address: "λκ΅¬κ΄μ­μ μ€κ΅¬ κ΅­μ±λ³΄μλ‘ 670",
      phoneNumber: "053-254-9401",
      uid: "c6",
      time: "00:00	-	23:59",
      detailInfo: "κ΅­μ±λ³΄μμ΄λκΈ°λκ΄ λ€νΈ",
      storeName: "κ΅­μ±λ³΄μμ΄λκΈ°λκ³΅μ",
      location: LocationClass(latitude: 35.86930105, longitude: 128.6017388),
    ),
    Charger(
      address: "λκ΅¬κ΄μ­μ μ€κ΅¬ ννλ‘ 45",
      phoneNumber: "053-661-3121",
      uid: "c7",
      time: "09:00	-	18:00",
      detailInfo: "1μΈ΅ λ―Όμμ€",
      storeName: "λκ΅¬κ΄μ­μ μ€κ΅¬ λ³΄κ±΄μ",
      location: LocationClass(latitude: 35.87790436, longitude: 128.583387),
    ),
    Charger(
      address: "λκ΅¬κ΄μ­μ μ€κ΅¬ κ²½μκ°μκΈΈ 99",
      phoneNumber: "053-254-9404",
      uid: "c8",
      time: "00:00	-	23:59",
      detailInfo: "κ³΅μνμ₯μ€ μ",
      storeName: "κ²½μκ°μκ³΅μ",
      location: LocationClass(latitude: 35.87267548, longitude: 128.5916854),
    ),
    Charger(
      address: "λκ΅¬κ΄μ­μ μ€κ΅¬ λλλ‘ 130",
      phoneNumber: "1666-5114",
      uid: "c9",
      time: "08:30	-	17:30",
      detailInfo: "μΈλλ μκ΅¬",
      storeName: "κ²½λΆλνκ΅λ³μ",
      location: LocationClass(latitude: 35.8662355, longitude: 128.6043147),
    ),
    Charger(
      address: "λκ΅¬κ΄μ­μ μ€κ΅¬ ννλ‘ 141",
      phoneNumber: "053-250-1400",
      uid: "c10",
      time: "09:00	-	18:00",
      detailInfo: "1μΈ΅ κ·Έλλν λ‘λΉ(λΉμλ¬Έμͺ½)",
      storeName: "λκ΅¬μ½μνΈνμ°μ€",
      location: LocationClass(latitude: 35.8760471, longitude: 128.5936973),
    ),
    Charger(
      address: "λκ΅¬κ΄μ­μ μ€κ΅¬ λ¬κ΅¬λ²λλ‘ 2100",
      phoneNumber: "053-255-7735",
      uid: "c11",
      time: "05:30	-	23:30",
      detailInfo: "νμΉν΅λ‘ λν©μ€ λ΄λΆ λ° 2μΈ΅ λν©μ€ μͺ½",
      storeName: "2νΈμ  λ°μλΉμ­(2λ)",
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
      padding: EdgeInsets.all(16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          // μ°©νκ°κ² λ¦¬μ€νΈ
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(60),
                  border: Border.all(
                    color: kStrongYellowColor,
                  )),
              height: 40,
              padding: EdgeInsets.all(8),
              margin: EdgeInsets.only(right: 8),
              child: GestureDetector(
                onTap: () => setState(() => {
                      _currentMode = MODE_RESTAU,
                      _markers.clear(),
                    }),
                child: ButtonTheme(
                  alignedDropdown: true,
                  focusColor: kStrongYellowColor,
                  child: DropdownButton<String>(
                      value: _option,
                      focusColor: kStrongYellowColor,
                      items: _optionList.map((String value) {
                        return DropdownMenuItem<String>(
                            value: value, child: Text(value));
                      }).toList(),
                      onChanged: ((String? value) {
                        setState(() {
                          _option = value!;
                          if (_option == "π΄ μμμ ") {
                            _currentMode = MODE_RESTAU;
                            _markers.clear();
                            for (int i = 0; i < myRestaurant.length; i++) {
                              _markers.add(CustomMarker(
                                store: myRestaurant[i],
                                position: myRestaurant[i].location,
                              ));
                            }
                          } else if (_option == "π μ½κ΅­") {
                            _currentMode = MODE_PHARMA;
                            _markers.clear();
                            for (int i = 0; i < myPharmacy.length; i++) {
                              _markers.add(CustomMarker(
                                store: myPharmacy[i],
                                position: myPharmacy[i].location,
                              ));
                            }
                          } else {
                            _markers.clear();
                          }
                        });
                      }),
                      icon: Icon(Icons.arrow_drop_down_rounded),
                      iconEnabledColor: kStrongYellowColor,
                      isExpanded: true,
                      borderRadius: BorderRadius.circular(20),
                      underline: Container(),
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                        fontSize: 14,
                      )

                      //dropdownColor: Colors.white,
                      ),
                ),
              ),
            ),
          ),
          // μΆ©μ κΈ° λμ¬ μ₯μ
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
                    borderRadius: BorderRadius.circular(50),
                    border: Border.all(color: kBrownColor)),
                padding: EdgeInsets.all(8),
                margin: EdgeInsets.only(right: 8),
                child: Text(
                  'β‘οΈ μΆ©μ κΈ° μμΉ',
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
          // λ―Όμ λ°μν μ₯μ
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
                child: Text(
                  'βοΈ λ―Όμ λ°μ',
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
    return NaverMap(
      zoomGestureEnable: true,
      locationButtonEnable: true,
      onMapCreated: _onMapCreated,
      markers: _markers,
      initLocationTrackingMode: LocationTrackingMode.Follow,
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: <Widget>[
            _naverMap(),
            _controlPanel(),
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
