import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_foodiez_app/client.dart';
import 'package:flutter_foodiez_app/models/ingredient_models.dart';
import 'package:flutter_foodiez_app/models/recipe_models.dart';

class RecipeProvider extends ChangeNotifier {
  List<Recipe> recipes = [
    // Recipe(
    //     id: 2,
    //     name: "Kuwaiti Food",
    //     ingredients: "beef",
    //     user: "khaled",
    //     image: "https://i.imgur.com/abalVsK.png"),
  ];

  RecipeProvider() {
    loadRecipes();
  }

  Future<void> loadRecipes() async {
    // isLoading = true;
    notifyListeners();

    recipes.clear();

    var response = await Client.dio.get("/recipes/");
    var recipeJsonList = response.data as List;

    recipes =
        recipeJsonList.map((recipeJson) => Recipe.fromMap(recipeJson)).toList();

    // categories.sort((a, b) => a.title.compareTo(b.title));

    // isLoading = false;

    notifyListeners();
  }

  Future<void> addRecipe({
    required String name,
    required File image,
    required int category,
    required List<Ingredient> ingredient,
  }) async {
    var response = await Client.dio.post("/categories/add/",
        data: FormData.fromMap({
          "name": name,
          "image": await MultipartFile.fromFile(image.path),
          "category": category,
          "ingredient": ingredient.map((e) => e.id).toList(),
        }));

    loadRecipes();
  }
}
