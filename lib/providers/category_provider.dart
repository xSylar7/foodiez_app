import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_foodiez_app/client.dart';
import 'package:flutter_foodiez_app/models/category_models.dart';

class CategoryProvider extends ChangeNotifier {
  List<Catg> categories = [
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
    notifyListeners();

    categories.clear();

    var response = await Client.dio.get("/categories/");

    var categoryJsonList = response.data as List;
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
    categories = categoryJsonList
        .map((categoryJson) => Catg.fromMap(categoryJson))
        .toList();

    // categories.sort((a, b) => a.title.compareTo(b.title));

    // isLoading = false;

    notifyListeners();
  }

  Future<void> addCategory({
    required String name,
    required File image,
  }) async {
    var response = await Client.dio.post("/categories/add/",
        data: FormData.fromMap({
          "name": name,
          "image": await MultipartFile.fromFile(image.path),
        }));

    loadCategories();
  }
}
