import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/signinwithgoogle_controller.dart';

class SigninwithgoogleView extends GetView<SigninwithgoogleController> {
  const SigninwithgoogleView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Get.put(() => SigninwithgoogleController());

    return Scaffold(
      appBar: AppBar(
        title: const Text('SigninwithgoogleView'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () async {
                await controller.signinWithGoogle();
              },
              child: const Text('signin'),
            ),
          ],
        ),
      ),
    );
  }
}
