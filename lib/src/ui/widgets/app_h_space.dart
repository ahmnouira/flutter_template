import 'package:flutter/material.dart';

class AppHSpace extends StatelessWidget {
  final double? width;

  const AppHSpace({super.key, this.width = 16});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
    );
  }
}
