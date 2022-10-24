import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:mega_market/core/constants/icon_assets.dart';
import 'package:mega_market/core/constants/routes.dart';

import '../core/constants/color.dart';
import '../view/screens/home_layout/cart.dart';
import '../view/screens/home_layout/category.dart';
import '../view/screens/home_layout/favorite.dart';
import '../view/screens/home_layout/home.dart';
import '../view/screens/home_layout/profile.dart';

abstract class HomeLayoutController extends GetxController {
  ChangeBottomNavBar(int index);
}

class HomeLayoutControllerImp extends HomeLayoutController {
  late int currentIndex;
  Widget currentScreen = HomeScreen();

  get index => currentIndex;

  get _currentScreen => currentScreen;
  // List<BottomNavigationBarItem> bottomItem = [
  //   BottomNavigationBarItem(
  //     icon: SvgPicture.asset(
  //       IconAssets.homeIcon,
  //       color: AppColor.grey1,
  //     ),
  //     label: 'Home',
  //   ),
  //   BottomNavigationBarItem(
  //     icon: SvgPicture.asset(
  //       "assets/icons/category_icon.svg",
  //       color: AppColor.grey1,
  //     ),
  //     label: 'Category',
  //   ),
  //   BottomNavigationBarItem(
  //     icon: Container(
  //       width: 60,
  //       height: 60,
  //       padding: EdgeInsets.all(18),
  //       child: SvgPicture.asset(
  //         "assets/icons/cart_icon.svg",
  //       ),
  //       decoration: BoxDecoration(
  //         color: AppColor.grey1,
  //         borderRadius: BorderRadius.circular(60.0),
  //       ),
  //     ),
  //     label: '',
  //   ),
  //   BottomNavigationBarItem(
  //     icon: SvgPicture.asset(
  //       "assets/icons/favorit_icon.svg",
  //       color: AppColor.grey1,
  //     ),
  //     label: 'Favorite',
  //   ),
  //   BottomNavigationBarItem(
  //     icon: SvgPicture.asset(
  //       "assets/icons/profile_icon.svg",
  //       color: AppColor.grey1,
  //     ),
  //     label: 'Profile',
  //   ),
  // ];
  List<Widget> screens = [
    HomeScreen(),
    CategoryScreen(),
    CartScreen(),
    FavoriteScreen(),
    ProfileScreen(),
  ];

  @override
  void onInit() {
    currentIndex = 0;
    super.onInit();
  }

  @override
  ChangeBottomNavBar(int index) {
    currentIndex = index;
    currentScreen = screens[index];
    update();
  }
}
