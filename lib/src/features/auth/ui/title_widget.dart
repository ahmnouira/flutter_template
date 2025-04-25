import 'package:flutter/material.dart';
import 'package:flutter_template/src/theme/app_colors.dart';
import 'package:flutter_template/src/theme/app_sizes.dart';
import 'package:flutter_template/src/ui/widgets/app_text.dart';

class TitleWidget extends StatelessWidget {
  final String text;
  final double topMargin;
  final Color color;
  final String? subtitle;

  const TitleWidget({
    super.key,
    required this.text,
    this.topMargin = AppSizes.md,
    this.color = Colors.black,
    this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppText.v30(
          padding: EdgeInsets.only(top: topMargin),
          text: text,
          textAlign: TextAlign.left,
          letterSpacing: -1,
          maxLines: null,
        ),
        if (subtitle != null)
          AppText.v15(
            text: subtitle!,
            color: AppColors.grey,
            letterSpacing: 0.03,
            maxLines: null,
            padding: const EdgeInsets.only(top: AppSizes.xs),
          ),
      ],
    );
  }
}
