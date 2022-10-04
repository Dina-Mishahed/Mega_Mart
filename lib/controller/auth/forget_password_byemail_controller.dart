import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:mega_market/core/constants/routes.dart';

abstract class ForgetPasswordController extends GetxController {
  otpVerification();
}

class ForgetPasswordControllerImp extends ForgetPasswordController {
  GlobalKey<FormState> formstate = GlobalKey<FormState>();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  late String email;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  otpVerification() async {
    var formdata = formstate.currentState;
    formstate.currentState!.save();
    if (formdata!.validate()) {
      print("val id");
      await _auth
          .sendPasswordResetEmail(email: email)
          .then((value) {
        print("sucess");
      });
      // .catchError((e) => _status = AuthExceptionHandler.handleAuthException(e));
      Get.offAllNamed(AppRoute.optVerificationCodeEmail);
    } else {
      print("Not valid");
    }
    //Get.offAllNamed(AppRoute.optVerificationCodeEmail);
  }
}
// Future<AuthStatus> resetPassword({required String email}) async {
//   await _auth
//       .sendPasswordResetEmail(email: email)
//       .then((value) => _status = AuthStatus.successful)
//       .catchError((e) => _status = AuthExceptionHandler.handleAuthException(e));
//   return _status;
// }