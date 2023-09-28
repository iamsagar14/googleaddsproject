import 'package:get/get.dart';

import '../controllers/rewardedads_controller.dart';

class RewardedadsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RewardedadsController>(
      () => RewardedadsController(),
    );
  }
}
