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
  final EdgeInsetsGeometry padding;

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
    this.padding = const EdgeInsets.all(0),
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
    this.padding = const EdgeInsets.all(0),
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
    this.padding = const EdgeInsets.all(0),
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
    this.padding = const EdgeInsets.all(0),
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
    this.padding = const EdgeInsets.all(0),
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
    this.padding = const EdgeInsets.all(0),
  });

  const AppText.subtitle({
    super.key,
    required this.text,
    this.fontSize = 15,
    this.color = AppColors.primary,
    this.fontWeight = FontWeight.w600,
    this.textAlign = TextAlign.start,
    this.maxLines = 50,
    this.softWrap,
    this.overflow,
    this.decoration,
    this.decorationStyle,
    this.padding = const EdgeInsets.all(0),
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: Text(
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
      ),
    );
  }
}
