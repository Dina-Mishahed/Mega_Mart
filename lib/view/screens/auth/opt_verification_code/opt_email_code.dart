import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../controller/auth/opt_verificationcode_controller.dart';
import '../../../../core/constants/color.dart';
import '../../../widgets/custom_button.dart';
import '../../../widgets/custom_text_button.dart';
import 'package:pinput/pinput.dart';

class OTPVerificationWithEmail extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double screenWidth =
        MediaQuery.of(context).size.width - MediaQuery.of(context).padding.top;
    Get.put(OPTControllerImp());
    return SafeArea(
      child: Scaffold(
          backgroundColor: Colors.white,
          body: Column(children: [
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
                    "Change Password",
                    style: Theme.of(context).textTheme.headline1,
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.08),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("OTP verification code",
                        style: Theme.of(context).textTheme.headline1),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Enter OTP sent to nadawalid@gmail.com",
                      style: Theme.of(context).textTheme.bodyText1,
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    // PinCodeTextField(
                    //   length: 4,
                    //   onChanged: (val) {},
                    //   appContext: context,
                    //   keyboardType: TextInputType.number,
                    //
                    // ),
                    Pinput(
                      length: 4,
                      mainAxisAlignment: MainAxisAlignment.center,
                      defaultPinTheme: PinTheme(
                          width: 46,
                          height: 48,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(
                                color: AppColor.grey2,
                              ))),
                    ),

                    const SizedBox(
                      height: 80,
                    ),
                    GetBuilder<OPTControllerImp>(builder: (controller) {
                      return CustomButton(
                        btnText: 'Sign in',
                        btnFunction: () => controller.home(),
                      );
                    }),
                    const SizedBox(
                      height: 35,
                    ),
                    const Text("Haven't received code?"),
                    const SizedBox(
                      height: 8,
                    ),
                    CustomTextButton(
                      text: " Resend code",
                      funcOnTap: () {},
                    )
                  ],
                ),
              ),
            )
          ])),
    );
  }
}
