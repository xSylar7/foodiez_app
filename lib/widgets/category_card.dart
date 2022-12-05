import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_foodiez_app/models/category_models.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard({super.key, required this.category});

  final Catg category;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: () {
          print("Card Pressed !");
        },
        child: Column(
          children: [
            Spacer(),
            Image.network(
              category.image,
              height: 140,
              width: 140,
            ),
            Spacer(),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Text(
                "${category.name}",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
            ),
            // Text("${category.description}"),
          ],
        ),
      ),
    );
  }
}
