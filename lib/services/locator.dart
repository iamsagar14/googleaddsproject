// 📦 Package imports:
// import 'package:flutterfireabsetest/firebase/dynamic_link_helper.dart';
import 'package:flutterfireabsetest/firebase/push_notification_helper.dart';
import 'package:flutterfireabsetest/services/manager/google_signin_manager.dart';
// import 'package:flutterfireabsetest/firebase/remote_config_helper.dart';
import 'package:get_it/get_it.dart';

// 🌎 Project imports:
import 'package:flutterfireabsetest/config/config.dart';
import 'package:flutterfireabsetest/services/api/base_client.dart';
import 'package:google_sign_in/google_sign_in.dart';

GetIt locator = GetIt.instance;
void initLocator() {
  if (!locator.isRegistered<Config>()) {
    locator.registerLazySingleton(
      () => Config(),
    );
  }
  if (!locator.isRegistered<BaseClient>()) {
    locator.registerLazySingleton(
      () => BaseClient(),
    );
  }
  if (!locator.isRegistered<PushNotificationHelper>()) {
    locator.registerLazySingleton(
      () => PushNotificationHelper(),
    );
  }
  if (!locator.isRegistered<GoogleSignIn>()) {
    locator.registerLazySingleton(
      () => GoogleSignIn(),
    );
  }

  if (!locator.isRegistered<GoogleSigninManager>()) {
    locator.registerLazySingleton(
      () => GoogleSigninManager(googleSignIn: locator()),
    );
  }
}
