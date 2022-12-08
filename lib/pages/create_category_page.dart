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
        actions: [
          CupertinoButton(
            borderRadius: const BorderRadius.all(Radius.circular(150)),
            padding: EdgeInsets.zero,
            onPressed: () {
              context.push('/login');
            },
            child: Icon(CupertinoIcons.person_crop_circle),
            color: Colors.red,
          ),
        ],
      ),
      body: SafeArea(
        child: Form(
          key: formKey,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: TextFormField(
                  controller: nameController,
                  decoration: InputDecoration(hintText: "Category Name"),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Field is required";
                    }

                    return null;
                  },
                ),
              ),
              if (imageFile != null)
                Image.file(
                  imageFile!,
                  width: 100,
                  height: 100,
                )
              else
                Container(
                  width: 100,
                  height: 100,
                ),
              ElevatedButton(
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
                  child: Text("Add Image")),
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
