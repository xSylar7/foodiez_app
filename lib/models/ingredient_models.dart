import 'dart:convert';

class Ingredient {
  int id;
  String name;
  List<int> Category;

  Ingredient({
    required this.id,
    required this.name,
    required this.Category,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'Category': Category,
    };
  }

  factory Ingredient.fromMap(Map<String, dynamic> map) {
    return Ingredient(
      id: map['id']?.toInt() ?? 0,
      name: map['name'] ?? '',
      Category: List<int>.from(map['Category']),
    );
  }

  String toJson() => json.encode(toMap());

  factory Ingredient.fromJson(String source) =>
      Ingredient.fromMap(json.decode(source));
}
