import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' ;
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
  late String? phone;
  late String firstName, lastName, email, password;
  late bool isEmailVerified;
  final Rxn<int> selected = Rxn<int>();
  var checkvalue = false;



  showPassword() {
    isshowpassword = !isshowpassword;
    update();
  }
  checkTrems() {
    checkvalue = !checkvalue;
    update();
  }
  @override
  signin() {
    Get.offAllNamed(AppRoute.signin);
  }
  pop() {
    Get.offNamed(AppRoute.signin);
  }
  @override
  terms() {
    Get.toNamed(AppRoute.terms);
  }

  @override
  void onInit() {
    super.onInit();
  }

  @override
  home() {
    //print("signin to home");
    Get.offAllNamed(AppRoute.home);
  }
  @override
  signup() async {
    var formdata = formstate.currentState;
    if (formdata!.validate() && checkvalue) {
      formstate.currentState!.save();
      try {
         await _auth
            .createUserWithEmailAndPassword(email: email, password: password)
            .then((user) async {
           sendverificationEmail();
          //print("user ==> $user");
          saveUser(user);
        });
        // print("$user");
        // await user.user.sendEmailVerification();
        Get.offAllNamed(AppRoute.home);
      } on FirebaseAuthException catch (e) {
        print(e.message);
        // Get.snackbar('Error Message', e.message.toString(),
        //     colorText: Colors.black, snackPosition: SnackPosition.BOTTOM);
        Get.defaultDialog(
          title: "Error Message",
          middleText: "The email address is already in use by another account.",
          textCancel: "ok",
        );
      }
    } else {
      print("Not  valid");
    }
  }

  void saveUser(UserCredential user) async {
    isEmailVerified = FirebaseAuth.instance.currentUser!.emailVerified;
    await FirestroreUser().addUserToFireStore(UserModel(
      user.user!.uid,
      user.user!.email.toString(),
      firstName,
      lastName,
      phone.toString(),
      "",
      isEmailVerified,
    ));
    print(" ==> $isEmailVerified");
    if (!isEmailVerified) {
      sendverificationEmail();
    }
  }

  Future sendverificationEmail() async {
    try {
      await _auth.currentUser!.sendEmailVerification();
      print("please verify your Email");
    } catch (e) {
      Get.snackbar("Error", e.toString());

    }
  }
//   if (firstName == "") {
//     await FirestroreUser().addUserToFireStore(UserModel(
//       user.user!.uid,
//       user.user!.email.toString(),
//       user.user!.displayName.toString(),
//       user.user!.phoneNumber.toString(),
//       "",
//     ));
//   } else {
//     await FirestroreUser().addUserToFireStore(UserModel(
//       user.user!.uid,
//       user.user!.email.toString(),
//       firstName,
//       lastName,
//       phone.toString(),
//       "",
//     ));
//   }
// }
}
