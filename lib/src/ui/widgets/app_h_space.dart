import 'package:flutter/material.dart';
import 'package:flutter_template/src/theme/app_sizes.dart';

class AppHSpace extends StatelessWidget {
  final double? width;

  const AppHSpace({super.key, this.width = AppSizes.md});

  const AppHSpace.x2({super.key, this.width = AppSizes.xxxl});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
    );
  }
}
