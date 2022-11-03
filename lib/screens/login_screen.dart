import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:frontend/widgets/sns_button.dart';
import 'package:kakao_flutter_sdk/kakao_flutter_sdk_talk.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 35.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/images/logo.png'),
            SNSButton(
              onPressed: () {
                kakaoLogin();
              },
              icon: 'kakao',
              label: '카카오로 시작하기',
              btnColor: const Color(0xFFFEE500),
              textColor: const Color(0xFF191919),
            ),
            SizedBox(height: 13.h),
            SNSButton(
              onPressed: () {},
              icon: 'naver',
              label: '네이버로 시작하기',
              btnColor: const Color(0xFF03CF5D),
              textColor: Colors.white,
            ),
            SizedBox(height: 13.h),
            SNSButton(
              onPressed: () {},
              icon: 'google',
              label: '구글로 시작하기',
              borderSide: const BorderSide(),
              btnColor: Colors.white,
            ),
          ],
        ),
      )),
    );
  }
}

Future kakaoLogin() async {
  // 카카오톡 실행 가능 여부 확인
  // 카카오톡 실행이 가능하면 카카오톡으로 로그인, 아니면 카카오계정으로 로그인
  if (await isKakaoTalkInstalled()) {
    try {
      await UserApi.instance.loginWithKakaoTalk();
      debugPrint('카카오톡으로 로그인 성공');
    } catch (error) {
      debugPrint('카카오톡으로 로그인 실패 $error');

      // 사용자가 카카오톡 설치 후 디바이스 권한 요청 화면에서 로그인을 취소한 경우,
      // 의도적인 로그인 취소로 보고 카카오계정으로 로그인 시도 없이 로그인 취소로 처리 (예: 뒤로 가기)
      if (error is PlatformException && error.code == 'CANCELED') {
        return;
      }
      // 카카오톡에 연결된 카카오계정이 없는 경우, 카카오계정으로 로그인
      try {
        await UserApi.instance.loginWithKakaoAccount();
        debugPrint('카카오계정으로 로그인 성공');
      } catch (error) {
        debugPrint('카카오계정으로 로그인 실패 $error');
      }
    }
  } else {
    try {
      await UserApi.instance.loginWithKakaoAccount();
      debugPrint('카카오계정으로 로그인 성공');
    } catch (error) {
      debugPrint('카카오계정으로 로그인 실패 $error');
    }
  }
}
