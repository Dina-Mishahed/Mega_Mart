import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:mega_market/core/constants/color.dart';
import 'package:mega_market/core/constants/icon_assets.dart';
import 'package:mega_market/core/constants/routes.dart';
import 'package:mega_market/view/widgets/auth/custom_const_text.dart';

import '../../../controller/category_controller.dart';
import '../../../data/models/Category_Model.dart';
import '../../widgets/home/Category_Item.dart';

class CategoryScreen extends StatelessWidget {
  final List<String> names = <String>[
    'Sportwear',
    'Casual',
    'Shoes',
    'Homewear',
    'Underwear',
  ];
 /* List<CategoryModel> choices = const <CategoryModel>[
    const CategoryModel(title: 'ELETRICITY',image: 'assets/images/google.png' ),
    const CategoryModel(title: 'MOBILE', image: 'assets/images/google.png'),
    const CategoryModel(title: 'ELETRICITY',image: 'assets/images/google.png' ),
    const CategoryModel(title: 'MOBILE', image: 'assets/images/google.png'),
    const CategoryModel(title: 'ELETRICITY',image: 'assets/images/google.png' ),
    const CategoryModel(title: 'MOBILE', image: 'assets/images/google.png'),
    const CategoryModel(title: 'ELETRICITY',image: 'assets/images/google.png' ),
    const CategoryModel(title: 'MOBILE', image: 'assets/images/google.png'),
    const CategoryModel(title: 'ELETRICITY',image: 'assets/images/google.png' ),
    const CategoryModel(title: 'MOBILE', image: 'assets/images/google.png'),
  ];*///Category_Model.dart
  @override
  Widget build(BuildContext context) {
    double screenWidth =
        MediaQuery.of(context).size.width - MediaQuery.of(context).padding.top;

    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        padding: EdgeInsets.only(
      top: 55,
      left: screenWidth * 0.08,
      right: screenWidth * 0.08,
        ),
        child: Column(children: [
      Row(
        children: [
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.arrow_back_rounded,
                color: Colors.black,
              )),
          Text(
            "Catalouge",
            style: Theme.of(context).textTheme.headline1,
          ),
        ],
      ),
      _searchTextFormField(),
      SizedBox(
        height: 15,
      ),
      //_listViewCategory(),
      // SizedBox(
      //   height: 16,
      // ),
      _listViewFilterItem(),
       Divider(
         height: 5,
         color: AppColor.grey2,
       ),
      Expanded(child: _listViewProduct()),
        ]),
      ),
    ));
  }

  Widget _searchTextFormField() => Row(
        children: [
          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              color: AppColor.grey2,
            ),
            child: Center(
              child: SvgPicture.asset(
                IconAssets.filterIcon,
              ),
            ),
          ),
          const SizedBox(
            width: 1,
          ),
          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              color: AppColor.grey2,
            ),
            child: Center(
              child: SvgPicture.asset(
                IconAssets.sortIcon,
              ),
            ),
          ),
          const SizedBox(
            width: 1,
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: AppColor.grey2,
              ),
              child: TextFormField(
                decoration: InputDecoration(
                  border: InputBorder.none,
                  suffixIcon: Container(
                    padding: const EdgeInsets.all(14.0),
                    child: SvgPicture.asset(
                      IconAssets.searchIcon,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      );

  Widget _listViewCategory() => Container(
        height: 70,
        child: ListView.builder(
          itemCount: names.length,
          itemBuilder: (context, index) {
            return Column(
              children: [
                Container(
                  width: 80,
                  decoration: BoxDecoration(
                    //borderRadius: BorderRadius.circular(50),
                    color: Colors.white,
                  ),
                  child: Center(child: SvgPicture.asset(IconAssets.filterIcon)),
                ),
                const SizedBox(
                  height: 16,
                ),
                Text(
                  names[index],
                ),
              ],
            );
          },
          scrollDirection: Axis.horizontal,
        ),
      );

  Widget _listViewFilterItem() => Container(
        height: 45,
        child: ListView.separated(
          itemCount: names.length,
          itemBuilder: (context, index) {
            return Container(
              padding:
                  EdgeInsets.only(bottom: 12, top: 14, left: 16, right: 21),
              decoration: BoxDecoration(
                border: Border.all(color: AppColor.primaryColor),
                //borderRadius: BorderRadius.circular(50),
                //color: Colors.white,
              ),
              child: Row(
                children: [
                  Text(names[index]),
                  SizedBox(
                    width: 17,
                  ),
                  SvgPicture.asset(IconAssets.rateIcon),
                ],
              ),
            );
          },
          scrollDirection: Axis.horizontal,
          separatorBuilder: (BuildContext context, int index) {
            return SizedBox(
              width: 17,
            );
          },
        ),
      );

  Widget _listViewProduct() => GetBuilder<CategoryController>(
    builder: (controller) =>
      controller.loading.value ?  CircularProgressIndicator():
       GridView(
        children: List.generate(
            controller.categoryModel.length, (index) {
          return Container(
            child: CategoryItem(controller.categoryModel[index]),
          );
        }),
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
          mainAxisExtent: 270,
        ),
      )

  );
  
}