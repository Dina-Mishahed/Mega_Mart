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
      resetPassword(email: email);
      Get.toNamed(AppRoute.signin);
    } else {
      print("Not valid");
    }
    //Get.offAllNamed(AppRoute.optVerificationCodeEmail);
  }

  Future resetPassword({required String email}) async {
    try {
      await _auth.sendPasswordResetEmail(email: email!);
      Get.snackbar("Message",'Password reset email is sent');
    } catch (e) {
      Get.snackbar("Message",'Error resetting');
    }
    // await _auth
    //     .sendPasswordResetEmail(email: email)
    //     .then((value) => _status = AuthStatus.successful)
    //     .catchError(
    //         (e) => _status = AuthExceptionHandler.handleAuthException(e));
    // return _status;
  }
}

//
// Future _resetPassword() async {
//   String? email;
//   await showDialog(
//     context: context,
//     builder: (context) {
//       return AlertDialog(
//         actions: [
//           TextButton(
//             onPressed: () {
//               Navigator.of(context).pop();
//             },
//             child: const Text('Send'),
//           ),
//         ],
//         content: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             const Text('Enter your email'),
//             const SizedBox(height: 20),
//             TextFormField(
//               onChanged: (value) {
//                 email = value;
//               },
//             ),
//           ],
//         ),
//       );
//     },
//   );
//
//   if (email != null) {
//     try {
//       await _auth.sendPasswordResetEmail(email: email!);
//       ScaffoldSnackbar.of(context).show('Password reset email is sent');
//     } catch (e) {
//       ScaffoldSnackbar.of(context).show('Error resetting');
//     }
//   }
// }
