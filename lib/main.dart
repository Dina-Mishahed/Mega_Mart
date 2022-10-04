import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mega_market/core/localization/changel_local.dart';
import 'package:mega_market/core/services/services.dart';
import 'package:mega_market/routes.dart';
import 'core/localization/translation.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initialServices();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform,);
  runApp(MyApp()
    // DevicePreview(
    //   enabled: true,
    //   tools: [
    //     ...DevicePreview.defaultTools,
    //   ],
    //   builder: (context) => MyApp(),
    // ),
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
        primarySwatch: Colors.deepPurple,
      ),
      initialRoute: "/",
      getPages: routes,
    );
  }
}
