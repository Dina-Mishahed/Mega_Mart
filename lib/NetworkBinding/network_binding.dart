import 'package:get/get.dart';
import 'package:mega_market/controller/category_controller.dart';
import 'package:mega_market/controller/network_controller.dart';

class NetworkBinding extends Bindings{
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut<NetworkingControllerImp>(() => NetworkingControllerImp());
    Get.lazyPut<CategoryController>(() => CategoryController());
  }

}