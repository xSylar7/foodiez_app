import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:go_router/go_router.dart';

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
    );
  }
}
