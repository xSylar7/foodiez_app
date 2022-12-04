import 'package:flutter/material.dart';
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
