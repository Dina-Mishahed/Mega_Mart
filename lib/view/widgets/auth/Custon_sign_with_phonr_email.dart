import 'package:flutter/material.dart';

import '../../../core/constants/color.dart';
import '../../../core/constants/image_assets.dart';

class CustomSignWithPhoneOrEmail extends StatelessWidget {
  String text;
  String icon;
  void Function()? onPressFun;

  CustomSignWithPhoneOrEmail(
      {required this.text, required this.icon, required this.onPressFun});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width / 2.2;
    return Container(
      alignment: Alignment.center,
      child: TextButton(
        style: TextButton.styleFrom(
            padding:
                const EdgeInsets.only(right: 12, left: 10, bottom: 8, top: 8),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(6),
                side: BorderSide(
                  color: AppColor.grey2,
                  width: 2,
                ))),
        onPressed: onPressFun,
        child: Row(
          children: [
            Image.asset(icon),
            SizedBox(width: 2,),
            Text(
              text,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: AppColor.grey3,
              ),
            )
          ],
        ),
      ),
    );
  }
}
