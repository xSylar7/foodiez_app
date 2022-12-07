import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter_foodiez_app/providers/category_provider.dart';
import 'package:flutter_foodiez_app/widgets/category_card.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

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
          padding: EdgeInsets.symmetric(horizontal: 12),
          child: GridView.builder(
            itemCount: context.watch<CategoryProvider>().categories.length,
            itemBuilder: (context, index) => CategoryCard(
              category: context.watch<CategoryProvider>().categories[index],
            ),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, crossAxisSpacing: 12, mainAxisSpacing: 22
                // childAspectRatio: MediaQuery.of(context).size.width /
                //     (MediaQuery.of(context).size.height),
                ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.push('/create_category'),
        child: Icon(Icons.add),
      ),
    );
  }
}
