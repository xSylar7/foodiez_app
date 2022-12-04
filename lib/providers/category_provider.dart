import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_foodiez_app/models/category_models.dart';

class CategoryProvider extends ChangeNotifier {
  List<Catg> categories = [
    Catg(
        name: "Kuwaiti Food",
        description: "food that is main origin from Kuwait"),
    Catg(
        name: "Mexican Food",
        description: "food that is main origin from Mexico"),
    Catg(
        name: "Japanese Food",
        description: "food that is main origin from Japan"),
  ];

  // CategoryProvider() {
  //   loadCategory();
  // }
}
