import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:mega_market/core/constants/routes.dart';
import '../services/services.dart';

class MyMiddleWare extends GetMiddleware {
  @override
  int? get priority => 1;
  MyServices myServices = Get.find();

  @override
  RouteSettings? redirect(String? route) {
    String? onboardingKey =
        myServices.sharedPreferences.getString("onboarding");
    if (onboardingKey == "1") {
      return const RouteSettings(name: AppRoute.signin);
    }
  }
}
