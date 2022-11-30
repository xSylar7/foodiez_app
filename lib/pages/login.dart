import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:go_router/go_router.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});
  final usernameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login"),
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: 200,
            ),
            TextFormField(),
            TextFormField(),
            Padding(
              padding: const EdgeInsets.only(top: 50),
              child: CupertinoButton.filled(
                child: Text("Login"),
                onPressed: () {},
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: CupertinoButton(
                child: Text("Register"),
                onPressed: () {
                  context.push('/register');
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
