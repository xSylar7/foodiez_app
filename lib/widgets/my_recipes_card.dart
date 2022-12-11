import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_foodiez_app/models/recipe_models.dart';
import 'package:go_router/go_router.dart';

class MyRecipeCard extends StatelessWidget {
  MyRecipeCard({super.key, required this.recipe});

  final Recipe recipe;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 8,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: InkWell(
        onTap: () {
          print("${recipe.name} Pressed");
          context.push('/recipe_detail', extra: recipe);
        },
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(20), topLeft: Radius.circular(20)),
              child: Image.network(
                recipe.image,
                height: 112,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            Spacer(),
            Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: Text(
                "${recipe.name}",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
            ),
            Row(
              children: [
                CupertinoButton(
                    child: Row(
                      children: [
                        Icon(Icons.edit),
                        Text(
                          "Edit",
                          style: TextStyle(fontSize: 16),
                        ),
                      ],
                    ),
                    onPressed: () {}),
                CupertinoButton(
                    child: Row(
                      children: [
                        Icon(
                          Icons.delete,
                          color: Colors.red,
                        ),
                        Text(
                          "Delete",
                          style: TextStyle(color: Colors.red, fontSize: 16),
                        ),
                      ],
                    ),
                    onPressed: () {}),
              ],
            )
          ],
        ),
      ),
    );
  }
}
