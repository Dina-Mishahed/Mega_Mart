import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:mega_market/core/constants/color.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../controller/home_layout_controller.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    HomeLayoutControllerImp controller = Get.put(HomeLayoutControllerImp());
    //print("main currenIndex ${controller.currentIndex}");
    return GetBuilder<HomeLayoutControllerImp>(
      builder: (controller) {
        return Scaffold(
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: controller.currentIndex,
            onTap:(index) => controller.ChangeBottomNavBar(index),
            items: controller.bottomItem,
          ),
          body: controller.currentScreen,
        );
      }
    );
  }
}
