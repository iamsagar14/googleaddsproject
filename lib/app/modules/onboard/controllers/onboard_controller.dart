import 'package:flutter/material.dart';
import 'package:flutterfireabsetest/app/modules/home/views/home_view.dart';
import 'package:flutterfireabsetest/app/routes/app_pages.dart';
import 'package:flutterfireabsetest/firebase/remote_config_helper.dart';
import 'package:flutterfireabsetest/model/onboarding_pages.dart';
import 'package:flutterfireabsetest/services/locator.dart';
import 'package:flutterfireabsetest/services/manager/storage_manager.dart';
import 'package:get/get.dart';

class OnboardController extends GetxController {
  final RemoteConfigHelper _remoteConfigService =
      locator.get<RemoteConfigHelper>();
  final StorageManager _storageManager = locator.get<StorageManager>();
  RxList<OnboardingPage> onBoardingPages = <OnboardingPage>[].obs;
  late final PageController pageController;
  RxInt currentIndex = 0.obs;

  @override
  void onInit() async {
    super.onInit();
    pageController =
        PageController(initialPage: 0, keepPage: true, viewportFraction: 1.0);
    onBoardingPages(_remoteConfigService.onBoardingPages);
    update();
  }

  void previous() {
    pageController.previousPage(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeIn,
    );
  }

  void next() {
    if (currentIndex.value < onBoardingPages.length - 1) {
      pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeIn,
      );
    } else {
      onDone();
    }
  }

  void onDone() {
    _storageManager.saveOnboarded(true);
    Get.toNamed(Routes.HOME);
  }
}
