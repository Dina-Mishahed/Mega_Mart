import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../widgets/auth/custom_const_text.dart';
import '../../widgets/auth/custom_textfield.dart';
import '../../widgets/custom_button.dart';

class ChangePasswordPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double screenWidth =
        MediaQuery.of(context).size.width - MediaQuery.of(context).padding.top;
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
                child: Center(
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                      Form(
                        child: Column(
                          children: [
                            CustomConstText(text: "Old password"),
                            CustomTextField(
                                hintText: "* * * * * *",
                                valid: (val) {
                                  print("val");
                                },
                                type: TextInputType.visiblePassword,
                                isSecure: true),
                            SizedBox(
                              height: 14,
                            ),
                            CustomConstText(text: "New password"),
                            CustomTextField(
                                hintText: "* * * * * *",
                                valid: (val) {},
                                type: TextInputType.visiblePassword,
                                isSecure: true),
                            SizedBox(height: 80,),
                            CustomButton(
                              btnText: 'Save',
                              btnFunction: () {},
                            ),
                          ],
                        ),
                      ),
                    ])),
              ),
            ),
          ])),
    );
  }
}
