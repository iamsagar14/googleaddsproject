// 🌎 Project imports:
import 'package:flutterfireabsetest/config/config.dart';
import 'package:flutterfireabsetest/services/locator.dart';

class Endpoint {
  Endpoint._();

  static final String baseUrl = locator.get<Config>().baseUrl;
}
