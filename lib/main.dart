import 'package:flutter/material.dart';
import 'package:flutter_foodiez_app/models/recipe_models.dart';
import 'package:flutter_foodiez_app/pages/create_category_page.dart';
import 'package:flutter_foodiez_app/pages/create_ingredient_page.dart';
import 'package:flutter_foodiez_app/pages/create_recipe_page.dart';
import 'package:flutter_foodiez_app/pages/my_recipes_page.dart';
import 'package:flutter_foodiez_app/pages/recipe_detail.dart';
import 'package:flutter_foodiez_app/pages/recipes_page.dart';
import 'package:flutter_foodiez_app/providers/ingredient_provider.dart';
import 'package:flutter_foodiez_app/providers/my_recipe_provider.dart';
import 'package:flutter_foodiez_app/providers/recipe_provider.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import 'package:flutter_foodiez_app/pages/home_page.dart';
import 'package:flutter_foodiez_app/pages/login.dart';
import 'package:flutter_foodiez_app/pages/register_page.dart';
import 'package:flutter_foodiez_app/providers/auth_provider.dart';
import 'package:flutter_foodiez_app/providers/category_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  var authProvider = AuthProvider();

  // var isAuth = await authProvider.hasToken();
  await authProvider.hasToken();

  runApp(MyApp(
    authProvider: authProvider,
  ));
}

final router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => HomePage(),
    ),
    GoRoute(
      path: '/login',
      builder: (context, state) => LoginPage(),
    ),
    GoRoute(
      path: '/register',
      builder: (context, state) => RegisterPage(),
    ),
    GoRoute(
      path: '/recipes',
      builder: (context, state) => RecipesListPage(),
    ),
    GoRoute(
      path: '/create_recipe',
      builder: (context, state) => CreateRecipe(),
    ),
    GoRoute(
      path: '/my_recipes',
      builder: (context, state) => MyRecipesListPage(),
    ),
    GoRoute(
      path: '/recipe_detail',
      builder: (context, state) => RecipeDetail(
        recipe: state.extra as Recipe,
      ),
    ),
    GoRoute(
      path: '/create_category',
      builder: (context, state) => CreateCategory(),
    ),
    GoRoute(
      path: '/create_ingredient',
      builder: (context, state) => CreatIngredientPage(),
    ),
  ],
);

class MyApp extends StatelessWidget {
  const MyApp({
    Key? key,
    required this.authProvider,
  }) : super(key: key);

  final AuthProvider authProvider;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => CategoryProvider()),
        ChangeNotifierProvider(create: (context) => RecipeProvider()),
        ChangeNotifierProvider(create: (context) => MyRecipeProvider()),
        ChangeNotifierProvider(create: (context) => IngredientProvider()),
        ChangeNotifierProvider(create: (context) => authProvider),
      ],
      child: MaterialApp.router(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.red,
        ),
        debugShowCheckedModeBanner: false,
        routerConfig: router,
      ),
    );
  }
}
