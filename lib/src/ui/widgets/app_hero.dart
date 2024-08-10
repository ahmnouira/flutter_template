import 'package:flutter/material.dart';
import 'package:eco_pat/src/assets/assets.dart';
import 'package:eco_pat/src/ui/widgets/app_image.dart';

class AppHero extends StatelessWidget {
  final String image;
  final String tag;
  final double? height;
  final double? width;

  const AppHero({
    super.key,
    this.tag = 'logo',
    this.image = Assets.logo,
    this.height = 140,
    this.width = 140,
  });

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: tag,
      child: AppImage(
        image: image,
        height: height,
        width: width,
      ),
    );
  }
}
