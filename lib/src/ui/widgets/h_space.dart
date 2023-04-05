import 'package:flutter/material.dart';

class HSpace extends StatelessWidget {
  final double? width;

  const HSpace({super.key, this.width = 16});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
    );
  }
}
