import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:kakao_flutter_sdk/kakao_flutter_sdk_talk.dart';

Future getUser() async {
  try {
    User user = await UserApi.instance.me();
    debugPrint('사용자 정보 요청 성공'
        '\n회원번호: ${user.id}'
        '\n닉네임: ${user.kakaoAccount?.profile?.nickname}'
        '\n프로필사진: ${user.kakaoAccount?.profile?.profileImageUrl}');

  } catch (error) {
    debugPrint('사용자 정보 요청 실패 $error');

    return null;
  }
}