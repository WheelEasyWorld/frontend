import 'package:flutter/material.dart';
import 'package:frontend/screens/community/community_screen.dart';
import 'package:frontend/screens/community/components/community_home_body.dart';
import 'package:frontend/screens/community/store_detail_screen.dart';
import 'package:frontend/screens/constants.dart';
import 'package:frontend/screens/home_screen.dart';
import 'package:frontend/screens/map/map.dart';
import 'package:frontend/screens/mypage/mypage_screen.dart';
import 'package:get/get.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

class HomeNavigator extends StatefulWidget {
  HomeNavigator({Key? key}) : super(key: key);

  @override
  State<HomeNavigator> createState() => _HomeNavigator();
}

class _HomeNavigator extends State<HomeNavigator> {
  PersistentTabController navController =
      PersistentTabController(initialIndex: 0);

  List<Widget> _showScreen() {
    return [
      const HomeScreen(),
      MarkerMapPage(),
      // MapScreen(),
      // NaverMap(),
      CommunityScreen(),
      // const HomeScsreen(),
      MyPageScreen(),
      // const MyPageScreen(),
    ];
  }

  List<PersistentBottomNavBarItem> _navBarItems() {
    return [
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.home_rounded),
        activeColorPrimary: kPinkColor,
        inactiveColorPrimary: kGreyColor,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.location_on),
        activeColorPrimary: kPinkColor,
        inactiveColorPrimary: kGreyColor,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.volunteer_activism_rounded),
        activeColorPrimary: kPinkColor,
        inactiveColorPrimary: kGreyColor,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.face_rounded),
        activeColorPrimary: kPinkColor,
        inactiveColorPrimary: kGreyColor,
      ),
    ];
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      context,
      controller: navController,
      screens: _showScreen(),
      items: _navBarItems(),
      confineInSafeArea: true,
      backgroundColor: Colors.white,
      handleAndroidBackButtonPress: true,
      resizeToAvoidBottomInset: true,
      stateManagement: true,
      hideNavigationBarWhenKeyboardShows: true,
      decoration: NavBarDecoration(
          borderRadius: BorderRadius.circular(10),
          colorBehindNavBar: Colors.white),
      popAllScreensOnTapOfSelectedTab: true,
      popActionScreens: PopActionScreensType.all,
      itemAnimationProperties: const ItemAnimationProperties(
        duration: Duration(milliseconds: 200),
        curve: Curves.ease,
      ),
      screenTransitionAnimation: const ScreenTransitionAnimation(
        animateTabTransition: true,
        curve: Curves.ease,
        duration: Duration(milliseconds: 200),
      ),
      navBarStyle: NavBarStyle.style6,
    );
  }
}
