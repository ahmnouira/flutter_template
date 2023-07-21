import 'package:flutter/material.dart';
import 'package:flutter_template/src/theme/app_sizes.dart';

class AppVSpace extends StatelessWidget {
  final double? height;

  const AppVSpace({super.key, this.height = AppSizes.md});

  const AppVSpace.x2({super.key, this.height = AppSizes.xxxl});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
    );
  }
}
