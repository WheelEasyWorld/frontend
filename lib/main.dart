import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:frontend/screens/login_screen.dart';
import 'package:frontend/screens/splash_screen.dart';
import 'package:get/route_manager.dart';
import 'package:kakao_flutter_sdk/kakao_flutter_sdk_template.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

Future main() async {
  // To load the .env file contents into dotenv.
  await dotenv.load(fileName: ".env");

  // runApp() 호출 전 Flutter SDK 초기화
  KakaoSdk.init(
    nativeAppKey: dotenv.env['NATIVE_APP_KEY'],
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Init.instance.initialize(),
      builder: (context, AsyncSnapshot snapshot) {
        // Show splash screen while waiting for app resources to load:
        if (snapshot.connectionState == ConnectionState.waiting) {
          return ScreenUtilInit(
            designSize: const Size(375, 812), //iPhone 13 mini
            builder: (context, child) {
              return const MaterialApp(
                debugShowCheckedModeBanner: false,
                home: SplashScreen(),
              );
            },
          );
        } else {
          // Loading is done, return the app:
          return ScreenUtilInit(
            designSize: const Size(375, 812),
            builder: (context, child) {
              return GetMaterialApp(
                debugShowCheckedModeBanner: false,
                title: 'wheel-easy-world',
                initialRoute: '/',
                getPages: [
                  GetPage(name: '/', page: () => const LoginScreen()),
                ],
                theme: ThemeData(
                  fontFamily: 'Noto_Sans_KR',
                ),
              );
            },
          );
        }
      },
    );
  }
}
