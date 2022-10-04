import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TermsAndConditions extends StatelessWidget {
  String text ="conditions".tr;

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
                    "Terms and conditions".tr,
                    style: Theme.of(context).textTheme.headline1,
                  ),
                ],
              ),
            ),
            SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.08),
                //alignment: Alignment.center,
                child: Text(text,style: TextStyle(
                  height: 1.5,
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),),
              ),
            )
          ])),
    );
  }
}
