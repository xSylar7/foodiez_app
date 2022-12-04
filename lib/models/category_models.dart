import 'dart:convert';

class Catg {
  String name;
  String description;

  Catg({
    required this.name,
    required this.description,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'description': description,
    };
  }

  factory Catg.fromMap(Map<String, dynamic> map) {
    return Catg(
      name: map['name'] ?? '',
      description: map['description'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Catg.fromJson(String source) => Catg.fromMap(json.decode(source));
}
