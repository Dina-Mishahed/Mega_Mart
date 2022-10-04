import 'package:flutter/cupertino.dart';
import 'package:mega_market/core/constants/color.dart';

class CustomTextButton extends StatelessWidget {
  final String text;
  final VoidCallback funcOnTap;

  CustomTextButton({required this.text, required this.funcOnTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: funcOnTap,
        child: Text(
          text,
          style: TextStyle(
            color: AppColor.blue,
            fontSize: 15,
            fontWeight: FontWeight.w400,
          ),
        ));
  }
}
