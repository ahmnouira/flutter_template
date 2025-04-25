import 'package:flutter/material.dart';
import 'package:flutter_template/src/theme/app_colors.dart';
import 'package:flutter_template/src/theme/app_sizes.dart';
import 'package:flutter_template/src/ui/widgets/app_h_space.dart';
import 'package:flutter_template/src/ui/widgets/app_text.dart';

class OptionsWidget extends StatelessWidget {
  const OptionsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: AppSizes.lg,
      ),
      child: Row(children: [
        Expanded(
          child: Container(
            height: 1,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.white,
                  AppColors.primary,
                ],
              ),
            ),
          ),
        ),
        const AppHSpace(
          width: AppSizes.xs,
        ),
        const AppText.v18(
          text: 'Ou',
          color: AppColors.black2,
        ),
        const AppHSpace(
          width: AppSizes.xs,
        ),
        Expanded(
          child: Container(
            height: 1,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  AppColors.primary,
                  Colors.white,
                ],
              ),
            ),
          ),
        ),
      ]),
    );
  }
}
