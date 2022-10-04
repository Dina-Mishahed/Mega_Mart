import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:mega_market/controller/onboarding_controller.dart';
import 'package:mega_market/core/constants/color.dart';
import 'package:mega_market/data/data_source/static/static.dart';

class DotControllerOnboarding extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<OnboardingControllerImp>(
        builder: (controller) => Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ...List.generate(
                  onBoardingList.length,
                  (index) => AnimatedContainer(
                    margin: const EdgeInsets.only(right: 5),
                    duration: Duration(milliseconds: 900),
                    width: index == 0 ? 31 : 12,
                    height: 11,
                    decoration: BoxDecoration(
                      color: controller.currPage == index
                          ? AppColor.grey
                          : AppColor.primaryColor,
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                )
              ],
            ));
  }
}
