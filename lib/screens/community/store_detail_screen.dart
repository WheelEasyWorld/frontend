import 'package:flutter/material.dart';
import 'package:frontend/screens/community/components/store_detail_body.dart';
import 'package:frontend/screens/constants.dart';
import 'package:frontend/widgets/app_bar.dart';

class StoreDetailScreen extends StatefulWidget {
  StoreDetailScreen({Key? key}) : super(key: key);

  @override
  State<StoreDetailScreen> createState() => _StoreDetailScreenState();
}

class _StoreDetailScreenState extends State<StoreDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppbar("Can Go 착한가게", true),
      body: StoreDetailBody(),
    );
  }
}
