import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_foodiez_app/providers/auth_provider.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class LoginPage extends StatelessWidget {
  LoginPage({super.key});
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  var formKey = GlobalKey<FormState>();
// context.read<AuthProvider>().register
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: (context.watch<AuthProvider>().username != null)
            ? Text("My Profile")
            : Text("Login"),
      ),
      //context.read<AuthProvider>().hasToken() == true
      body: (context.watch<AuthProvider>().username != null)
          ? Container(
              child: Center(
              child: CupertinoButton.filled(
                child: Text("Logout"),
                onPressed: () {
                  context.read<AuthProvider>().logout();
                },
              ),
            ))
          : Center(
              child: Form(
                key: formKey,
                child: Column(
                  children: [
                    SizedBox(
                      height: 200,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 22.0),
                      child: TextFormField(
                          controller: usernameController,
                          decoration: InputDecoration(hintText: 'Username'),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Required field'; // || means or
                            }
                          }),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 22.0),
                      child: TextFormField(
                          controller: passwordController,
                          obscureText: true,
                          decoration: InputDecoration(hintText: 'Password'),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Required field'; // || means or
                            }
                            return null;
                          }),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 50),
                      child: CupertinoButton.filled(
                        child: Text("Login"),
                        onPressed: () async {
                          if (formKey.currentState!.validate()) {
                            var didlogin = await context
                                .read<AuthProvider>()
                                .login(
                                    username: usernameController.text,
                                    password: passwordController.text);
                            if (didlogin) {
                              context.pop();
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                      backgroundColor: Colors.red,
                                      content: Text("Login not successful")));
                            }
                          } else {
                            print("form not valid");
                          }
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      child: CupertinoButton(
                        child: Text("Register"),
                        onPressed: () {
                          context.replace('/register');
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}
