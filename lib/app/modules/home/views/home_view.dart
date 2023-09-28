// 🐦 Flutter imports:

import 'package:flutter/material.dart';
import 'package:flutterfireabsetest/app/modules/notification/controllers/notification_controller.dart';
import 'package:flutterfireabsetest/app/modules/notification/views/notification_view.dart';
import 'package:flutterfireabsetest/app/modules/signinwithgoogle/views/signinwithgoogle_view.dart';
import 'package:flutterfireabsetest/app/routes/app_pages.dart';

// 📦 Package imports:
import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

// 🌎 Project imports:
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HomeView'),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: ElevatedButton(
              child: const Text('google sign'),
              onPressed: () {
                Get.to(const SigninwithgoogleView());
              },
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Center(
            child: ElevatedButton(
              child: const Text('Showadd'),
              onPressed: () {
                Get.to(const NotificationView());
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: Obx(() => controller.isAdLoaded.value
          ? SizedBox(
              height: controller.bannerAd.size.height.toDouble(),
              width: controller.bannerAd.size.width.toDouble(),
              child: AdWidget(ad: controller.bannerAd),
            )
          : const SizedBox()),
    );
  }
}
