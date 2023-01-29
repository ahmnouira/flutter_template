import 'package:flutter/material.dart';
import 'package:flutter_better_player_example/src/theme/breakpoint.dart';

enum TextWidgetVariant { text, error }

class TextWidget extends StatelessWidget {
  final String text;
  final TextWidgetVariant? variant;

  const TextWidget({
    super.key,
    required this.text,
    this.variant = TextWidgetVariant.text,
  });

  @override
  Widget build(BuildContext context) {
    final isError = variant == TextWidgetVariant.error;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: Breakpoint.xs),
      child: Text(
        text,
        style: TextStyle(
          color: isError ? Colors.red : Colors.black,
          fontWeight: isError ? FontWeight.bold : FontWeight.normal,
          fontSize: 18,
        ),
      ),
    );
  }
}
