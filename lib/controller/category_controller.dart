import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

import '../core/services/category_service.dart';
import '../data/models/Category_Model.dart';

class CategoryController extends GetxController {
  ValueNotifier<bool> get loading => _loading;
  ValueNotifier<bool> _loading = ValueNotifier(false);

  List<CategoryModel> get categoryModel => _categoryModel;
  List<CategoryModel> _categoryModel = [];

  CategoryController() {
    getCategory();
  }

  getCategory() async {
    _loading.value = true;
    CategoryService().getCategory().then((value) {
      for (int i = 0; i < value.length; i++) {
        _categoryModel.add(CategoryModel.fromJson(
            value[i].data() as Map<dynamic, dynamic>));
        print(_categoryModel.length);
        _loading.value = false;
      }
      update();
    });
  }
}
