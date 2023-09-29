import 'dart:convert';

import 'package:flutterfireabsetest/model/profile.dart';
import 'package:flutterfireabsetest/model/token.dart';

class LoginResponse {
  final Token token;
  final Profile profile;

  LoginResponse({
    required this.token,
    required this.profile,
  });

  factory LoginResponse.fromJson(String str) =>
      LoginResponse.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory LoginResponse.fromMap(Map<String, dynamic> json) => LoginResponse(
        token: Token.fromMap(json["token"]),
        profile: Profile.fromMap(json["profile"]),
      );

  Map<String, dynamic> toMap() => {
        "token": token.toMap(),
        "profile": profile.toMap(),
      };

  LoginResponse copyWith({
    Token? token,
    Profile? profile,
  }) {
    return LoginResponse(
      token: token ?? this.token,
      profile: profile ?? this.profile,
    );
  }
}
