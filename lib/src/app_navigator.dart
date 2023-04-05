import 'package:flutter/material.dart';

class AppNavigator {
  const AppNavigator();

  static void to(BuildContext context, Widget page) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (BuildContext context) => page,
      ),
    );
  }

  static void back(BuildContext context) {
    Navigator.pop(context);
  }

  static void replace(BuildContext context, Widget page) {
    Navigator.of(context)
        .pushReplacement(MaterialPageRoute(builder: (context) => page));
  }

  // TODO: Add screens
}
