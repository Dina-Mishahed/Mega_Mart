import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mega_market/core/constants/color.dart';

class CustomButton extends StatelessWidget {
  final String btnText;
  VoidCallback btnFunction;

  CustomButton({required this.btnText, required this.btnFunction});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
          color: AppColor.primaryColor,
          borderRadius: BorderRadius.circular(10)),
      child: MaterialButton(
        onPressed: btnFunction,
        child: Text(
          btnText,
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
