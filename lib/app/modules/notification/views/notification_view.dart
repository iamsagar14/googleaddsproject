import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/notification_controller.dart';

class NotificationView extends GetView<NotificationController> {
  const NotificationView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('NotificationView'),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GetBuilder<NotificationController>(
            init: NotificationController(),
            initState: (_) {},
            builder: (_) {
              return Center(
                child: ElevatedButton(
                  child: const Text('show add'),
                  onPressed: () async {
                    if (controller.isAdLoaded.value) {
                      await controller.interstitialAd.show();
                      controller.initInterstitialAd();
                    }
                  },
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
