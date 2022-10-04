import 'package:get/get.dart';
import 'package:mega_market/core/constants/routes.dart';
import 'package:mega_market/core/services/services.dart';

abstract class OnboardingController extends GetxController {
  signup();

  signin();

  Home();

  onPageChange(int index);
}

class OnboardingControllerImp extends OnboardingController {
  int currPage = 0;
  MyServices myServices = Get.find();

  @override
  signin() {
    myServices.sharedPreferences.setString("onboarding", "1");
    Get.offAllNamed(AppRoute.signin);
  }

  @override
  onPageChange(int index) {
    currPage = index;
    update();
  }

  @override
  signup() {
    myServices.sharedPreferences.setString("onboarding", "1");
    Get.offAllNamed(AppRoute.signup);
  }

  @override
  void onInit() {
    super.onInit();
  }

  @override
  Home() {
    myServices.sharedPreferences.setString("onboarding", "1");
    Get.offAllNamed(AppRoute.home);
  }
}
