import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_foodiez_app/pages/home_page.dart';
import 'package:flutter_foodiez_app/pages/login.dart';
import 'package:flutter_foodiez_app/pages/register_page.dart';
import 'package:go_router/go_router.dart';

void main() {
  runApp(const MyApp());
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
  ],
);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      debugShowCheckedModeBanner: false,
      routerConfig: router,
    );
  }
}
