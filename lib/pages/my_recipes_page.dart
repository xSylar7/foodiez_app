import 'package:flutter/material.dart';

import 'package:flutter_foodiez_app/providers/my_recipe_provider.dart';
import 'package:flutter_foodiez_app/widgets/my_recipes_card.dart';
import 'package:provider/provider.dart';

class MyRecipesListPage extends StatelessWidget {
  const MyRecipesListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My Recipes"),
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
          padding: EdgeInsets.only(top: 22),
          child: GridView.builder(
            itemCount: context.watch<MyRecipeProvider>().recipes.length,
            itemBuilder: (context, index) => MyRecipeCard(
              recipe: context.watch<MyRecipeProvider>().recipes[index],
            ),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 1 / 1.2,
            ),
          ),
        ),
      ),
    );
  }
}
