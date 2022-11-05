import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:frontend/screens/community/community_screen.dart';
import 'package:frontend/screens/community/store_detail_screen.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      builder: (BuildContext context, Widget? child) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'wheel-easy-world',
          initialRoute: '/',
          getPages: [
            GetPage(name: '/', page: () => CommunityScreen()),
            GetPage(
              name: '/store_detail',
              page: () => StoreDetailScreen(),
            )
          ],
          theme: ThemeData(
              //fontFamily: 'Noto_Sans_KR',
              ),
        );
      },
    );
  }
}
