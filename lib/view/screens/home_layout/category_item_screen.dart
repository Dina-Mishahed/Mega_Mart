import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:mega_market/core/constants/icon_assets.dart';

import '../../../core/constants/color.dart';
import '../../../data/models/Category_Model.dart';
import '../../widgets/home/item_bottom_nav_bar.dart';

class ItemScreen extends StatelessWidget {
  CategoryModel model;
  final List<String> names = <String>[
    'xs',
    'S',
    'M',
    'L',
    'XL',
  ];

  ItemScreen(this.model);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.only(top: 40, left: 25, right: 25),
            child: Column(
              children: [
                Row(
                  children: [
                    InkWell(
                      onTap: () {
                        Get.off(context);
                      },
                      child: Icon(
                        Icons.arrow_back,
                        size: 30,
                        color: Colors.black,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 17,
                        top: 10,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "White Cotton Shirt",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.w400),
                          ),
                          InkWell(
                            onTap: () {
                              //enter code
                            },
                            child: Text(
                              "Mega Seamless",
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                                color: Colors.blueAccent,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Row(
                      children: [
                        Container(
                          padding: EdgeInsets.only(top: 5, left: 18),
                          child: Text(
                            "4.2 ",
                            style: TextStyle(
                              fontSize: 12,
                            ),
                          ),
                        ),
                        SvgPicture.asset(
                          IconAssets.starIcon,
                        ),
                      ],
                    ),
                    Spacer(),
                    Stack(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SvgPicture.asset(
                            IconAssets.cartmartIcon,
                          ),
                        ),
                        Positioned(
                          left: 26,
                          child: Container(
                            width: 13,
                            height: 13,
                            decoration: BoxDecoration(
                              color: Colors.amber,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Center(
                              child: Text(
                                "7",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 13),
                              ),
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                ),
                Stack(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: 300,
                      child: Image.network(
                        model.image,
                        fit: BoxFit.fill,
                      ),
                    ),
                    Positioned(
                      left: 300,
                      top: 10,
                      child: Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                          color: AppColor.primaryColor,
                          border: Border.all(color: AppColor.primaryColor),
                          borderRadius: BorderRadius.circular(20),
                          //color: Colors.white,
                        ),
                        child: Center(
                          child: SvgPicture.asset(
                            IconAssets.love,
                            height: 14,
                            width: 13,
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      left: 300,
                      top: 55,
                      child: Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                          color: AppColor.primaryColor,
                          border: Border.all(color: AppColor.primaryColor),
                          borderRadius: BorderRadius.circular(20),
                          //color: Colors.white,
                        ),
                        child: Center(
                            child: SvgPicture.asset(
                          IconAssets.share,
                          width: 13,
                          height: 14,
                        )),
                      ),
                    ),
                  ],
                ),
                _listViewItemColors(),
                _listViewFilterItem(),
                SizedBox(
                  height: 25,
                ),
                Container(
                  padding: EdgeInsets.only(right: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(
                                "EGP ",
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              Text(
                                "150.00",
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 4,
                          ),
                          Text(
                            "1- 11 piece",
                            style: TextStyle(
                              fontSize: 12,
                              color: AppColor.grey4,
                            ),
                          ),
                          SizedBox(
                            height: 7,
                          ),
                          Row(
                            children: [
                              Text(
                                "EGP 150.00",
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                  fontSize: 12,
                                  color: AppColor.grey4,
                                  decoration: TextDecoration.lineThrough,
                                ),
                              ),
                              Text(
                                " 10% OFF",
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                  fontSize: 14,
                                  color: AppColor.primaryColor,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            "Low Stock: only 7 left",
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: AppColor.yellow,
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            "(Inclusive of VAT)",
                            style: TextStyle(
                              fontSize: 14,
                              color: AppColor.grey4,
                            ),
                          )
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(
                                "EGP",
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              Text(
                                " 140.00",
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 20,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 4,
                          ),
                          Text(
                            "12 piece",
                            textAlign: TextAlign.start,
                            style: TextStyle(
                              fontSize: 12,
                              color: AppColor.grey4,
                            ),
                          ),
                          SizedBox(
                            height: 7,
                          ),
                          Row(
                            children: [
                              Text(
                                "EGP 150.00",
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                  fontSize: 12,
                                  color: AppColor.grey4,
                                  decoration: TextDecoration.lineThrough,
                                ),
                              ),
                              Text(
                                " 10% OFF",
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                  fontSize: 14,
                                  color: AppColor.primaryColor,
                                ),
                              ),
                            ],
                          )
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: ItemBottomNavBar(),
    );
  }

  Widget _listViewFilterItem() => Container(
        height: 32,
        child: ListView.separated(
          itemCount: names.length,
          itemBuilder: (context, index) {
            return Container(
              width: 70,
              decoration: BoxDecoration(
                border: Border.all(color: AppColor.primaryColor),
                borderRadius: BorderRadius.circular(8),
                //color: Colors.white,
              ),
              child: Center(child: Text(names[index])),
            );
          },
          scrollDirection: Axis.horizontal,
          separatorBuilder: (BuildContext context, int index) {
            return SizedBox(
              width: 14,
            );
          },
        ),
      );

  Widget _listViewItemColors() => Container(
        height: 32,
        alignment: Alignment.center,
        child: ListView.separated(
          itemCount: names.length,
          itemBuilder: (context, index) {
            return Container(
              width: 32,
              decoration: BoxDecoration(
                color: Colors.cyanAccent,
                border: Border.all(color: AppColor.primaryColor),
                borderRadius: BorderRadius.circular(16),
                //color: Colors.white,
              ),
              //child:Container(color: Colors.amber,),
            );
          },
          scrollDirection: Axis.horizontal,
          separatorBuilder: (BuildContext context, int index) {
            return SizedBox(
              width: 14,
            );
          },
        ),
      );
}
