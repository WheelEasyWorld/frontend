import 'package:flutter/material.dart';

import 'package:frontend/screens/map/infoClass.dart';

class StoreInfoWidget extends StatelessWidget {
  const StoreInfoWidget({Key? key, required this.store}) : super(key: key);
  final StoreType? store;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 0.0,
      bottom: 0.0,
      child: Container(
        decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(color: Colors.grey, blurRadius: 2.0, spreadRadius: 1.0),
              BoxShadow(
                  color: Colors.grey.withOpacity(0.7),
                  blurRadius: 4.0,
                  spreadRadius: 2.0),
              BoxShadow(
                  color: Colors.grey.withOpacity(0.4),
                  blurRadius: 6.0,
                  spreadRadius: 5.0),
              BoxShadow(
                  color: Colors.grey.withOpacity(0.2),
                  blurRadius: 10.0,
                  spreadRadius: 12.0),
              BoxShadow(
                  color: Colors.grey.withOpacity(0.1),
                  blurRadius: 12.0,
                  spreadRadius: 14.0),
            ],
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(50.0),
                topRight: Radius.circular(50.0))),
        width: MediaQuery.of(context).size.width,
        height: 150.0,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Text("충전기 장소 이름:  ${this.store?.storeName}"),
            Text("상세위치:     ${this.store?.detailInfo}"),
            Text("전화번호:  ${this.store?.phoneNumber}"),
            Text("주소:     ${this.store?.address}"),
          ],
        ),
      ),
    );
  }
}
