
import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

abstract class NetworkingController extends GetxController {}

class NetworkingControllerImp extends NetworkingController {
  var connectionStatues = 0.obs;
  final Connectivity _connectivity = Connectivity();
  late StreamSubscription<ConnectivityResult> _connectivitySubscription ;

  @override
  void onInit() {
    super.onInit();
    initConnectivity();
    _connectivitySubscription = _connectivity.onConnectivityChanged.listen(_updateConnectionStatus);
  }

  Future<void> initConnectivity() async {
    late ConnectivityResult result;
    try {
      result = await _connectivity.checkConnectivity();
    } on PlatformException catch (e) {
      print("${e.toString()}");
    }
    return _updateConnectionStatus(result);
  }

  _updateConnectionStatus(ConnectivityResult result) {
    switch (result) {
      case ConnectivityResult.wifi:
        connectionStatues.value = 1;
        update();
        break;
      case ConnectivityResult.mobile:
        connectionStatues.value = 2;
        update();
        break;
      case ConnectivityResult.none:
        connectionStatues.value = 0;
        update();
        break;
      default:
        Get.snackbar("Network Error", "Failed to get network connection");
        break;
    }
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }
}
