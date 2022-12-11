import 'dart:io';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_foodiez_app/models/category_models.dart';
import 'package:flutter_foodiez_app/models/ingredient_models.dart';
import 'package:flutter_foodiez_app/providers/category_provider.dart';
import 'package:flutter_foodiez_app/providers/ingredient_provider.dart';
import 'package:flutter_foodiez_app/providers/recipe_provider.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';

import 'package:multi_select_flutter/multi_select_flutter.dart';

import 'package:provider/provider.dart';

class CreateRecipe extends StatefulWidget {
  CreateRecipe({super.key});

  @override
  State<CreateRecipe> createState() => _CreateRecipeState();
}

class _CreateRecipeState extends State<CreateRecipe> {
  final nameController = TextEditingController();
  final descriptionController = TextEditingController();

  File? imageFile;
  String? imageError;

  var formKey = GlobalKey<FormState>();
  Catg? selectedValue;

  void initState() {
    super.initState();
    CategoryProvider().loadCategories();
  }

  List<Ingredient> selectedItems = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Create Recipe"),
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
        child: ListView(
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 8),
              child: Column(
                children: [
                  Form(
                    key: formKey,
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 22),
                          child: TextFormField(
                            controller: nameController,
                            decoration: InputDecoration(
                              hintText: "Recipe Name",
                              focusedBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(width: 3, color: Colors.red),
                                borderRadius: BorderRadius.circular(50.0),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(width: 1, color: Colors.red),
                                borderRadius: BorderRadius.circular(50.0),
                              ),
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Field is required";
                              }

                              return null;
                            },
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(vertical: 8),
                          child: DropdownButtonFormField<Catg>(
                            decoration: InputDecoration(
                              focusedBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(width: 1, color: Colors.red),
                                borderRadius: BorderRadius.circular(50.0),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(width: 1, color: Colors.red),
                                borderRadius: BorderRadius.circular(50.0),
                              ),
                            ),
                            value: selectedValue,
                            hint: Text("Select Category"),
                            icon: Icon(Icons.arrow_drop_down),
                            items: context
                                .watch<CategoryProvider>()
                                .categories
                                .map((e) => DropdownMenuItem<Catg>(
                                      child: Text(e.name),
                                      value: e,
                                    ))
                                .toList(),
                            onChanged: (Catg? value) {
                              setState(() {
                                selectedValue = value;
                                print("${selectedValue} is selected");
                              });
                            },
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(vertical: 8),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(35),
                            border: Border.all(width: 1, color: Colors.red),
                          ),
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 8.0),
                                child: MultiSelectChipField(
                                  items: context
                                      .watch<IngredientProvider>()
                                      .ingredients
                                      .map((e) => MultiSelectItem(e, e.name))
                                      .toList(),
                                  initialValue: [],
                                  title: Text("Select Ingredients"),
                                  headerColor: Colors.red.withOpacity(0),
                                  scroll: false,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(25),
                                    // border: Border.all(width: 1, color: Colors.red),
                                  ),
                                  selectedChipColor:
                                      Colors.red.withOpacity(0.5),
                                  selectedTextStyle:
                                      TextStyle(color: Colors.black),
                                  onTap: (values) {
                                    selectedItems = values
                                        .map((e) => e)
                                        .toList()
                                        .cast<Ingredient>();
                                    print(
                                        "${selectedItems.map((e) => e.name).toList()} is selected");
                                  },
                                ),
                              ),
                              Row(
                                children: [
                                  Spacer(),
                                  CupertinoButton(
                                      child: Row(
                                        children: [
                                          Icon(Icons.add),
                                          Text("Create Ingredient")
                                        ],
                                      ),
                                      onPressed: () {
                                        context.push("/create_ingredient");
                                      }),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8),
                          child: TextFormField(
                            controller: descriptionController,
                            decoration: InputDecoration(
                              hintText: "Description",
                              focusedBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(width: 3, color: Colors.red),
                                borderRadius: BorderRadius.circular(50.0),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(width: 1, color: Colors.red),
                                borderRadius: BorderRadius.circular(50.0),
                              ),
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Field is required";
                              }

                              return null;
                            },
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(vertical: 8),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(35),
                            border: Border.all(width: 1, color: Colors.red),
                          ),
                          child: Row(
                            children: [
                              if (imageFile != null)
                                Padding(
                                  padding: const EdgeInsets.only(left: 32),
                                  child: Image.file(
                                    imageFile!,
                                    width: 100,
                                    height: 100,
                                  ),
                                )
                              else
                                Container(
                                  width: 100,
                                  height: 100,
                                ),
                              Spacer(),
                              CupertinoButton(
                                onPressed: () async {
                                  var file = await ImagePicker()
                                      .pickImage(source: ImageSource.gallery);

                                  if (file == null) {
                                    print("Use didnt select a file");
                                    return;
                                  }

                                  setState(() {
                                    imageFile = File(file.path);
                                    imageError = null;
                                  });
                                },
                                child: Row(
                                  children: [
                                    Icon(Icons.add),
                                    Text("Add Image"),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        if (imageError != null)
                          Text(
                            imageError!,
                            style: TextStyle(color: Colors.red),
                          ),
                        Padding(
                          padding: const EdgeInsets.only(top: 22),
                          child: ElevatedButton(
                              onPressed: () async {
                                // form

                                if (imageFile == null) {
                                  setState(() {
                                    imageError = "Required field";
                                  });
                                }

                                if (formKey.currentState!.validate() &&
                                    imageFile != null) {
                                  await context
                                      .read<RecipeProvider>()
                                      .addRecipe(
                                          name: nameController.text,
                                          image: imageFile!,
                                          category: selectedValue!.id,
                                          ingredient: selectedItems,
                                          description:
                                              descriptionController.text);
                                  context.pop();
                                }
                              },
                              child: Text("Add Recipe")),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
