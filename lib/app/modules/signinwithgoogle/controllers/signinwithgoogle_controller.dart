import 'package:flutter/material.dart';
import 'package:flutterfireabsetest/services/locator.dart';
import 'package:flutterfireabsetest/services/manager/google_signin_manager.dart';
import 'package:get/get.dart';

class SigninwithgoogleController extends GetxController {
  final _googleSigninManager = locator.get<GoogleSigninManager>();
  Future<void> signinWithGoogle() async {
    try {
      final auth = await _googleSigninManager.signInWithGoogle();
      if (auth != null) {
        print(auth.accessToken);
      } else {}
    } catch (e) {
      print("here$e");
    }
  }
}
