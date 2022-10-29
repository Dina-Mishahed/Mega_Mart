import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/auth/signin_controller.dart';
import '../../../core/constants/image_assets.dart';
import '../../../core/functions/valid_input.dart';
import '../../widgets/auth/Custon_sign_with_phonr_email.dart';
import '../../widgets/auth/custom_const_text.dart';
import '../../widgets/auth/custom_textfield.dart';
import '../../widgets/auth/custon_checked_box.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/custom_text_button.dart';

class SigninPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SignInControllerImp controller = Get.put(SignInControllerImp());
    double screenWidth =
        MediaQuery.of(context).size.width - MediaQuery.of(context).padding.top;
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.08),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Spacer(),
                Text(
                  "Sign in".tr,
                  style: Theme.of(context).textTheme.headline1,
                ),
                SizedBox(
                  height: 23.6,
                ),
                Form(
                  key: controller.formstate,
                  child: Column(
                    children: [
                      CustomConstText(text: "Email".tr),
                      CustomTextField(
                        hintText: "Enter your mail".tr,
                        valid: (val) => validInput(val!, "email"),
                        type: TextInputType.emailAddress,
                        onSaveFunc: (val) {
                          controller.emailController = val.toString();
                        },
                      ),
                      SizedBox(
                        height: 14,
                      ),
                      CustomConstText(text: "Password".tr),
                      GetBuilder<SignInControllerImp>(
                        builder: (controller) {
                          return CustomTextField(
                              onSaveFunc: (val) {
                                controller.passwordControler = val.toString();
                              },
                              hintText: "* * * * * *",
                              onTapIcon: () {
                                controller.showPassword();
                              },
                              isSecure: controller.isshowpassword,
                              valid: (val) {},//=> validInput(val!, "password"),
                              type: TextInputType.visiblePassword);
                        }
                      ),
                      SizedBox(
                        height: 34,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GetBuilder<SignInControllerImp>(
                            builder: (controller) {
                              return CustomCheckBox(
                                text: "  Remember me".tr,
                                onChandeFun: (value) {
                                  controller.remember();
                                },
                                value: controller.rememberMe,
                              );
                            }
                          ),
                          CustomTextButton(
                              text: "Forget password?".tr,
                              funcOnTap: () => controller.forgetPassword()),
                        ],
                      ),
                      const SizedBox(
                        height: 22,
                      ),
                      CustomButton(
                        btnText: 'Sign in'.tr,
                        btnFunction: () {
                          controller.login();
                        },
                      ),
                      SizedBox(
                        height: 29,
                      ),
                    ],
                  ),
                ),
                Text("Or Sign in with".tr),
                SizedBox(
                  height: 18,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomSignWithPhoneOrEmail(
                        text: " Phone Number".tr,
                        icon: ImageAssets.phoneIcon,
                        onPressFun: () => controller.googleSignInMethod()),
                    //Spacer(),
                    CustomSignWithPhoneOrEmail(
                        text: " Google account".tr,
                        icon: ImageAssets.googleIcon,
                        onPressFun: () => controller.googleSignInMethod())
                  ],
                ),
                Spacer(),
                Container(
                  margin: EdgeInsets.only(bottom: screenWidth * 0.08),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Don’t have an account?".tr),
                      CustomTextButton(
                        text: " Sign Up".tr,
                        funcOnTap: () => controller.signup(),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
