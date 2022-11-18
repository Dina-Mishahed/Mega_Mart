import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

import '../data/models/Category_Model.dart';

class CategoryController extends GetxController {
  ValueNotifier<bool> get loading => _loading;
  ValueNotifier<bool> _loading = ValueNotifier(false);

  List<CategoryModel> get categoryModel => _categoryModel;
  List<CategoryModel> _categoryModel = [];
  final CollectionReference _categoryCollectionRef =
      FirebaseFirestore.instance.collection('Categories');

  CategoryController() {
    getCategory();
  }

  getCategory() async {
    _loading.value = true;
    await _categoryCollectionRef.get().then((value) {
      for (int i = 0; i < value.docs.length; i++) {
        _categoryModel.add(CategoryModel.fromJson(
            value.docs[i].data() as Map<dynamic, dynamic>));
        print(_categoryModel.length);
        _loading.value = false;
      }
      update();
    });
  }
}
