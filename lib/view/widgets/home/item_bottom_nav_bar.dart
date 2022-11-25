import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mega_market/core/constants/color.dart';
import 'package:mega_market/core/constants/icon_assets.dart';

import '../custom_button.dart';

class ItemBottomNavBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
        child: Container(
      height: 70,
      padding: EdgeInsets.symmetric(horizontal: 20),
      // decoration: ,
      child: Row(
        children: [
          Container(
            height: 32,
            width: 32,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: AppColor.pink2,
            ),
            child: Center(
              child: SvgPicture.asset(
                IconAssets.sub,
              ),
            ),
          ),
          SizedBox(
            width: 18,
          ),
          Text("1"),
          SizedBox(
            width: 18,
          ),
          Container(
            height: 32,
            width: 32,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: AppColor.pink2,
            ),
            child: Center(
              child: SvgPicture.asset(
                IconAssets.add,
              ),
            ),
          ),
          SizedBox(
            width: 20,
          ),
          Expanded(
            child: Container(
              height: 48,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: AppColor.primaryColor,
              ),
              child: Center(
                child: Text(
                  "Add To Card",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    ));
  }
}
