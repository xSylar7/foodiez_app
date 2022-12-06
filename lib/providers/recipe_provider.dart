import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_foodiez_app/client.dart';
import 'package:flutter_foodiez_app/models/category_models.dart';
import 'package:flutter_foodiez_app/models/recipe_models.dart';

class RecipeProvider extends ChangeNotifier {
  List<Recipe> recipes = [
    // Catg(
    //     name: "Kuwaiti Food",
    //     description: "food that is main origin from Kuwait"),
    // Catg(
    //     name: "Mexican Food",
    //     description: "food that is main origin from Mexico"),
    // Catg(
    //     name: "Japanese Food",
    //     description: "food that is main origin from Japan"),
  ];

  CategoryProvider() {
    loadCategories();
  }

  Future<void> loadCategories() async {
    // isLoading = true;
    // notifyListeners();

    recipes.clear();

    var response = await Client.dio.get("/recipes/");

    var recipesJsonList = response.data as List;
    // for (int i = 0; i < bookJsonList.length; i++) {
    //   var bookJson = bookJsonList[i] as Map;
    //   var book = Book(
    //     id: bookJson['id'],
    //     title: bookJson['title'],
    //     description: bookJson['description'],
    //     image: bookJson['image'],
    //     price: bookJson['price'].toString(),
    //   );

    //   books.add(book);
    // }

    // books = bookJsonList
    //     .map((bookJson) => Book(
    //           id: bookJson['id'],
    //           title: bookJson['title'],
    //           description: bookJson['description'],
    //           image: bookJson['image'],
    //           price: bookJson['price'].toString(),
    //         ))
    //     .toList();
    recipes = recipesJsonList
        .map((recipesJson) => Recipe.fromMap(recipesJson))
        .toList();

    // categories.sort((a, b) => a.title.compareTo(b.title));

    // isLoading = false;

    notifyListeners();
  }
}
