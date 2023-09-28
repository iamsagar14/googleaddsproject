import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class RewardedadsController extends GetxController {
  //TODO: Implement RewardedadsController
  RewardedAd? rewardedAd;
  void LoadRewardedAd() {
    RewardedAd.load(
      adUnitId: 'ca-app-pub-3940256099942544/5224354917',
      request: const AdRequest(),
      rewardedAdLoadCallback: RewardedAdLoadCallback(
        onAdLoaded: (RewardedAd ad) {
          rewardedAd = ad;
        },
        onAdFailedToLoad: (LoadAdError error) {
          // LoadRewardedAd();
        },
      ),
    );
  }

  void showRewardedAd() {
    rewardedAd?.show(
      onUserEarnedReward: (ad, reward) {
        print('this is the rewarded ');
        rewardedAd?.fullScreenContentCallback = FullScreenContentCallback(
            onAdShowedFullScreenContent: (RewardedAd ad) {},
            onAdFailedToShowFullScreenContent: (RewardedAd ad, AdError e) {
              ad.dispose();
            },
            onAdDismissedFullScreenContent: (RewardedAd ad) {
              ad.dispose();
            },
            onAdImpression: (RewardedAd ad) {
              print('impression occured $ad');
            });
      },
    );
  }

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
    LoadRewardedAd();
    showRewardedAd();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
}
