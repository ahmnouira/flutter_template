import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AppSvg extends StatelessWidget {
  final String path;
  final Color color;

  final String? label;

  const AppSvg({
    super.key,
    required this.path,
    this.label,
    this.color = const Color(0xFF000000),
  });

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      path,
      semanticsLabel: label,
      theme: SvgTheme(currentColor: color),
      height: 15,
      width: 15,
    );
  }
}
