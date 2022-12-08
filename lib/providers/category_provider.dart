import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_foodiez_app/client.dart';
import 'package:flutter_foodiez_app/models/category_models.dart';

class CategoryProvider extends ChangeNotifier {
  List<Catg> categories = [];

  CategoryProvider() {
    loadCategories();
  }

  Future<void> loadCategories() async {
    // isLoading = true;
    notifyListeners();

    categories.clear();

    var response = await Client.dio.get("/categories/");

    var categoryJsonList = response.data as List;

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
