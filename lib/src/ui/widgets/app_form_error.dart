import 'package:flutter/material.dart';
import 'package:flutter_template/src/ui/widgets/app_text.dart';

class AppFormError extends StatelessWidget {
  final String? error;

  const AppFormError({super.key, required this.error});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [AppText.error(text: error!)],
    );
  }
}
