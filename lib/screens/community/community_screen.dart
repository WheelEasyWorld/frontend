import 'package:flutter/material.dart';
import 'package:frontend/screens/community/components/community_home_body.dart';
import 'package:frontend/screens/constants.dart';
import 'package:frontend/widgets/app_bar.dart';
import 'package:get/get.dart';

class CommunityScreen extends StatefulWidget {
  CommunityScreen({Key? key}) : super(key: key);

  @override
  State<CommunityScreen> createState() => _CommunityScreenState();
}

class _CommunityScreenState extends State<CommunityScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppbar('Can Go 커뮤니티'),
      body: CommunityHomeBody(),
    );
  }
}
