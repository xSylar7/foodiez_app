import 'package:flutter/material.dart';
import 'package:flutter_foodiez_app/models/category_models.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard({super.key, required this.category});

  final Catg category;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          Spacer(),
          Text(
            "Category Image",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          Spacer(),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Text("${category.name}"),
          ),
          // Text("${category.description}"),
        ],
      ),
    );
  }
}
