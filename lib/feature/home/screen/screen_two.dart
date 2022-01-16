import 'package:flutter/material.dart';

class ScreenTwo extends StatelessWidget {
  static const routeName = "ScreenTwo";
  const ScreenTwo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text("ScreenTwo"),),
    );
  }
}
