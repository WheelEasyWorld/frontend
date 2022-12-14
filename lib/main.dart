import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:frontend/firebase_options.dart';
import 'package:frontend/screens/chat-bot/chat_screen.dart';
import 'package:frontend/screens/community/community_screen.dart';
import 'package:frontend/screens/community/store_detail_screen.dart';
import 'package:frontend/screens/home_screen.dart';
import 'package:frontend/screens/map/map.dart';
import 'package:frontend/screens/navigator.dart';
import 'package:frontend/screens/manager-page/manager_home_screen.dart';
import 'package:frontend/screens/manager-page/time_table_screen.dart';
import 'package:get/get.dart';
import 'package:frontend/screens/login_screen.dart';
import 'package:frontend/screens/mypage/heart_screen.dart';
import 'package:frontend/screens/mypage/mypage_screen.dart';
import 'package:frontend/screens/mypage/request_screen.dart';
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

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
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
                initialRoute: '/navigator',
                getPages: [
                  GetPage(name: '/', page: () => const LoginScreen()),
                  GetPage(name: '/home_screen', page: () => HomeScreen()),
                  // GetPage(name: '/map_screen', page: () => NaverMap()),
                  GetPage(name: '/map_screen', page: () => MarkerMapPage()),
                  GetPage(name: '/navigator', page: () => HomeNavigator()),
                  GetPage(name: '/mypage', page: () => const MyPageScreen()),
                  GetPage(
                      name: '/mypage/request',
                      page: () => const RequestScreen()),
                  GetPage(
                      name: '/mypage/heart', page: () => const HeartScreen()),
                  GetPage(name: '/community', page: () => CommunityScreen()),
                  GetPage(
                    name: '/store_detail',
                    page: () => StoreDetailScreen(),
                  ),
                  GetPage(
                      name: '/manager_home', page: () => ManagerHomeScreen()),
                  GetPage(name: '/time_table', page: () => TimeTableScreen()),
                  GetPage(name: '/chat_screen', page: () => const ChatScreen()),
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
