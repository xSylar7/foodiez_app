import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import '../models/category_models.dart';
import '../providers/category_provider.dart';
import '../providers/ingredient_provider.dart';

class CreatIngredientPage extends StatefulWidget {
  const CreatIngredientPage({super.key});

  @override
  State<CreatIngredientPage> createState() => _CreatIngredientPageState();
}

class _CreatIngredientPageState extends State<CreatIngredientPage> {
  final nameController = TextEditingController();
  Catg? selectedValue;
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    List<Catg> categories1;
    categories1 = context.watch<CategoryProvider>().categories;

    return Scaffold(
      appBar: AppBar(
        title: Text("Create Ingredient"),
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
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: TextFormField(
                  controller: nameController,
                  decoration: InputDecoration(hintText: "Recipe Name"),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Field is required";
                    }

                    return null;
                  },
                ),
              ),
              DropdownButton<Catg>(
                value: selectedValue,
                icon: Icon(Icons.arrow_drop_down),
                items: categories1
                    .map((e) => DropdownMenuItem<Catg>(
                          child: Text(e.name),
                          value: e,
                        ))
                    .toList(),
                onChanged: (Catg? value) {
                  setState(() {
                    selectedValue = value;
                  });
                },
              ),
              Spacer(),
              ElevatedButton(
                  onPressed: () async {
// form

                    if (formKey.currentState!.validate()) {
                      await context.read<IngredientProvider>().addIngredient(
                          name: nameController.text,
                          category: selectedValue!.id);
                      context.pop();
                    }
                  },
                  child: Text("Add Ingredient"))
            ],
          ),
        ),
      ),
    );
  }
}
