import 'package:flutter/material.dart';
import 'package:flutter_template/src/theme/app_sizes.dart';
import 'package:flutter_template/src/ui/widgets/app_text.dart';

class AppTextField extends StatelessWidget {
  final String placeholder;
  final bool obscureText;
  final void Function(String)? onChanged;
  final TextInputType? keyboardType;
  final String? label;

  const AppTextField({
    super.key,
    required this.placeholder,
    this.onChanged,
    this.obscureText = false,
    this.keyboardType = TextInputType.text,
    this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (label != null) AppText(text: label!),
        TextField(
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
        ),
      ],
    );
  }
}
