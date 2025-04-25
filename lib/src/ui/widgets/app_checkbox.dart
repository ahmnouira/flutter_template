import 'package:flutter/material.dart';
import 'package:flutter_template/src/theme/app_colors.dart';
import 'package:flutter_template/src/ui/widgets/app_text.dart';

class AppCheckbox extends StatelessWidget {
  final String text;
  final Widget? child;
  final bool? value;
  final void Function(bool value) onChanged;

  const AppCheckbox({
    super.key,
    required this.value,
    required this.onChanged,
    this.text = '',
    this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(
          value: value,
          activeColor: AppColors.primary,
          fillColor: !value!
              ? const WidgetStatePropertyAll(Colors.white)
              : const WidgetStatePropertyAll(AppColors.primary),
          checkColor: Colors.white,
          focusColor: Colors.white,
          side: const BorderSide(color: AppColors.checkboxBorder),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(5)),
          ),
          onChanged: (value) {
            if (value != null) {
              onChanged(value);
            }
          },
        ),
        if (child != null)
          child!
        else
          AppText.v15(
            text: text,
            fontWeight: FontWeight.w600,
            color: AppColors.checkboxText,
          ),
      ],
    );
  }
}
