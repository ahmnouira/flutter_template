import 'package:flutter/material.dart';
import 'package:flutter_template/src/theme/app_sizes.dart';

class AppTextField extends StatelessWidget {
  final String placeholder;
  final bool obscureText;
  final void Function(String)? onChanged;
  final TextInputType? keyboardType;

  const AppTextField({
    super.key,
    required this.placeholder,
    this.onChanged,
    this.obscureText = false,
    this.keyboardType = TextInputType.text,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        hintText: placeholder,
      ),
      keyboardType: keyboardType,
      obscureText: obscureText,
      onChanged: onChanged,
      style: const TextStyle(
        fontSize: AppSizes.md,
        color: Colors.white,
      ),
    );
  }
}
