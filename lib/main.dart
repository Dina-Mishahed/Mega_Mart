import 'package:device_preview/device_preview.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mega_market/core/constants/color.dart';
import 'package:mega_market/core/localization/changel_local.dart';
import 'package:mega_market/core/services/services.dart';
import 'package:mega_market/routes.dart';
import 'core/constants/routes.dart';
import 'core/localization/translation.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initialServices();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(//MyApp()
      DevicePreview(
        enabled: true,
        tools: [
          ...DevicePreview.defaultTools,
        ],
        builder: (context) => MyApp(),
      ),
      );
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    LocalController controller = Get.put(LocalController());
    return GetMaterialApp(
      translations: MyTranslation(),
      debugShowCheckedModeBanner: false,
      title: 'Mega Market',
      locale: controller.language,
      theme: ThemeData(
          textTheme: const TextTheme(
            bodyText1: TextStyle(
              color: Colors.black,
              fontSize: 16,
              fontWeight: FontWeight.w300,
            ),
            headline1: TextStyle(
              fontSize: 20,
              color: Colors.black,
              fontWeight: FontWeight.w300,
            ),
          ),
          //primarySwatch: Colors.deepOrange,//AppColor.primaryColor1,
          bottomNavigationBarTheme: BottomNavigationBarThemeData(
            enableFeedback: true,
            unselectedIconTheme: IconThemeData(color: AppColor.grey1),
            type: BottomNavigationBarType.fixed,
            selectedLabelStyle: TextStyle(fontSize: 12),
            selectedItemColor: AppColor.primaryColor,
            unselectedItemColor: AppColor.grey1,
            selectedIconTheme: IconThemeData(color: AppColor.primaryColor),
            elevation: 0.0,
          ),
        colorScheme:  ColorScheme.fromSwatch().copyWith(
          primary: AppColor.primaryColor,
          secondary: AppColor.grey1,
        ),
      ),
      //initialRoute: "/",
      initialRoute: AppRoute.noInternet,
      getPages: routes,
    );
  }
}