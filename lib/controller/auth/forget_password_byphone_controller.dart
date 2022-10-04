import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:mega_market/core/constants/routes.dart';

abstract class ForgetPasswordByEmailController extends GetxController {
  otpVerification();
}

class ForgetPasswordByEmailControllerImp
    extends ForgetPasswordByEmailController {
  GlobalKey<FormState> formstate = GlobalKey<FormState>();

  @override
  void onInit() {
    super.onInit();
  }

  @override
  otpVerification() {
    var formdata = formstate.currentState;
    if (formdata!.validate()) {
      print("valid");
      Get.offAllNamed(AppRoute.optVerificationCodeEmail);
    } else {
      print("Not  valid");
    }
  }
}
