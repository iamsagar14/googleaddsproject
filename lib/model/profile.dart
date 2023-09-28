import 'dart:convert';
import 'package:get/utils.dart';
import 'package:intl/intl.dart';

enum Gender { male, female, others }

enum UserType { therapist, consumer }

class Profile {
  final String uuid;
  final String fullName;
  final String email;
  final String? photo;
  final DateTime? dob;
  final Gender? gender;
  final double profileSetup;
  final String? bio;
  final UserType? group;
  final String? authProviders;

  Profile({
    required this.uuid,
    required this.fullName,
    required this.email,
    required this.photo,
    required this.dob,
    required this.gender,
    required this.profileSetup,
    required this.group,
    required this.bio,
    required this.authProviders,
  });

  factory Profile.fromJson(String str) => Profile.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Profile.fromMap(Map<String, dynamic> json) => Profile(
        uuid: json["uuid"],
        fullName: json["full_name"],
        email: json["email"],
        photo: json["photo"],
        dob: json["dob"] != null
            ? DateFormat('yyyy-MM-dd').parse(json["dob"])
            : null,
        bio: json["bio"],
        gender: json["gender"] != null
            ? Gender.values.firstWhereOrNull((element) =>
                element.name == (json["gender"] as String).toLowerCase())
            : null,
        profileSetup: json["profile_setup"],
        group: json["group"] != null
            ? UserType.values.firstWhereOrNull((element) =>
                element.name == (json["group"] as String).toLowerCase())
            : null,
        authProviders: json["auth_providers"],
      );

  Map<String, dynamic> toMap() => {
        "uuid": uuid,
        "full_name": fullName,
        "email": email,
        "photo": photo,
        "bio": bio,
        "dob": dob != null ? DateFormat('yyyy-MM-dd').format(dob!) : null,
        // "gender": gender?.name,
        "profile_setup": profileSetup,
        // "group": group?.name,
        "auth_providers": authProviders,
      };

  Profile copyWith({
    String? uuid,
    String? fullName,
    String? email,
    String? photo,
    DateTime? dob,
    // Gender? gender,
    String? bio,
    double? profileSetup,
    // UserType? group,
    String? authProviders,
  }) {
    return Profile(
      uuid: uuid ?? this.uuid,
      fullName: fullName ?? this.fullName,
      email: email ?? this.email,
      photo: photo ?? this.photo,
      dob: dob ?? this.dob,
      gender: gender ?? this.gender,
      profileSetup: profileSetup ?? this.profileSetup,
      group: group ?? this.group,
      authProviders: authProviders ?? this.authProviders,
      bio: bio,
    );
  }

  String? get genderAge {
    if (dob != null && gender != null) {
      final age = DateTime.now().difference(dob!).inDays ~/ 365;
      return '${gender!.name}, $age years';
    } else if (dob != null) {
      final age = DateTime.now().difference(dob!).inDays ~/ 365;
      return '$age years';
    } else if (gender != null) {
      return gender!.name;
    } else {
      return null;
    }
  }
}
