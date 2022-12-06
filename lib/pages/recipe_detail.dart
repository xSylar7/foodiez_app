import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:go_router/go_router.dart';

class RecipeDetail extends StatelessWidget {
  const RecipeDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Foodiez"),
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
            child: Container(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(22),
                child: Image.network(
                  "https://www.kuwaittimes.com/wp-content/uploads/2022/04/p4a-3.jpeg",
                  // height: 140,
                  // width: 140,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 22),
                    child: Text(
                      "recipe.name",
                      style: TextStyle(
                        fontSize: 36,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 42),
                    child: Text(
                      "by: recipe.user",
                      style: TextStyle(fontSize: 20, color: Colors.grey[700]),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 22, vertical: 32),
                    child: Text(
                      "recipe.ingredients",
                      style: TextStyle(
                        fontSize: 24,
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 22, vertical: 32),
                    child: Text(
                      "recipe.description",
                      style: TextStyle(
                        fontSize: 24,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        )));
  }
}
