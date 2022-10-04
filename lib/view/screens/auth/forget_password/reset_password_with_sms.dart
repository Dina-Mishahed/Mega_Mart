import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mega_market/controller/auth/forget_password_byphone_controller.dart';
import 'package:mega_market/core/functions/valid_input.dart';

import '../../../widgets/auth/custom_const_text.dart';
import '../../../widgets/auth/custom_textfield.dart';
import '../../../widgets/custom_button.dart';
import '../../../widgets/custom_text_button.dart';

class ResetPasswordWithPhone extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double screenWidth =
        MediaQuery.of(context).size.width - MediaQuery.of(context).padding.top;
    ForgetPasswordByEmailControllerImp controller =
        Get.put(ForgetPasswordByEmailControllerImp());
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
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
                    "Forget password",
                    style: Theme.of(context).textTheme.headline1,
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.08),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Form(
                        key: controller.formstate,
                        child: Column(
                          children: [
                            Text("Forget password?",
                                style: Theme.of(context).textTheme.headline1),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              "Enter your phone number and we'll send you a verification code to reset your password",
                              style: Theme.of(context).textTheme.bodyText1,
                              textAlign: TextAlign.center,
                            ),
                            const SizedBox(
                              height: 44,
                            ),
                            CustomConstText(text: "Your Phone number is  * "),
                            CustomTextField(
                                hintText: "Enter your phone number",
                                type: TextInputType.phone,
                                valid: (val) => validInput(val!, "phone")),
                            SizedBox(
                              height: 70,
                            ),
                            CustomButton(
                              btnText: 'Reset Password',
                              btnFunction: () => controller.otpVerification(),
                            ),
                            SizedBox(
                              height: 35,
                            ),
                          ],
                        ),
                      ),
                      const Text("forget your phone number?"),
                      const SizedBox(
                        height: 8,
                      ),
                      CustomTextButton(
                        text: " Send code by SMS",
                        funcOnTap: () {},
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
