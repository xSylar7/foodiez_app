import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
      body: SafeArea(
        child: Center(
          child: Form(
            key: formKey,
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

                Spacer(),
                ElevatedButton(
                  onPressed: () async {
                    if (formKey.currentState!.validate()) {
                      var didSignup = await context
                          .read<AuthProvider>()
                          .register(
                              username: usernameController.text,
                              password: passwordController.text);
                      if (didSignup) {
                        context.go("/");
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            backgroundColor: Colors.red,
                            content: Text("Sign up not successful")));
                      }
                    } else {
                      print("form not valid");
                    }
                  },
                  child: Text("Register"),
                ),

                // Padding(
                //   padding: const EdgeInsets.only(top: 50),
                //   child: CupertinoButton.filled(
                //     child: Text("Register"),
                //     onPressed: () {},
                //   ),
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
