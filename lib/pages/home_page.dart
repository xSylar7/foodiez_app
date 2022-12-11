import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_foodiez_app/providers/auth_provider.dart';

import 'package:flutter_foodiez_app/providers/category_provider.dart';
import 'package:flutter_foodiez_app/widgets/category_card.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Foodiez"),
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
      drawer: Drawer(
        // Add a ListView to the drawer. This ensures the user can scroll
        // through the options in the drawer if there isn't enough vertical
        // space to fit everything.
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: [
            SizedBox(
              height: 111,
              child: DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.red,
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black54,
                        blurRadius: 10.0,
                        offset: Offset(0.0, 0.75))
                  ],
                ),
                child: context.watch<AuthProvider>().first_name != null
                    ? Text(
                        'Hey ${context.watch<AuthProvider>().first_name} 👋🏻',
                        style: TextStyle(
                          fontSize: 22,
                          color: Colors.white,
                        ),
                      )
                    : Text(
                        "Home Page",
                        style: TextStyle(
                          fontSize: 22,
                          color: Colors.white,
                        ),
                      ),
              ),
            ),
            (context.watch<AuthProvider>().username == null)
                ? ListTile(
                    title: const Text('Login'),
                    onTap: () {
                      context.push('/login');
                      Navigator.pop(context);
                    },
                  )
                : Container(),
            (context.watch<AuthProvider>().username != null)
                ? ListTile(
                    title: const Text('Create Category'),
                    onTap: () {
                      context.push('/create_category');
                      // Update the state of the app.
                      // ...
                    },
                  )
                : Container(),
            (context.watch<AuthProvider>().username != null)
                ? ListTile(
                    title: const Text('Create Recipe'),
                    onTap: () {
                      context.push('/create_recipe');
                      // Update the state of the app.
                      // ...
                    },
                  )
                : Container(),
            (context.watch<AuthProvider>().username != null)
                ? ListTile(
                    title: const Text('My Recipes'),
                    onTap: () {
                      context.push("/my_recipes");
                      // Update the state of the app.
                      // ...
                    },
                  )
                : Container(),
            (context.watch<AuthProvider>().username != null)
                ? ListTile(
                    title: const Text(
                      'Logout',
                      style: TextStyle(
                          color: Colors.red, fontWeight: FontWeight.bold),
                    ),
                    onTap: () {
                      context.read<AuthProvider>().logout();
                      Navigator.pop(context);
                    },
                  )
                : Container(),
          ],
        ),
      ),
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(12),
          child: GridView.builder(
            itemCount: context.watch<CategoryProvider>().categories.length,
            itemBuilder: (context, index) => CategoryCard(
              category: context.watch<CategoryProvider>().categories[index],
            ),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, crossAxisSpacing: 12, mainAxisSpacing: 12
                // childAspectRatio: MediaQuery.of(context).size.width /
                //     (MediaQuery.of(context).size.height),
                ),
          ),
        ),
      ),
    );
  }
}
