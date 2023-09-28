// 📦 Package imports:
// import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
// import 'package:get/get.dart';

// 🌎 Project imports:

// class DynamicLinkHelper {
//   Future handleDynamicLinks() async {
//     final PendingDynamicLinkData? initialLinkData =
//         await FirebaseDynamicLinks.instance.getInitialLink();

//     _handleDeepLink(initialLinkData);

//     FirebaseDynamicLinks.instance.onLink.listen((dynamicLinkData) {
//       _handleDeepLink(dynamicLinkData);
//     }).onError((error) {});
//   }

//   void _handleDeepLink(PendingDynamicLinkData? linkData) {
//     if (linkData != null) {
//       final Uri deepLink = linkData.link;
//       Get.rootDelegate.toNamed(
//         deepLink.path,
//         arguments: {},
//       );
//     }
//   }
// }
