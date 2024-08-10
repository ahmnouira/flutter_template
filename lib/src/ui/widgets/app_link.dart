import 'package:flutter/material.dart';
import 'package:eco_pat/src/theme/app_sizes.dart';
import 'package:eco_pat/src/ui/widgets/app_text.dart';

class AppLink extends StatelessWidget {
  final void Function()? onPressed;
  final String text;
  final Color? color;
  final FontWeight? fontWeight;
  final bool big;
  const AppLink({
    super.key,
    required this.text,
    this.color,
    this.onPressed,
    this.fontWeight,
    this.big = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: AppSizes.xss),
      child: InkWell(
        onTap: onPressed,
        child: big
            ? AppText.v20(
                text: text,
                color: color,
                fontWeight: fontWeight,
              )
            : AppText.v15(
                text: text,
                color: color,
                fontWeight: fontWeight,
              ),
      ),
    );
  }
}
