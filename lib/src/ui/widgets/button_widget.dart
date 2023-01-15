import 'package:flutter/material.dart';
import 'package:flutter_template/src/theme/breakpoint.dart';

class ButtonWidget extends StatelessWidget {
  final String text;

  final void Function()? onPressed;

  const ButtonWidget({
    super.key,
    required this.text,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: Breakpoint.md),
      child: ElevatedButton(
        onPressed: onPressed,
        clipBehavior: Clip.antiAlias,
        child: Text(
          text,
          style: const TextStyle(fontSize: Breakpoint.md),
        ),
      ),
    );
  }
}
