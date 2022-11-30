import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class RegisterPage extends StatelessWidget {
  RegisterPage({super.key});
  final usernameController = TextEditingController();
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Register"),
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: 100,
            ),
            TextFormField(
                controller: usernameController,
                decoration: InputDecoration(hintText: 'Username'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Required field'; // || means or
                  }
                }),
            TextFormField(
                controller: passwordController,
                obscureText: true,
                decoration: InputDecoration(hintText: 'Password'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Required field'; // || means or
                  }
                  return null;
                }),
            TextFormField(
                controller: firstNameController,
                decoration: InputDecoration(hintText: 'First Name'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Required field'; // || means or
                  }
                }),
            TextFormField(
                controller: lastNameController,
                decoration: InputDecoration(hintText: 'Last Name'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Required field'; // || means or
                  }
                }),
            Padding(
              padding: const EdgeInsets.only(top: 50),
              child: CupertinoButton.filled(
                child: Text("Register"),
                onPressed: () {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}
