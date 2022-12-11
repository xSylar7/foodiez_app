import 'dart:convert';

class Recipe {
  int id;
  String name;
  List<int> ingredients;
  int user;
  String image;
  int category;
  String description;
  Recipe({
    required this.id,
    required this.name,
    required this.ingredients,
    required this.user,
    required this.image,
    required this.category,
    required this.description,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'ingredients': ingredients,
      'user': user,
      'image': image,
      'category': category,
      'description': description,
    };
  }

  factory Recipe.fromMap(Map<String, dynamic> map) {
    return Recipe(
      id: map['id']?.toInt() ?? 0,
      name: map['name'] ?? '',
      ingredients: List<int>.from(map['ingredients']),
      user: map['user']?.toInt() ?? 0,
      image: map['image'] ?? '',
      category: map['category']?.toInt() ?? 0,
      description: map['description'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Recipe.fromJson(String source) => Recipe.fromMap(json.decode(source));
}
