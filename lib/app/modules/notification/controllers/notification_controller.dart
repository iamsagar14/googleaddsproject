import 'dart:io';

import 'package:flutterfireabsetest/app/modules/rewardedads/views/rewardedads_view.dart';
import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class NotificationController extends GetxController {
  late InterstitialAd interstitialAd;
  RxBool isAdLoaded = false.obs;
  var addUnit = Platform.isAndroid
      ? 'ca-app-pub-3940256099942544/1033173712'
      : 'ca-app-pub-3940256099942544/4411468910';
  final count = 0.obs;
  initInterstitialAd() {
    InterstitialAd.load(
      adUnitId: addUnit,
      request: const AdRequest(),
      adLoadCallback: InterstitialAdLoadCallback(
        onAdLoaded: (ad) {
          interstitialAd = ad;
          isAdLoaded(true);
          interstitialAd.fullScreenContentCallback =
              FullScreenContentCallback(onAdDismissedFullScreenContent: (ad) {
            // ad.dispose();
            // isAdLoaded(false);
            Get.to(const RewardedadsView());
          }, onAdFailedToShowFullScreenContent: (ad, error) {
            // ad.dispose();
            // isAdLoaded(false);
          });
        },
        onAdFailedToLoad: (Error) {
          interstitialAd.dispose();
        },
      ),
    );
  }

  @override
  void onInit() {
    super.onInit();
    initInterstitialAd();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  refreshPage() {}

  void increment() => count.value++;
}
