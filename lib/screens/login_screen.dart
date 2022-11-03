import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:frontend/widgets/sns_button.dart';

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
              onPressed: () {},
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
