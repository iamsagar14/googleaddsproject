// 🐦 Flutter imports:
import 'package:flutter/material.dart';
import 'package:flutterfireabsetest/app/modules/signinwithgoogle/controllers/signinwithgoogle_controller.dart';

// 📦 Package imports:
import 'package:get/get.dart';

// 🌎 Project imports:
import 'package:flutterfireabsetest/app/routes/app_pages.dart';
import 'package:flutterfireabsetest/config/config.dart';
import 'package:flutterfireabsetest/services/locator.dart' as di;

void mainCommon({required Flavor flavor}) async {
  di.initLocator();
  di.locator.get<Config>().currentFlavor = flavor;

  runApp(
    GetMaterialApp(
      title: di.locator.get<Config>().applicationName,
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.light,
    ),
  );
}
