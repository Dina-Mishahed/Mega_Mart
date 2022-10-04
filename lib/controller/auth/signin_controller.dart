import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:mega_market/core/constants/routes.dart';

abstract class SignInController extends GetxController {
  signup();
  forgetPassword();
  Home();
  login();
}

class SignInControllerImp extends SignInController {
  GlobalKey<FormState> formstate = GlobalKey<FormState>();
  final GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ['email']);
  final FirebaseAuth _auth = FirebaseAuth.instance;
  late String emailController, passwordControler;
  bool isshowpassword = true;
  late  Rx<User?> _user ;

  showPassword() {
    isshowpassword = !isshowpassword;
    update();
  }

  @override
  signup() {
    Get.offAllNamed(AppRoute.signup);
  }

  @override
  forgetPassword() {
    Get.offAllNamed(AppRoute.resetPasswordWithEmail);
  }

  @override
  void onInit() {
    super.onInit();
  }

  @override
  Home() {
    print("signin to home");
    Get.offAllNamed(AppRoute.home);
  }

  @override
  login() async {
    var formdata = formstate.currentState;
    if (formdata!.validate()) {
      formstate.currentState!.save();
      print("valid email = ${emailController}");
      try {
        await _auth
            .signInWithEmailAndPassword(
                email: emailController, password: passwordControler)
            .then((user) async {
          //saveUser(user);
        });
        Get.offAllNamed(AppRoute.home);
      } catch (e) {
        print(e.toString());
        Get.snackbar(
          'Error login account',
          e.toString(),
          colorText: Colors.black,
          snackPosition: SnackPosition.BOTTOM,
        );
      }
    } else {
      print("Not  valid");
    }
  }

  void googleSignInMethod() async {
    final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
    GoogleSignInAuthentication? googleSignInAuthantication =
        await googleUser?.authentication;
    final AuthCredential credential = GoogleAuthProvider.credential(
      idToken: googleSignInAuthantication?.idToken,
      accessToken: googleSignInAuthantication?.accessToken,
    );
    await _auth.signInWithCredential(credential);
    //.then((user){saveUser(user);});
    Get.offAll(() => AppRoute.home);
  }

//
// void signInWithEmailAndPassword() async {
//   try {
//     await _auth.signInWithEmailAndPassword(email: email, password: password).then((user)async{
//       saveUser(user);
//     });
//     Get.offAll(() => HomeView());
//   } catch (e) {
//     print(e.toString());
//     Get.snackbar(
//       'Error login account',
//       e.toString(),
//       colorText: Colors.black,
//       snackPosition: SnackPosition.BOTTOM,
//     );
//   }
// }
//
// Future<void> createAccountWithEmailAndPass() async {
//   try {
//     await _auth
//         .createUserWithEmailAndPassword(email: email, password: password)
//         .then((user) async{
//       saveUser(user);
//     });
//
//     Get.offAll(() => HomeView());
//   } on FirebaseAuthException catch (e) {
//     print(e.message);
//     Get.snackbar('Error login account', e.message.toString(),
//         colorText: Colors.black, snackPosition: SnackPosition.BOTTOM);
//   }
// }
// void saveUser(UserCredential user) async{
//   if(name == ""){
//     await FirestroreUser().addUserToFireStore(UserModel(
//       user.user!.uid,
//       user.user!.email.toString(),
//       user.user!.displayName.toString(),
//       '',
//     ));
//   }
//   else{
//     await FirestroreUser().addUserToFireStore(UserModel(
//       user.user!.uid,
//       user.user!.email.toString(),
//       name,
//       '',
//     ));
//   }
//
//
// }

}
