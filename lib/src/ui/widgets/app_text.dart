import 'package:flutter_template/src/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
  final double? letterSpacing;
  final double? height;

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
    this.letterSpacing,
    this.padding = const EdgeInsets.all(0),
    this.height,
  });

  const AppText.error({
    super.key,
    required this.text,
    this.fontSize = 15,
    this.color = AppColors.error,
    this.fontWeight = FontWeight.w600,
    this.textAlign = TextAlign.center,
    this.maxLines,
    this.softWrap,
    this.overflow,
    this.decorationStyle,
    this.decoration,
    this.letterSpacing,
    this.padding = const EdgeInsets.all(0),
    this.height,
  });

  const AppText.v15({
    super.key,
    required this.text,
    this.fontSize = 15,
    this.color = Colors.black,
    this.fontWeight = FontWeight.w500,
    this.textAlign = TextAlign.start,
    this.maxLines = 1,
    this.softWrap,
    this.overflow,
    this.decoration,
    this.decorationStyle,
    this.letterSpacing = 1,
    this.padding = const EdgeInsets.all(0),
    this.height,
  });

  const AppText.v14({
    super.key,
    required this.text,
    this.fontSize = 14,
    this.color = AppColors.black,
    this.fontWeight = FontWeight.w600,
    this.textAlign = TextAlign.start,
    this.maxLines = 1,
    this.softWrap,
    this.overflow,
    this.decoration,
    this.decorationStyle,
    this.letterSpacing,
    this.padding = const EdgeInsets.all(0),
    this.height,
  });

  const AppText.v16({
    super.key,
    required this.text,
    this.fontSize = 16,
    this.color = AppColors.black,
    this.fontWeight = FontWeight.w600,
    this.textAlign = TextAlign.start,
    this.maxLines = 1,
    this.softWrap,
    this.overflow,
    this.decoration,
    this.decorationStyle,
    this.letterSpacing,
    this.padding = const EdgeInsets.all(0),
    this.height,
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
    this.letterSpacing,
    this.padding = const EdgeInsets.all(0),
    this.height,
  });

  const AppText.v20({
    super.key,
    required this.text,
    this.fontSize = 20,
    this.color = AppColors.primary,
    this.fontWeight = FontWeight.w600,
    this.textAlign = TextAlign.start,
    this.maxLines = 50,
    this.softWrap,
    this.overflow,
    this.decoration,
    this.decorationStyle,
    this.letterSpacing = 1.0,
    this.padding = const EdgeInsets.all(0),
    this.height,
  });

  const AppText.v23({
    super.key,
    required this.text,
    this.fontSize = 23,
    this.color = Colors.black,
    this.fontWeight = FontWeight.w600,
    this.textAlign = TextAlign.start,
    this.maxLines = 1,
    this.softWrap,
    this.overflow,
    this.decoration,
    this.decorationStyle,
    this.letterSpacing = 0.05,
    this.padding = const EdgeInsets.all(0),
    this.height,
  });

  const AppText.v30({
    super.key,
    required this.text,
    this.fontSize = 30,
    this.color = AppColors.black,
    this.fontWeight = FontWeight.w700,
    this.textAlign = TextAlign.start,
    this.maxLines = 50,
    this.softWrap,
    this.overflow,
    this.decoration,
    this.decorationStyle,
    this.letterSpacing,
    this.padding = const EdgeInsets.all(0),
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: Text(
        text,
        softWrap: softWrap,
        overflow: overflow,
        style: GoogleFonts.urbanist(
          fontWeight: fontWeight,
          fontSize: fontSize,
          color: color,
          decoration: decoration,
          decorationStyle: decorationStyle,
          letterSpacing: letterSpacing,
          height: height,
        ),
        maxLines: maxLines,
        textAlign: textAlign,
      ),
    );
  }
}
