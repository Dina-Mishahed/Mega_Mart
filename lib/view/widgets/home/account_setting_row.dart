import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../core/constants/color.dart';
import '../../../core/constants/icon_assets.dart';

class AccountSettingRow extends StatelessWidget {
  final String text, icon;
  final Color textColor;

  AccountSettingRow(
      {required this.text,
      required this.icon,
      this.textColor = AppColor.primaryColor});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16.0, bottom: 21),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SvgPicture.asset(icon),
              const SizedBox(
                width: 32,
              ),
              Text(
                text,
                style: TextStyle(
                  color: textColor,
                ),
              ),
            ],
          ),
          SvgPicture.asset(IconAssets.nextArrow),
        ],
      ),
    );
  }
}
