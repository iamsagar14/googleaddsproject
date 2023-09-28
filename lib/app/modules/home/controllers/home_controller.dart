// 📦 Package imports:
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutterfireabsetest/firebase/firebase_helper.dart';
import 'package:get/get.dart';

// 🌎 Project imports:
import 'package:flutterfireabsetest/config/config.dart';
import 'package:flutterfireabsetest/services/locator.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class HomeController extends GetxController {
  late BannerAd bannerAd;
  Rx<bool> isAdLoaded = false.obs;
  var adUnit = 'ca-app-pub-3940256099942544/6300978111';
  initBannerAd() {
    bannerAd = BannerAd(
      size: AdSize.largeBanner,
      adUnitId: adUnit,
      listener: BannerAdListener(onAdLoaded: (ad) {
        isAdLoaded(true);
        // update();
      }, onAdFailedToLoad: (ad, error) {
        ad.dispose();
        print(error);
      }),
      request: const AdRequest(),
    )..load();
  }

  final Config config = locator.get<Config>();
  final _notificationHelper = locator.get<PushNotificationHelper>();

  @override
  void onInit() async {
    super.onInit();
    initBannerAd();
    final token = await _notificationHelper.retrieveFCMToken();
    FirebaseMessaging.onMessage.listen(
      (RemoteMessage message) {
        _notificationHelper.showFlutterNotification(message);
      },
    );
    _notificationHelper.setupInteractedMessage();
    print("Here ${token}");
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
