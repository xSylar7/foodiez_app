import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_foodiez_app/models/ingredient_models.dart';

import '../client.dart';

class IngredientProvider extends ChangeNotifier {
  List<Ingredient> ingredients = [
    // Ingredient(id: 1, name: "Beef", Category: [2])
  ];

  IngredientProvider() {
    loadIngredient();
  }

  Future<void> loadIngredient() async {
    // isLoading = true;
    notifyListeners();

    ingredients.clear();

    var response = await Client.dio.get("/ingredients/");

    var ingredientJsonList = response.data as List;

    ingredients = ingredientJsonList
        .map((ingredientJson) => Ingredient.fromMap(ingredientJson))
        .toList();

    notifyListeners();
  }

  Future<void> addIngredient({
    required String name,
  }) async {
    var response = await Client.dio.post("/ingredients/add/",
        data: FormData.fromMap({
          "name": name,
        }));

    loadIngredient();
  }
}
