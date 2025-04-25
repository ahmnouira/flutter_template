import 'package:flutter/material.dart';
import 'package:flutter_template/src/theme/app_sizes.dart';

class AppVSpace extends StatelessWidget {
  final double? height;

  const AppVSpace({super.key, this.height = AppSizes.md});
  const AppVSpace.lg({super.key, this.height = AppSizes.lg});
  const AppVSpace.xl({super.key, this.height = AppSizes.xl});
  const AppVSpace.xxl({super.key, this.height = AppSizes.xxl});
  const AppVSpace.x2({super.key, this.height = AppSizes.xxxl});
  const AppVSpace.x3({super.key, this.height = AppSizes.xxxl + AppSizes.xxl});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
    );
  }
}
