import 'package:flutter/material.dart';

import 'package:flutter_foodiez_app/providers/recipe_provider.dart';
import 'package:flutter_foodiez_app/widgets/recipe_card.dart';
import 'package:provider/provider.dart';

class RecipesListPage extends StatelessWidget {
  const RecipesListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Recipes"),
        // actions: [
        //   CupertinoButton(
        //     borderRadius: const BorderRadius.all(Radius.circular(150)),
        //     padding: EdgeInsets.zero,
        //     onPressed: () {
        //       context.push('/login');
        //     },
        //     child: Icon(CupertinoIcons.person_crop_circle),
        //     color: Colors.red,
        //   ),
        // ],
      ),
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(12),
          child: GridView.builder(
            itemCount: context.watch<RecipeProvider>().recipes.length,
            itemBuilder: (context, index) => RecipeCard(
              recipe: context.watch<RecipeProvider>().recipes[index],
            ),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, crossAxisSpacing: 12, mainAxisSpacing: 12
                // childAspectRatio: MediaQuery.of(context).size.width /
                //     (MediaQuery.of(context).size.height),
                ),
          ),
        ),
      ),
    );
  }
}
