import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_foodiez_app/providers/category_provider.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class CreateCategory extends StatefulWidget {
  const CreateCategory({super.key});

  @override
  State<CreateCategory> createState() => _CreateCategoryState();
}

class _CreateCategoryState extends State<CreateCategory> {
  final nameController = TextEditingController();

  File? imageFile;
  String? imageError;

  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Create Category"),
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
        child: Form(
          key: formKey,
          child: Column(
            children: [
              Spacer(),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: TextFormField(
                  controller: nameController,
                  decoration: InputDecoration(
                    hintText: "Category Name",
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(width: 3, color: Colors.red),
                      borderRadius: BorderRadius.circular(50.0),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(width: 1, color: Colors.red),
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
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                child: Container(
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
                            width: 130,
                            height: 130,
                          ),
                        )
                      else
                        Container(
                          width: 130,
                          height: 130,
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
              ),
              if (imageError != null)
                Text(
                  imageError!,
                  style: TextStyle(color: Colors.red),
                ),
              Spacer(),
              ElevatedButton(
                  onPressed: () async {
                    // form

                    if (imageFile == null) {
                      setState(() {
                        imageError = "Required field";
                      });
                    }

                    if (formKey.currentState!.validate() && imageFile != null) {
                      await context.read<CategoryProvider>().addCategory(
                            name: nameController.text,
                            image: imageFile!,
                          );
                      context.pop();
                    }
                  },
                  child: Text("Add Category"))
            ],
          ),
        ),
      ),
    );
  }
}
