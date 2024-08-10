import 'package:flutter/material.dart';
import 'package:eco_pat/src/theme/app_sizes.dart';

import 'app_text.dart';

enum AppResultType { empty, error }

class AppResult extends StatelessWidget {
  final String? text;
  final AppResultType type;
  const AppResult({super.key, required this.type, this.text});

  @override
  Widget build(BuildContext context) {
    final isError = type == AppResultType.error;

    return Align(
      alignment: Alignment.topCenter,
      child: Padding(
        padding: const EdgeInsets.only(top: AppSizes.xxxl * 2),
        child: AppText.v18(
          text: text ?? (isError ? 'There is an error!' : 'Not Found'),
          color: isError ? Colors.redAccent : Colors.black,
        ),
      ),
    );
  }
}
