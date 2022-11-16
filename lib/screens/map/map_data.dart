import 'package:frontend/screens/map/infoClass.dart';
import 'package:frontend/screens/map/locationClass.dart';
import 'package:frontend/screens/map/markerClass.dart';

class PracticeData {
  static final List<StoreType> myStores = [
    Cafe(
      snsLink: "http://www.instagram.com/little_victory_sweets",
      phoneNumber: "053-803-0114",
      address: "대구광역시 중구 공평로 88",
      detailInfo: "1층 현관",
      uid: "1",
      storeName: "대구시청",
      location: LocationClass(latitude: 35.8715411, longitude: 128.6012201),
    ),
    Cafe(
      snsLink: "http://www.instagram.com/little_victory_sweets",
      phoneNumber: "053-254-9405",
      address: "대구광역시 중구 동성로2길 80",
      detailInfo: "공원관리사무소 앞",
      uid: "2",
      storeName: "2.28기념중앙공원",
      location: LocationClass(latitude: 35.8692142, longitude: 128.5971828),
    ),
    Restaurant(
      uid: "3",
      address: "대구광역시 중구 국채보상로 139길 1",
      detailInfo: "1층 민원실",
      phoneNumber: "053-661-2665",
      snsLink: "http://pf.kakao.com/_SxfBCT",
      storeName: "대구광역시 중구청",
      location: LocationClass(latitude: 35.86932522, longitude: 128.6061572),
    ),
    Restaurant(
      address: "대구광역시 중구 명덕로 185",
      phoneNumber: "053-643-2114",
      snsLink: "http://www.instagram.com/souvenir0_0/",
      uid: "4",
      detailInfo: "지하1층 대합실 앞",
      storeName: "1호선 명덕역",
      location: LocationClass(latitude: 35.85795165, longitude: 128.5911458),
    ),
  ];

  static List<CustomMarker> myMarkers() {
    List<CustomMarker> _list = [];
    PracticeData.myStores
        .forEach((StoreType st) => _list.add(CustomMarker.fromMyStores(st)));
    return _list;
  }
}
