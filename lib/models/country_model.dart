class Country {
  final String code;
  final String name;
  final String emoji;

  Country({required this.code, required this.name, required this.emoji});

  factory Country.fromJson(Map<String, dynamic> json) {
    return Country(
      code: json['code'] ?? '',
      name: json['name'] ?? '',
      emoji: json['emoji'] ?? '',
    );
  }
}
