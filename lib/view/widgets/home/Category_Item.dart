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
          Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: AppColor.grey2 ,
                  borderRadius: BorderRadius.circular(16.0),
                ),
                height: 172,
                width: 90,
              ),
              Positioned(
                left: 130,
                top: 10,
                child: SvgPicture.asset(IconAssets.loveWishlist),),
              Image.network(
                categorymodel.image.toString(),
                width: double.infinity,
                height: 172,
                alignment: Alignment.center,
              ),

            ],
          ),
          SizedBox(
            height: 8.0,
          ),
          Text(
            categorymodel.title.toString(),
            style: TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 15
            ),
          ),
          SizedBox(
            height: 8.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Text(
                    'EGP ',
                    style: TextStyle(
                      fontSize: 14,
                      color: AppColor.grey4,
                    ),
                  ),
                  Text('150'),
                ],
              ),
              SizedBox(
                height: 8.0,
              ),
              Row(
                children: [
                  Text('(15) ',
                    style: TextStyle(
                      fontSize: 14,
                      color: AppColor.grey4,
                    ),),
                  SvgPicture.asset(IconAssets.starIcon),
                ],
              )
              //SvgPicture(IconAssets.starIcon),
            ],
          ),
          SizedBox(
            height: 10.0,
          ),
          Row(
            children: [
              Text(
                'EGP ',
                style: TextStyle(
                  fontSize: 10,
                  color: AppColor.grey4,
                ),
              ),
              Text(
                '350 ',
                style: TextStyle(
                  fontSize: 14,
                  decoration: TextDecoration.lineThrough,
                ),
              ),
              Text(
                '99\% OFF',
                style: TextStyle(
                  color: AppColor.primaryColor,
                ),
              ),
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
