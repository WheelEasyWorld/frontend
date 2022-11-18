import 'package:frontend/screens/map/locationClass.dart';

abstract class StoreType {
  final String uid = "";
  final String storeName = "";
  final String address = "";
  final String markerImage = "";
  final LocationClass location = LocationClass(longitude: 0.0, latitude: 0.0);
  final String detailInfo = "";
  final String phoneNumber = "";
  final String time = "";
}

class Charger implements StoreType {
  @override
  final String uid;

  @override
  final String address;

  @override
  final String detailInfo;

  @override
  final String phoneNumber;

  @override
  final String markerImage = "assets/images/logo.png";

  @override
  final String storeName;

  @override
  final LocationClass location;

  @override
  final String time;

  Charger(
      {required this.uid,
      required this.storeName,
      required this.location,
      required this.address,
      required this.detailInfo,
      required this.phoneNumber,
      required this.time});
}

class Borrow implements StoreType {
  @override
  final String uid;

  @override
  final String address;

  @override
  final String detailInfo;

  @override
  final String phoneNumber;
  @override
  final String markerImage = "assets/images/logo.png";

  @override
  final String storeName;

  @override
  final LocationClass location;

  @override
  final String time;

  Borrow(
      {required this.uid,
      required this.storeName,
      required this.location,
      required this.address,
      required this.detailInfo,
      required this.phoneNumber,
      required this.time});
}

class Complaint implements StoreType {
  @override
  final String uid;

  @override
  final String address;

  @override
  final String detailInfo;

  @override
  final String phoneNumber;
  @override
  final String markerImage = "assets/images/logo.png";

  @override
  final String storeName;
  @override
  final String time;

  @override
  final LocationClass location;

  Complaint(
      {required this.uid,
      required this.storeName,
      required this.location,
      required this.address,
      required this.detailInfo,
      required this.phoneNumber,
      required this.time});
}
