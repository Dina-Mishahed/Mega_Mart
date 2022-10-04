import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mega_market/controller/onboarding_controller.dart';
import 'package:mega_market/data/data_source/static/static.dart';

class CustomSliderOnboarding extends GetView<OnboardingControllerImp> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constrains) {
      double localHieght = constrains.maxHeight;
      return PageView.builder(
          onPageChanged: (val) {
            controller.onPageChange(val);
          },
          //physics: ScrollPhysics(),
          itemCount: onBoardingList.length,
          itemBuilder: (context, index) => Column(
                children: [
                  // Image.asset(
                  //   onBoardingList[index].image,
                  //   width: 300,
                  //   height: 250,
                  //   fit: BoxFit.cover,
                  // ),
                  Container(
                    width: double.infinity,
                    height: localHieght * 0.7,
                    color: Colors.orange,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(onBoardingList[index].title,
                      style: Theme.of(context).textTheme.headline1),
                  const SizedBox(
                    height: 10,
                  ),
                  Expanded(
                    child: Text(
                      onBoardingList[index].body,
                      style: Theme.of(context).textTheme.bodyText1,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ));
    });
  }
}
