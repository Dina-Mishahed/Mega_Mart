
import 'package:flutter/material.dart';
import 'package:mega_market/core/constants/color.dart';

import '../../core/constants/image_assets.dart';
import '../widgets/onboarding/explore_button.dart';

class NoInternet extends StatelessWidget {

  @override

  Widget build(BuildContext context) {
    double screenWidth =
        MediaQuery
            .of(context)
            .size
            .width - MediaQuery
            .of(context)
            .padding
            .top;
    return Padding(
      padding: EdgeInsets.only(top: screenWidth * 0.5,left: 35,right: 35),

      child: Column(
        children: [
          Image.asset(ImageAssets.noInternet,),
          SizedBox(height: 10,),
          Text("No Internet Connection",style: TextStyle(
            fontSize: 26,
            color: AppColor.grey3,
          ),),
          Text("Please check your internet connection to continue Shopping ",style: TextStyle(
            fontSize: 16,
            color: AppColor.grey1,
          ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 40,),
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(width: 1, color: AppColor.primaryColor)),
            child: MaterialButton(
              onPressed: () {
                //controller.Home();
              },
              child: Text(
                "Refresh",
                style: TextStyle(
                  color: AppColor.primaryColor,
                  fontSize: 16,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

}

