import 'package:flutter/material.dart';
import 'package:flutter_foodiez_app/models/category_models.dart';
import 'package:go_router/go_router.dart';

class CategoryCard extends StatelessWidget {
  CategoryCard({super.key, required this.category});

  final Catg category;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 8,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: InkWell(
        onTap: () {
          print("${category.name} Pressed");
          context.push('/recipes');
        },
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(20), topLeft: Radius.circular(20)),
              child: Image.network(
                category.image,
                height: 112,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            Spacer(),
            Padding(
              padding: const EdgeInsets.only(bottom: 16.0),
              child: Text(
                "${category.name}",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
