import 'package:get/get.dart';

import '../controllers/signinwithgoogle_controller.dart';

class SigninwithgoogleBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SigninwithgoogleController>(
      () => SigninwithgoogleController(),
    );
  }
}
