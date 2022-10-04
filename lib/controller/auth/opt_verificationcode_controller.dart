import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:mega_market/core/constants/routes.dart';

abstract class OPTController extends GetxController {

  home();

}

class OPTControllerImp extends OPTController {


  @override
  void onInit() {
    super.onInit();
  }

  @override
  home() {
    print("sign in to home");
    Get.offAllNamed(AppRoute.home);
  }
}
