import 'dart:convert';

class Recipe {
  int id;
  String name;
  String ingredients;
  String user;
  String description;
  String image;

  Recipe({
    required this.id,
    required this.name,
    required this.ingredients,
    required this.user,
    required this.description,
    required this.image,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'ingredients': ingredients,
      'user': user,
      'description': description,
      'image': image,
    };
  }

  factory Recipe.fromMap(Map<String, dynamic> map) {
    return Recipe(
      id: map['id']?.toInt() ?? 0,
      name: map['name'] ?? '',
      ingredients: map['ingredients'] ?? '',
      user: map['user'] ?? '',
      description: map['description'] ?? '',
      image: map['image'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Recipe.fromJson(String source) => Recipe.fromMap(json.decode(source));
}
