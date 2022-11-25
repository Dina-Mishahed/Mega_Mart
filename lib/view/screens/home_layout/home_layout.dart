import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:mega_market/core/constants/color.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../controller/home_layout_controller.dart';
import '../../../core/constants/icon_assets.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    HomeLayoutControllerImp controller = Get.put(HomeLayoutControllerImp());
    return GetBuilder<HomeLayoutControllerImp>(builder: (controller) {
      List<BottomNavigationBarItem> bottomItem = [
        BottomNavigationBarItem(
          icon: SvgPicture.asset(
            IconAssets.homeIcon,
            color: controller.currentIndex == 0
                ? AppColor.primaryColor
                : AppColor.grey1,
          ),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset(
            IconAssets.categoryIcon,
            color: controller.currentIndex == 1
                ? AppColor.primaryColor
                : AppColor.grey1,
          ),
          label: 'Category',
        ),
        BottomNavigationBarItem(
          icon: Container(
            width: 60,
            height: 60,
            padding: EdgeInsets.all(18),
            child: SvgPicture.asset(
              IconAssets.cartIcon,
            ),
            decoration: BoxDecoration(
              color: controller.currentIndex == 2
                  ? AppColor.primaryColor
                  : AppColor.grey1,
              borderRadius: BorderRadius.circular(60.0),
            ),
          ),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset(
            IconAssets.favoriteIcon,
            color: controller.currentIndex == 3
                ? AppColor.primaryColor
                : AppColor.grey1,
          ),
          label: 'Favorite',
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset(
            IconAssets.profileIcon,
            color: controller.currentIndex == 4
                ? AppColor.primaryColor
                : AppColor.grey1,
          ),
          label: 'Profile',
        ),
      ];
      return Scaffold(
        bottomNavigationBar: BottomNavigationBar(
            selectedIconTheme: IconThemeData(color: AppColor.primaryColor),
            currentIndex: controller.currentIndex,
            onTap: (index) => controller.ChangeBottomNavBar(index),
            items: bottomItem //controller.bottomItem,
            ),
        body: controller.currentScreen,
      );
    });
  }
}
