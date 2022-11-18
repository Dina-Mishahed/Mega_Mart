import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:mega_market/controller/network_controller.dart';
import 'package:mega_market/core/constants/routes.dart';

import '../../no_internet/no_internet_view.dart';

class HomeScreen extends StatelessWidget {
  final NetworkingControllerImp _networkmanager = Get.find<NetworkingControllerImp>();
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Center(
        child: GetBuilder<NetworkingControllerImp>(
          builder: (builder) {
            return _networkmanager.connectionStatues == 0 ? NoInternet() : Text("home page");
          }
        ),
      ),
    );
  }
}
