import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:mega_market/core/constants/routes.dart';

import '../core/constants/color.dart';
import '../view/screens/cart.dart';
import '../view/screens/category.dart';
import '../view/screens/favorite.dart';
import '../view/screens/home.dart';
import '../view/screens/profile.dart';

abstract class HomeLayoutController extends GetxController {
  ChangeBottomNavBar(int index);
}

class HomeLayoutControllerImp extends HomeLayoutController {
  int currentIndex = 0;
  Widget currentScreen = HomeScreen();
  List<BottomNavigationBarItem> bottomItem = [
    BottomNavigationBarItem(
      icon: SvgPicture.asset("assets/icons/home_icon.svg",
      ),
      label: 'Home',
    ),
    BottomNavigationBarItem(
      icon: SvgPicture.asset("assets/icons/category_icon.svg"),
      label: 'Category',
    ),
    BottomNavigationBarItem(
      icon: Container(
        width: 60,
        height: 60,
        padding: EdgeInsets.all(18),
        child: SvgPicture.asset(
          "assets/icons/cart_icon.svg",
        ),
        decoration: BoxDecoration(
          color: AppColor.primaryColor,
          borderRadius: BorderRadius.circular(60.0),
        ),
      ),
      label: '',
    ),
    BottomNavigationBarItem(
      icon: SvgPicture.asset("assets/icons/favorit_icon.svg",),
      label: 'Favorite',
    ),
    BottomNavigationBarItem(
      icon: SvgPicture.asset("assets/icons/profile_icon.svg"),
      label: 'Profile',
    ),
  ];
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

  get index => currentIndex;
  get _currentScreen => currentScreen;
  @override
  ChangeBottomNavBar(int index) {
    currentIndex = index;
    currentScreen = screens[index];
    update();
  }
}
