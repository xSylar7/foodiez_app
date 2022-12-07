import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_foodiez_app/models/category_models.dart';
import 'package:go_router/go_router.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard({super.key, required this.category});

  final Catg category;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: () {
          print("Card Pressed !");
          context.push('/recipes');
        },
        child: Column(
          children: [
            Spacer(),
            Image.network(
              category.image,
              height: 112,
              width: double.infinity,
              fit: BoxFit.cover,
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
