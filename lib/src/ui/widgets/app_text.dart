import 'package:flutter/material.dart';
import 'package:flutter_template/src/theme/app_colors.dart';

class AppText extends StatelessWidget {
  final String text;
  final double? fontSize;

  final Color? color;

  final FontWeight? fontWeight;

  final int? maxLines;

  final TextAlign? textAlign;

  final TextDecoration? decoration;

  final bool? softWrap;
  final TextOverflow? overflow;

  final TextDecorationStyle? decorationStyle;

  const AppText({
    super.key,
    required this.text,
    this.color,
    this.fontWeight,
    this.textAlign,
    this.maxLines = 1,
    this.softWrap,
    this.overflow,
    this.fontSize,
    this.decorationStyle,
    this.decoration,
  });

  const AppText.error({
    super.key,
    required this.text,
    this.fontSize = 14,
    this.color = AppColors.primary,
    this.fontWeight = FontWeight.bold,
    this.textAlign = TextAlign.center,
    this.maxLines = 1,
    this.softWrap,
    this.overflow,
    this.decorationStyle,
    this.decoration,
  });

  const AppText.v14({
    super.key,
    required this.text,
    this.fontSize = 14,
    this.color = Colors.black,
    this.fontWeight = FontWeight.bold,
    this.textAlign = TextAlign.center,
    this.maxLines = 1,
    this.softWrap,
    this.overflow,
    this.decoration,
    this.decorationStyle,
  });

  const AppText.v16({
    super.key,
    required this.text,
    this.fontSize = 16,
    this.color = AppColors.primary,
    this.fontWeight = FontWeight.bold,
    this.textAlign = TextAlign.center,
    this.maxLines = 1,
    this.softWrap,
    this.overflow,
    this.decoration,
    this.decorationStyle,
  });

  const AppText.v18({
    super.key,
    required this.text,
    this.fontSize = 18,
    this.color = AppColors.primary,
    this.fontWeight = FontWeight.bold,
    this.textAlign = TextAlign.start,
    this.maxLines = 2,
    this.softWrap,
    this.overflow,
    this.decoration,
    this.decorationStyle,
  });

  const AppText.v22({
    super.key,
    required this.text,
    this.fontSize = 22,
    this.color = AppColors.primary,
    this.fontWeight = FontWeight.w600,
    this.textAlign = TextAlign.start,
    this.maxLines = 50,
    this.softWrap,
    this.overflow,
    this.decoration,
    this.decorationStyle,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      softWrap: softWrap,
      overflow: overflow,
      style: TextStyle(
        fontWeight: fontWeight,
        fontSize: fontSize,
        color: color,
        decoration: decoration,
        decorationStyle: decorationStyle,
      ),
      maxLines: maxLines,
      textAlign: textAlign,
    );
  }
}
