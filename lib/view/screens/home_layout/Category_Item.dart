import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mega_market/core/constants/color.dart';
import 'package:mega_market/core/constants/icon_assets.dart';

import '../../../core/constants/image_assets.dart';
import '../../../data/models/Category_Model.dart';

class CategoryItem extends StatelessWidget {
  late final CategoryModel categorymodel;

  CategoryItem(this.categorymodel);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            decoration: BoxDecoration(
              color: AppColor.grey2,
              borderRadius: BorderRadius.circular(16.0),
            ),
            height: 172,
            width: double.infinity,
            child: Stack(
              children: [
                Image.asset(
                  ImageAssets.shoes,
                  width: double.infinity,
                  height: 172,
                  alignment: Alignment.center,
                ),
              ],
            ),
          ),
          SizedBox(
            height: 10.0,
          ),
          Text(
            'Mega Shoes black\& white',
            style: TextStyle(
              fontWeight: FontWeight.w500,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Text('EGP '),
                  Text('150'),
                ],
              ),
              Row(
                children: [
                  Text('(15) '),
                  SvgPicture.asset(IconAssets.starIcon),
                ],
              )
              //SvgPicture(IconAssets.starIcon),
            ],
          ),
          Row(
            children: [
              Text('EGP '),
              Text('350 '),
              Text('99\% OFF'),
            ],
          ),
        ],
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.0),
      ),
    );
  }
}
