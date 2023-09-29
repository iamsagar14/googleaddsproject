// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:jwt_decoder/jwt_decoder.dart';

class Token {
  final String refresh;
  final String access;

  Token({
    required this.refresh,
    required this.access,
  });

  factory Token.fromJson(String str) => Token.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Token.fromMap(Map<String, dynamic> json) => Token(
        refresh: json["refresh"],
        access: json["access"],
      );

  Map<String, dynamic> toMap() => {
        "refresh": refresh,
        "access": access,
      };

  bool get accessExpired => JwtDecoder.isExpired(access);
  bool get refreshExpired => JwtDecoder.isExpired(refresh);

  Token copyWith({
    String? refresh,
    String? access,
  }) {
    return Token(
      refresh: refresh ?? this.refresh,
      access: access ?? this.access,
    );
  }
}
