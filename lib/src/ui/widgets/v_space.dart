import 'package:flutter/material.dart';

class VSpace extends StatelessWidget {
  final double? height;

  const VSpace({super.key, this.height = 16});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
    );
  }
}
