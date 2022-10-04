import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mega_market/core/constants/routes.dart';
import 'package:mega_market/data/models/user_model.dart';

import '../../core/services/firestore_user.dart';

abstract class SignUpController extends GetxController {
  signin();

  terms();

  home();

  signup();
}

class SignUpControllerImp extends SignUpController {
  GlobalKey<FormState> formstate = GlobalKey<FormState>();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  bool isshowpassword = true;
  late String userName, email, phone, password;

  showPassword() {
    isshowpassword = !isshowpassword;
    update();
  }

  @override
  signin() {
    Get.offAllNamed(AppRoute.signin);
  }

  @override
  terms() {
    Get.offAllNamed(AppRoute.terms);
  }

  @override
  void onInit() {
    super.onInit();
  }

  @override
  home() {
    print("signin to home");
    Get.offAllNamed(AppRoute.home);
  }

  @override
  signup() async {
    var formdata = formstate.currentState;
    if (formdata!.validate()) {
      formstate.currentState!.save();
      print("valid");
      try {
        await _auth
            .createUserWithEmailAndPassword(email: email, password: password)
            .then((user) async {
          saveUser(user);
        });

        Get.offAllNamed(AppRoute.home);
      } on FirebaseAuthException catch (e) {
        print(e.message);
        Get.snackbar('Error login account', e.message.toString(),
            colorText: Colors.black, snackPosition: SnackPosition.BOTTOM);
      }
    } else {
      print("Not  valid");
    }
  }

  void saveUser(UserCredential user) async {
    if (userName == "") {
      await FirestroreUser().addUserToFireStore(UserModel(
        user.user!.uid,
        user.user!.email.toString(),
        user.user!.displayName.toString(),
        "",
      ));
    } else {
      await FirestroreUser().addUserToFireStore(UserModel(
        user.user!.uid,
        user.user!.email.toString(),
        userName,
        phone,
      ));
    }
  }
}
