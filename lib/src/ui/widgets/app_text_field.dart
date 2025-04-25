import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_template/src/theme/app_colors.dart';
import 'package:flutter_template/src/theme/app_sizes.dart';
import 'package:flutter_template/src/ui/widgets/app_text.dart';

class AppTextField extends StatelessWidget {
  final TextEditingController? controller;
  final String? placeholder;
  final bool obscureText;
  final void Function(String)? onChanged;
  final TextInputType? keyboardType;
  final String? label;
  final void Function()? onVisible;
  final bool textarea;
  final bool highlight;
  final bool? enabled;
  final int? textareaLines;

  const AppTextField({
    super.key,
    this.placeholder,
    this.controller,
    this.onChanged,
    this.obscureText = false,
    this.textarea = false,
    this.keyboardType = TextInputType.text,
    this.label,
    this.onVisible,
    this.highlight = false,
    this.enabled = true,
    this.textareaLines,
  });

  const AppTextField.textarea({
    super.key,
    this.placeholder,
    this.controller,
    this.label,
    this.obscureText = false,
    this.highlight = false,
    this.textarea = true,
    this.onChanged,
    this.onVisible,
    this.keyboardType,
    this.enabled,
    this.textareaLines = 4,
  });

  const AppTextField.email({
    super.key,
    this.placeholder = 'Entrez votre email',
    this.controller,
    this.label = 'Email',
    this.obscureText = false,
    this.textarea = false,
    this.highlight = false,
    this.onChanged,
    this.onVisible,
    this.keyboardType = TextInputType.emailAddress,
    this.enabled,
    this.textareaLines,
  });

  const AppTextField.password({
    super.key,
    this.placeholder = 'Entrez votre mot de passe',
    this.controller,
    this.label = 'Mot de passe',
    this.obscureText = true,
    this.textarea = false,
    this.highlight = false,
    this.onChanged,
    this.onVisible,
    this.keyboardType = TextInputType.visiblePassword,
    this.enabled,
    this.textareaLines,
  });

  const AppTextField.number({
    super.key,
    this.controller,
    this.label,
    this.textarea = false,
    this.highlight = false,
    this.onChanged,
    this.onVisible,
    this.keyboardType = TextInputType.number,
    this.enabled,
    this.textareaLines,
    this.placeholder,
    this.obscureText = false,
  });

  @override
  Widget build(BuildContext context) {
    final isNumber = keyboardType == TextInputType.number;

    return Padding(
      padding: const EdgeInsets.only(top: AppSizes.md),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (label != null && label!.isNotEmpty)
            AppText.v16(
              text: label!,
              padding: const EdgeInsets.only(bottom: AppSizes.xs),
            ),
          TextField(
            enabled: enabled,
            onTapOutside: (event) {
              FocusScope.of(context).unfocus();
            },
            inputFormatters:
                isNumber ? [FilteringTextInputFormatter.digitsOnly] : [],
            maxLines: textarea ? textareaLines : 1,
            controller: controller,
            cursorColor: highlight ? AppColors.primary : AppColors.black,
            decoration: InputDecoration(
              hintText: placeholder ?? label,
              hintStyle: GoogleFonts.urbanist(
                fontSize: highlight ? 21 : 18.0,
                fontWeight: highlight ? FontWeight.w900 : FontWeight.w500,
                color: highlight
                    ? AppColors.primary
                    : Colors.black.withOpacity(0.5),
              ),
              fillColor: AppColors.textField,
              filled: true,
              suffixIcon: onVisible == null
                  ? null
                  : InkWell(
                      onTap: onVisible,
                      child: Icon(
                        obscureText ? Icons.visibility : Icons.visibility_off,
                        color: Colors.black54,
                      ),
                    ),
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
              disabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide(
                color: AppColors.textFieldBorder,
              )),
            ),
            keyboardType: keyboardType,
            obscureText: obscureText,
            onChanged: onChanged,
            style: GoogleFonts.urbanist(
              fontSize: highlight ? 21 : 18.0,
              fontWeight: highlight ? FontWeight.w900 : FontWeight.w500,
              color: highlight ? AppColors.primary : AppColors.black,
            ),
          ),
        ],
      ),
    );
  }
}
