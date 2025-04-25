import 'package:flutter_template/src/assets/assets.dart';
import 'package:flutter_template/src/theme/app_sizes.dart';
import 'package:flutter_template/src/ui/widgets/app_hero.dart';
import 'package:flutter/material.dart';

import 'app_text.dart';

enum AppResultType { empty, error }

class AppResult extends StatelessWidget {
  final String? text;
  final AppResultType type;
  const AppResult({super.key, required this.type, this.text});

  @override
  Widget build(BuildContext context) {
    final isError = type == AppResultType.error;
    final isEmpty = type == AppResultType.empty;

    return Padding(
      padding: const EdgeInsets.only(top: AppSizes.md),
      child: isEmpty
          ? const AppHero(
              height: 300,
              image: Assets.grassIcon,
              width: double.infinity,
            )
          : AppText.v18(
              text: text ?? (isError ? 'There is an error!' : 'Not Found'),
              color: isError ? Colors.redAccent : Colors.black,
            ),
    );
  }
}
