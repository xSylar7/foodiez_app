import 'dart:convert';

class Catg {
  int id;
  String name;
  String image;

  Catg({
    required this.id,
    required this.name,
    required this.image,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'image': image,
    };
  }

  factory Catg.fromMap(Map<String, dynamic> map) {
    return Catg(
      id: map['id']?.toInt() ?? 0,
      name: map['name'] ?? '',
      image: map['image'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Catg.fromJson(String source) => Catg.fromMap(json.decode(source));
}
