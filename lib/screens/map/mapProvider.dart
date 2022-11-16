import 'package:flutter/foundation.dart';
import 'package:frontend/screens/map/infoClass.dart' show StoreType;
import 'package:frontend/screens/map/locationClass.dart';
import 'package:frontend/screens/map/locationService.dart';
import 'package:frontend/screens/map/map_data.dart';
import 'package:frontend/screens/map/markerClass.dart';
import 'package:naver_map_plugin/naver_map_plugin.dart'
    show LocationTrackingMode;

class MapProvider with ChangeNotifier {
  final LocationService _locationService = LocationService();
  final LocationClass initLocation = LocationService.initLocation;

  final List<CustomMarker> myMarkers = PracticeData.myMarkers();

  MapProvider() {
    Future(this.setCurrentLocation);
  }

  StoreType? _selectedStore;
  StoreType? get selectedStore => this._selectedStore;
  set selectedStore(StoreType? s) => throw "error";

  LocationTrackingMode _trackingMode = LocationTrackingMode.None;
  LocationTrackingMode get trackingMode => this._trackingMode;
  set trackingMode(LocationTrackingMode m) => throw "error";

  Future<void> setCurrentLocation() async {
    if (await this._locationService.canGetCurrentLocation()) {
      this._trackingMode = LocationTrackingMode.Follow;
      this.notifyListeners();
    }
  }

  void onTapMarker(String uid) {
    final StoreType _store =
        PracticeData.myStores.firstWhere((StoreType s) => s.uid == uid);
    this._selectedStore = _store;
    this.notifyListeners();
  }
}
