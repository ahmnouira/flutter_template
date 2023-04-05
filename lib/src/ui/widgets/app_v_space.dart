import 'package:flutter/material.dart';

class AppVSpace extends StatelessWidget {
  final double? height;

  const AppVSpace({super.key, this.height = 16});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
    );
  }
}
