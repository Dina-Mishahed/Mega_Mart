import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../controller/auth/signup_controller.dart';
import '../../../core/constants/image_assets.dart';
import '../../../core/functions/valid_input.dart';
import '../../widgets/auth/Custon_sign_with_phonr_email.dart';
import '../../widgets/auth/custom_const_text.dart';
import '../../widgets/auth/custom_textfield.dart';
import '../../widgets/auth/custon_checked_box.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/custom_text_button.dart';

class SignupPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SignUpControllerImp controller = Get.put(SignUpControllerImp());
    double screenWidth =
        MediaQuery.of(context).size.width - MediaQuery.of(context).padding.top;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(vertical: screenWidth * 0.1),
                child: Row(
                  children: [
                    IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.arrow_back_rounded,
                          color: Colors.black,
                        )),
                    Text(
                      "Sign up",
                      style: Theme.of(context).textTheme.headline1,
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.08),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Form(
                        key: controller.formstate,
                        child: Column(
                          children: [
                            CustomConstText(text: "Userame"),
                            CustomTextField(
                                onSaveFunc: (val) {
                                  controller.userName = val!;
                                },
                                hintText: "Enter your username",
                                valid: (val) => validInput(val!, "username"),
                                type: TextInputType.name),
                            const SizedBox(
                              height: 14,
                            ),
                            CustomConstText(text: "Email"),
                            CustomTextField(
                                onSaveFunc: (val) {
                                  controller.email = val!;
                                },
                                hintText: "Enter Your Email",
                                valid: (val) => validInput(val!, "email"),
                                type: TextInputType.emailAddress),
                            const SizedBox(
                              height: 14,
                            ),
                            CustomConstText(text: "Phone Number"),
                            CustomTextField(
                                onSaveFunc: (val) {
                                  controller.phone = val!;
                                },
                                hintText: "Enter Your Phone Number",
                                valid: (val) => validInput(val!, "phone"),
                                type: TextInputType.phone),
                            const SizedBox(
                              height: 14,
                            ),
                            CustomConstText(text: "Password"),
                            GetBuilder<SignUpControllerImp>(
                                builder: (controller) {
                              return CustomTextField(
                                  onSaveFunc: (val) {
                                    controller.password = val!;
                                  },
                                  hintText: "* * * * * *",
                                  onTapIcon: () {
                                    controller.showPassword();
                                  },
                                  isSecure: controller.isshowpassword,
                                  valid: (val) => validInput(val!, "password"),
                                  type: TextInputType.visiblePassword);
                            }),
                            const SizedBox(
                              height: 14,
                            ),
                            const SizedBox(
                              height: 34,
                            ),
                            Row(
                              children: [
                                CustomCheckBox(
                                  text: "  I agree to ",
                                  onChandeFun: (value) {},
                                ),
                                GetBuilder<SignUpControllerImp>(
                                    builder: (controller) {
                                  return CustomTextButton(
                                      text: "Terms and conditions".tr,
                                      funcOnTap: () => controller.terms());
                                })
                              ],
                            ),
                            const SizedBox(
                              height: 22,
                            ),
                            CustomButton(
                              btnText: 'Sign up',
                              btnFunction: () => controller.signup(),
                            ),
                            const SizedBox(
                              height: 29,
                            ),
                          ],
                        ),
                      ),
                      const Text("Or you can sign Up with"),
                      const SizedBox(
                        height: 18,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomSignWithPhoneOrEmail(
                              text: " Phone Number",
                              icon: ImageAssets.phoneIcon,
                              onPressFun: () {}),
                          //Spacer(),
                          CustomSignWithPhoneOrEmail(
                              text: " Google account",
                              icon: ImageAssets.googleIcon,
                              onPressFun: () {})
                        ],
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text("Have an account?"),
                            GetBuilder<SignUpControllerImp>(
                                builder: (controller) {
                              return CustomTextButton(
                                text: " Sign In".tr,
                                funcOnTap: () => controller.signin(),
                              );
                            })
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
