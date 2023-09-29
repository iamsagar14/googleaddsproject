// 🎯 Dart imports:
import 'dart:convert';

// 📦 Package imports:
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutterfireabsetest/model/onboarding_pages.dart';

// 🌎 Project imports:

class RemoteConfigHelper {
  final Map<String, dynamic> defaults = {
    "onBoardingPages": jsonEncode([
      {"title": "Employee Data Management", "image": ""},
      {"title": "Payroll Management", "image": ""},
      {"title": "Reporting and Analysis", "image": ""}
    ])
  };

  Future<void> initialise() async {
    try {
      await FirebaseRemoteConfig.instance
          .setConfigSettings(RemoteConfigSettings(
        fetchTimeout: const Duration(minutes: 1),
        minimumFetchInterval: const Duration(seconds: 1),
      ));
      await FirebaseRemoteConfig.instance.setDefaults(defaults);
      await FirebaseRemoteConfig.instance.fetchAndActivate();
    } catch (_) {}
  }

  List<OnboardingPage> get onBoardingPages {
    List decodedValue = jsonDecode(
        FirebaseRemoteConfig.instance.getValue("onBoardingPages").asString());
    return List<OnboardingPage>.from(
        decodedValue.map((e) => OnboardingPage.fromMap(e)));
  }
}
