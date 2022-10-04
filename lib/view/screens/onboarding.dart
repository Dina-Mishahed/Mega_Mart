import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:mega_market/controller/onboarding_controller.dart';
import 'package:mega_market/core/constants/color.dart';
import 'package:mega_market/data/data_source/static/static.dart';
import 'package:mega_market/view/widgets/custom_button.dart';
import 'package:mega_market/view/widgets/custom_text_button.dart';
import 'package:mega_market/view/widgets/onboarding/custom_slider.dart';
import 'package:mega_market/view/widgets/onboarding/dot_contrlooer.dart';
import 'package:mega_market/view/widgets/onboarding/explore_button.dart';

class OnBoardingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    Get.put(OnboardingControllerImp());
    return Scaffold(
        backgroundColor: Colors.white,
        resizeToAvoidBottomInset: false,
        body: SafeArea(
            child: Padding(
          padding: EdgeInsets.only(
              bottom: screenWidth * 0.08,
              right: screenWidth * 0.08,
              left: screenWidth * 0.08,
              top: screenWidth * 0.13),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                height: screenHeight * 0.5,
                child: CustomSliderOnboarding(),
              ),
              Expanded(
                child: Column(
                  children: [
                    DotControllerOnboarding(),
                    const SizedBox(
                      height: 10,
                    ),
                    GetBuilder<OnboardingControllerImp>(builder: (controller) {
                      return CustomButton(
                        btnText: "Sign up".tr,
                        btnFunction: () => controller.signup(),
                      );
                    }),
                    const SizedBox(
                      height: 10,
                    ),
                    ExploreButtonOnboarding(),
                    const Spacer(),
                     Text("Already have an account?".tr),
                    const SizedBox(
                      height: 10,
                    ),
                    GetBuilder<OnboardingControllerImp>(builder: (controller) {
                      return CustomTextButton(
                          text: "Sign In".tr,
                          funcOnTap: () => controller.signin());
                    }),
                  ],
                ),
              ),
            ],
          ),
        )));
  }
}
