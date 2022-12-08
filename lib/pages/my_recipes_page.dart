import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter_foodiez_app/providers/my_recipe_provider.dart';
import 'package:flutter_foodiez_app/widgets/recipe_card.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class MyRecipesListPage extends StatelessWidget {
  const MyRecipesListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My Recipes"),
        actions: [
          CupertinoButton(
            borderRadius: const BorderRadius.all(Radius.circular(150)),
            padding: EdgeInsets.zero,
            onPressed: () {
              context.push('/login');
            },
            child: Icon(CupertinoIcons.person_crop_circle),
            color: Colors.red,
          ),
        ],
      ),
      body: SafeArea(
        child: Container(
          child: GridView.builder(
            itemCount: context.watch<MyRecipeProvider>().recipes.length,
            itemBuilder: (context, index) => RecipeCard(
              recipe: context.watch<MyRecipeProvider>().recipes[index],
            ),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              // childAspectRatio: MediaQuery.of(context).size.width /
              //     (MediaQuery.of(context).size.height),
            ),
          ),
        ),
      ),
    );
  }
}
