import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:eco_pat/src/theme/app_colors.dart';
import 'package:eco_pat/src/theme/app_sizes.dart';

class AppTextFieldBase extends StatelessWidget {
  final TextEditingController controller;
  final String? placeholder;
  final bool obscureText;
  final void Function(String)? onChanged;
  final void Function()? onTap;
  final TextInputType? keyboardType;
  final String? label;
  final bool textarea;
  final Widget? suffixIcon;

  const AppTextFieldBase({
    super.key,
    required this.controller,
    this.placeholder,
    this.onChanged,
    this.obscureText = false,
    this.textarea = false,
    this.keyboardType = TextInputType.text,
    this.label,
    this.onTap,
    this.suffixIcon,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      readOnly: true,
      cursorColor: AppColors.textField,
      onTap: onTap,
      decoration: InputDecoration(
        hintText: placeholder ?? label,
        hintStyle: GoogleFonts.urbanist(
          fontSize: 18.0,
          fontWeight: FontWeight.w500,
          color: controller.text.isNotEmpty
              ? Colors.black
              : Colors.black.withOpacity(0.5),
        ),
        fillColor: AppColors.textField,
        filled: true,
        suffixIcon: suffixIcon,
        border: const OutlineInputBorder(
          borderSide: BorderSide(
            color: AppColors.textFieldBorder,
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(AppSizes.xs),
          ),
        ),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: AppColors.textFieldBorder,
          ),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: AppColors.textFieldBorder,
          ),
        ),
      ),
      style: GoogleFonts.urbanist(
        fontSize: 18.0,
        fontWeight: FontWeight.w500,
        color: AppColors.black,
      ),
    );
  }
}
