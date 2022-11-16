import 'dart:io';

import 'package:flutter/material.dart';
import 'package:frontend/screens/map/iosmap.dart';
import 'package:frontend/screens/map/map.dart';
import 'package:frontend/screens/map/mapProvider.dart';
import 'package:provider/provider.dart';

void main() => runApp(NaverMap());

class NaverMap extends StatelessWidget {
  const NaverMap({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<MapProvider>(create: (_) => MapProvider())
      ],
      child: MaterialApp(
        home: MainPage(),
      ),
    );
  }
}

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final MapProvider _mapProvider = Provider.of<MapProvider>(context);

    return Platform.isAndroid
        ? AndroidMain(
            mapProvider: _mapProvider,
          )
        : IosMain();
  }
}
