import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_foodiez_app/client.dart';
import 'package:flutter_foodiez_app/models/recipe_models.dart';

class MyRecipeProvider extends ChangeNotifier {
  List<Recipe> recipes = [
    // Recipe(
    //     id: 2,
    //     name: "Kuwaiti Food",
    //     ingredients: "beef",
    //     user: "khaled",
    //     image: "https://i.imgur.com/abalVsK.png"),
  ];

  //   int id;
  // String name;
  // String ingredients;
  // String user;

  MyRecipeProvider() {
    loadMyRecipes();
  }

  Future<void> loadMyRecipes() async {
    // isLoading = true;
    notifyListeners();

    recipes.clear();

    var response = await Client.dio.get("/recipes/myrecipes/");
    var myrecipeJsonList = response.data as List;

    recipes = myrecipeJsonList
        .map((myrecipeJson) => Recipe.fromMap(myrecipeJson))
        .toList();

    // categories.sort((a, b) => a.title.compareTo(b.title));

    // isLoading = false;

    notifyListeners();
  }
}
