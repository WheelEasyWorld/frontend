// import 'dart:async';

// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:frontend/widgets/app_bar.dart';
// import 'package:naver_map_plugin/naver_map_plugin.dart';

// class MapScreen extends StatefulWidget {
//   @override
//   State<MapScreen> createState() => _MapScreenState();
// }

// class _MapScreenState extends State<MapScreen> {
//   final scaffoldKey = GlobalKey<ScaffoldState>();
//   Completer<NaverMapController> _controller = Completer();

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: buildAppbar("지도"),
//         body: NaverMap(
//           onMapCreated: _onMapCreated,
//         ),
//       ),
//     );
//   }

//   void _onMapCreated(NaverMapController controller) {
//     if (_controller.isCompleted) _controller = Completer();
//     _controller.complete(controller);
//   }
// }

import 'package:flutter/material.dart';
import 'package:frontend/screens/map/markerClass.dart';
import 'package:frontend/screens/map/infoWidget.dart';
import 'package:naver_map_plugin/naver_map_plugin.dart' as naver;

import 'package:frontend/screens/map/mapProvider.dart';

class AndroidMain extends StatefulWidget {
  AndroidMain({Key? key, required this.mapProvider}) : super(key: key);
  final MapProvider mapProvider;

  @override
  State<AndroidMain> createState() => _AndroidMainState();
}

class _AndroidMainState extends State<AndroidMain> {
  bool _showBottomSheet = false;
  naver.NaverMapController? _mct;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) return;
      widget.mapProvider.myMarkers.forEach((CustomMarker marker) {
        marker.createImage(context);
        marker.setOnMarkerTab(
            (naver.Marker marker, Map<String, int> iconSize) async {
          _showBottomSheet = true;
          widget.mapProvider.onTapMarker(marker.markerId);
          await _mct?.moveCamera(
              naver.CameraUpdate.scrollTo(marker.position as naver.LatLng));
          // naver.LatLngBounds bounds = new naver.LatLngBounds(southwest: naver.LatLng(35.871026, 128.590782), northeast: naver.LatLng(35.862342, 128.600938));
          // this._mct?.moveCamera(naver.CameraUpdate.fitBounds(bounds));
        });
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: <Widget>[
        naver.NaverMap(
          zoomGestureEnable: true,
          initLocationTrackingMode: widget.mapProvider.trackingMode,
          initialCameraPosition:
              naver.CameraPosition(target: widget.mapProvider.initLocation),
          locationButtonEnable: true,
          onMapTap: (naver.LatLng ln) {
            setState(() {
              _showBottomSheet = true;
            });
          },
          onMapCreated: (naver.NaverMapController ct) {
            _mct = ct;
          },
          markers: widget.mapProvider.myMarkers,
        ),
        _showBottomSheet
            ? StoreInfoWidget(store: widget.mapProvider.selectedStore)
            : Container(),
      ],
    ));
  }
}
