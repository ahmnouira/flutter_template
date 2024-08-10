import 'package:flutter/material.dart';
import 'package:eco_pat/src/theme/app_sizes.dart';
import 'package:eco_pat/src/ui/widgets/app_text.dart';

class AppFormError extends StatelessWidget {
  final String? error;

  const AppFormError({super.key, required this.error});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppText.error(
          text: error!,
          padding: const EdgeInsets.only(bottom: AppSizes.md),
        ),
      ],
    );
  }
}
