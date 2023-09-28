// 📦 Package imports:
import 'package:flutterfireabsetest/app/modules/signinwithgoogle/controllers/signinwithgoogle_controller.dart';
import 'package:get/get.dart';

// 🌎 Project imports:
import 'package:flutterfireabsetest/app/modules/home/controllers/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(
      () => HomeController(),
    );
    Get.lazyPut<SigninwithgoogleController>(
      () => SigninwithgoogleController(),
    );
  }
}
