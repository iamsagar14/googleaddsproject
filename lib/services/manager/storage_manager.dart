import 'dart:convert';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutterfireabsetest/model/loginresponse.dart';

class StorageManager {
  static const _hasOnboardedKey = 'hasOnboarded';
  static const _tokenKey = 'rxpinToken';

  late final FlutterSecureStorage _storage = _createStorage();
  FlutterSecureStorage _createStorage() {
    AndroidOptions androidOptions = const AndroidOptions(
      encryptedSharedPreferences: true,
    );
    final storage = FlutterSecureStorage(aOptions: androidOptions);
    return storage;
  }

  void saveOnboarded(bool value) {
    _storage.write(key: _hasOnboardedKey, value: jsonEncode(value));
  }

  Future<bool> get hasOnboarded async {
    final onBoardedString = await _storage.read(key: _hasOnboardedKey);
    if (onBoardedString != null) {
      return jsonDecode(onBoardedString);
    } else {
      return false;
    }
  }

  void saveToken(LoginResponse value) {
    _storage.write(key: _tokenKey, value: value.toJson());
  }

  void removeToken() {
    _storage.delete(key: _tokenKey);
  }

  Future<LoginResponse?> get token async {
    final tokenString = await _storage.read(key: _tokenKey);
    if (tokenString != null) {
      return LoginResponse.fromJson(tokenString);
    } else {
      return null;
    }
  }
}
