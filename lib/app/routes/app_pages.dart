import 'package:get/get.dart';

import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/notification/bindings/notification_binding.dart';
import '../modules/notification/views/notification_view.dart';
import '../modules/onboard/bindings/onboard_binding.dart';
import '../modules/onboard/views/onboard_view.dart';
import '../modules/profile/bindings/profile_binding.dart';

import '../modules/profile/views/profile_view.dart';

import '../modules/rewardedads/bindings/rewardedads_binding.dart';
import '../modules/rewardedads/views/rewardedads_view.dart';
import '../modules/signinwithgoogle/bindings/signinwithgoogle_binding.dart';
import '../modules/signinwithgoogle/views/signinwithgoogle_view.dart';

// 📦 Package imports:
// ignore_for_file: constant_identifier_names

// 🌎 Project imports:

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.ONBOARD;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.NOTIFICATION,
      page: () => const NotificationView(),
      binding: NotificationBinding(),
    ),
    GetPage(
      name: _Paths.PROFILE,
      page: () => const ProfileView(),
      binding: ProfileBinding(),
      children: [
        GetPage(
          name: _Paths.PROFILE,
          page: () => const ProfileView(),
          binding: ProfileBinding(),
        ),
      ],
    ),
    GetPage(
      name: _Paths.SIGNINWITHGOOGLE,
      page: () => const SigninwithgoogleView(),
      binding: SigninwithgoogleBinding(),
    ),
    GetPage(
      name: _Paths.REWARDEDADS,
      page: () => const RewardedadsView(),
      binding: RewardedadsBinding(),
    ),
    GetPage(
      name: _Paths.ONBOARD,
      page: () => const OnboardView(),
      binding: OnboardBinding(),
    ),
  ];
}
