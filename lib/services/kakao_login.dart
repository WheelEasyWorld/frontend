import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:frontend/screens/chat-bot/chat_screen.dart';
import 'package:frontend/screens/mypage/mypage_screen.dart';
import 'package:get/get.dart';
import 'package:kakao_flutter_sdk/kakao_flutter_sdk_talk.dart';

import '../screens/manager-page/manager_home_screen.dart';

Future getUser() async {
  User user;
  try {
    user = await UserApi.instance.me();
    debugPrint('사용자 정보 요청 성공'
        '\n회원번호: ${user.id}'
        '\n닉네임: ${user.kakaoAccount?.profile?.nickname}'
        '\n프로필사진: ${user.kakaoAccount?.profile?.profileImageUrl}');

    if (await checkUser(user)) {
      //사용자가 존재하지 않으면
      //디비에 사용자 추가
      CollectionReference users =
          FirebaseFirestore.instance.collection('users');
      users
          .add({
            'id': user.id,
            'nickname': user.kakaoAccount?.profile?.nickname,
            'profile_img': user.kakaoAccount?.profile?.profileImageUrl,
          })
          .then((value) => debugPrint("User Added"))
          .catchError((error) => debugPrint("Failed to add user: $error"));
    }
    Get.to(ManagerHomeScreen());
  } catch (error) {
    debugPrint('사용자 정보 요청 실패 $error');
  }
}

Future<bool> checkUser(User user) async {
  var snapshot = FirebaseFirestore.instance
      .collection('users')
      .where('id', isEqualTo: user.id)
      .snapshots();

  if (await snapshot.isEmpty) {
    debugPrint("사용자가 존재하지 않습니다.");
    return true;
  } else {
    debugPrint("사용자가 이미 존재합니다.");
    return false;
  }
}
