import 'package:flutter/material.dart';
import 'package:flutter_template/src/theme/app_sizes.dart';

class AppButton extends StatelessWidget {
  final String text;

  final void Function()? onPressed;

  const AppButton({
    super.key,
    required this.text,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: AppSizes.md),
      child: ElevatedButton(
        onPressed: onPressed,
        clipBehavior: Clip.antiAlias,
        child: Text(
          text,
          style: const TextStyle(fontSize: AppSizes.md),
        ),
      ),
    );
  }
}
