import 'package:flutter/material.dart';
import 'package:flutter_template/src/assets/assets.dart';

class AppImage extends StatelessWidget {
  final String image;
  final double? height;
  final double? width;

  const AppImage({
    super.key,
    this.image = Assets.logo,
    this.height = 140,
    this.width = 140,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: Image.asset(
        image,
        fit: BoxFit.contain,
      ),
    );
  }
}
