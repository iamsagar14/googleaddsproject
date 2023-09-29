import 'dart:convert';

class OnboardingPage {
  final String title;
  final String image;
  OnboardingPage({
    required this.title,
    required this.image,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'title': title,
      'image': image,
    };
  }

  factory OnboardingPage.fromMap(Map<String, dynamic> map) {
    return OnboardingPage(
      title: map['title'],
      image: map['image'],
    );
  }

  String toJson() => json.encode(toMap());

  factory OnboardingPage.fromJson(String source) =>
      OnboardingPage.fromMap(json.decode(source) as Map<String, dynamic>);
}
