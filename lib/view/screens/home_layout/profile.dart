import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../core/constants/color.dart';
import '../../../core/constants/icon_assets.dart';
import '../../widgets/home/account_setting_row.dart';
import '../../widgets/home/circle_avatar.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double screenWidth =
        MediaQuery.of(context).size.width - MediaQuery.of(context).padding.top;
    return SafeArea(
      child: Scaffold(
          backgroundColor: Colors.white,
          body: SingleChildScrollView(
            child: Column(children: [
              Padding(
                padding: EdgeInsets.symmetric(
                  vertical: screenWidth * 0.1,
                ),
                child: Row(
                  children: [
                    IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.arrow_back_rounded,
                          color: Colors.black,
                        )),
                    Text(
                      "Account",
                      style: Theme.of(context).textTheme.headline1,
                    ),
                  ],
                ),
              ),
              Container(
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      color: AppColor.pink,
                      padding:
                          EdgeInsets.symmetric(horizontal: 37, vertical: 8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            color: AppColor.pink,
                            child: Text(
                              "Jane Doe",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.w500),
                            ),
                          ),
                          Text(
                            "janedeo@gmail.com",
                            style: TextStyle(fontSize: 12),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                CircleAvatarWidget(
                                  text: "Orders",
                                  icon: IconAssets.orderIcon,
                                  backgroundColor: AppColor.primaryColor,
                                ),
                                const SizedBox(
                                  width: 44,
                                ),
                                CircleAvatarWidget(
                                  text: "Wallet",
                                  icon: IconAssets.currencyIcon,
                                  backgroundColor: AppColor.primaryColor,
                                ),
                                const SizedBox(
                                  width: 44,
                                ),
                                CircleAvatarWidget(
                                  text: "Chatbot",
                                  icon: IconAssets.chatIcon,
                                  backgroundColor: AppColor.yellow,
                                ),
                              ]),
                          SizedBox(
                            height: 15,
                          ),
                        ],
                      ),
                    ),
                    AccountSettingRow(
                      icon: IconAssets.profileSetting,
                      text: "Profile",
                    ),
                    AccountSettingRow(
                      icon: IconAssets.paymentIcon,
                      text: "Payment",
                    ),
                    AccountSettingRow(
                      icon: IconAssets.loveWishlist,
                      text: "Wishlist",
                    ),
                    AccountSettingRow(
                      icon: IconAssets.shippingIcon,
                      text: "Shipping Address",
                    ),
                    Container(
                      color: Colors.white,
                      margin: EdgeInsets.only(top: 14, bottom: 15, left: 60),
                      child: Text(
                        "Setting",
                        style: TextStyle(fontSize: 14),
                      ),
                    ),
                    AccountSettingRow(
                      icon: IconAssets.language,
                      text: "Language",
                    ),
                    Container(
                      color: Colors.white,
                      margin: EdgeInsets.only(top: 14, bottom: 15, left: 60),
                      child: Text(
                        "Share and Rate ",
                        style: TextStyle(fontSize: 14),
                      ),
                    ),
                    AccountSettingRow(
                      icon: IconAssets.rateIcon,
                      text: "Rate Our App",
                    ),
                    Container(
                      width: double.infinity,
                      margin: EdgeInsets.only(top: 14, bottom: 15, left: 60),
                      child: Text(
                        "Privacy",
                        textAlign: TextAlign.left,
                        style: TextStyle(fontSize: 14),
                      ),
                    ),
                    AccountSettingRow(
                      icon: IconAssets.privacyPolicy,
                      text: "Privacy Policy",
                    ),
                    AccountSettingRow(
                      icon: IconAssets.frequentlyAskedQuestions,
                      text: "Frequently Asked Questions",
                    ),
                    AccountSettingRow(
                      icon: IconAssets.rateIcon,
                      text: "Terms and Conditions",
                    ),
                    AccountSettingRow(
                      icon: IconAssets.signoutIcon,
                      text: "Sign Out",
                      textColor: AppColor.grey4,
                    ),
                  ],
                ),
              )
            ]),
          )),
    );
  }
}
