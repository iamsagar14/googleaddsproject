// 🐦 Flutter imports:
import 'package:firebase_messaging/firebase_messaging.dart';
// import 'package:flutterfireabsetest/firebase/dynamic_link_helper.dart';
import 'package:flutterfireabsetest/firebase/push_notification_helper.dart';
// import 'package:flutterfireabsetest/firebase/remote_config_helper.dart';
import 'package:flutterfireabsetest/firebase_options.dart';
import 'package:flutterfireabsetest/main_common.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutterfireabsetest/services/locator.dart' as di;

// 🌎 Project imports:
import 'package:flutterfireabsetest/config/config.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await di.locator.get<PushNotificationHelper>().setupFlutterNotifications();
  di.locator.get<PushNotificationHelper>().showFlutterNotification(message);
}

void main() async {
  var devices = ['A23D74D3BD2A64DD22CBB98170365828'];
  WidgetsFlutterBinding.ensureInitialized();
  di.initLocator();
  await MobileAds.instance.initialize();
  RequestConfiguration requestConfiguration =
      RequestConfiguration(testDeviceIds: devices);
  MobileAds.instance.updateRequestConfiguration(requestConfiguration);
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  await di.locator.get<PushNotificationHelper>().setupFlutterNotifications();
  // await di.locator.get<DynamicLinkHelper>().handleDynamicLinks();
  // await di.locator.get<RemoteConfigHelper>().initialise();
  mainCommon(flavor: Flavor.production);
}
