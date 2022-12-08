import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_foodiez_app/models/recipe_models.dart';
import 'package:go_router/go_router.dart';

class RecipeCard extends StatelessWidget {
  const RecipeCard({super.key, required this.recipe});

  final Recipe recipe;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: () {
          context.push('/recipe_detail', extra: recipe);
        },
        child: Column(
          children: [
            Spacer(),
            Image.network(
              recipe.image,
              height: 140,
              width: 140,
            ),
            Spacer(),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Text(
                "${recipe.name}",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
            ),
            Row(
              children: [
                CupertinoButton(child: Icon(Icons.delete), onPressed: () {})
              ],
            )
            // Text("${recipe.description}"),
          ],
        ),
      ),
    );
  }
}
