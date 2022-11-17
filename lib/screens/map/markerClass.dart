import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:frontend/screens/constants.dart';
import 'package:frontend/screens/map/infoClass.dart';
import 'package:naver_map_plugin/naver_map_plugin.dart'
    show Marker, OnMarkerTab, OverlayImage;

class CustomMarker extends Marker {
  final StoreType store;

  /// the old way
  // CustomMarker({
  //   required String markerId,
  //   required this.store,
  //   required LocationClass position,
  //   required String text,
  // }) : super(markerId: markerId, position: position, width: 30, height: 55, captionText: text, );

  /// for SDK 2.17 and up - the new way
  CustomMarker(
      {required this.store,
      required super.position,
      super.width = 30,
      super.height = 45})
      : super(
          markerId: store.uid,
          captionText: store.storeName,
          infoWindow: "• DETAIL: " +
              store.detailInfo +
              "\n• PHONE: " +
              store.phoneNumber +
              "\n• TIME: " +
              store.time,

          // iconTintColor: Colors.amber[900]
        );

  factory CustomMarker.fromMyStores(StoreType store) =>
      CustomMarker(store: store, position: store.location);

  Future<void> createImage(BuildContext context) async {
    this.icon =
        await OverlayImage.fromAssetImage(assetName: this.store.markerImage);
  }

  void setOnMarkerTab(
      void Function(Marker marker, Map<String, int> iconSize) callBack) {
    this.onMarkerTab = callBack as OnMarkerTab;
  }
}
