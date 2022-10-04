import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mega_market/controller/onboarding_controller.dart';
import 'package:mega_market/core/constants/color.dart';

class ExploreButtonOnboarding extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
      return GetBuilder<OnboardingControllerImp>(
        builder: (controller) {
          return Container(
            width: double.infinity,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(width: 1, color: AppColor.primaryColor)),
            child: MaterialButton(
              onPressed: () {
                controller.Home();
              },
              child: Text(
                "Explore".tr,
                style: TextStyle(
                  color: AppColor.primaryColor,
                  fontSize: 16,
                ),
              ),
            ),
          );
        }
      );
  }

}