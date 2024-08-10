import 'package:flutter/material.dart';
import 'package:eco_pat/src/ui/widgets/app_text_field.dart';

class AppTextFieldPassword extends StatefulWidget {
  final Function(String value) onChange;
  final bool showLabel;

  const AppTextFieldPassword({
    super.key,
    required this.onChange,
    this.showLabel = true,
  });

  @override
  State<AppTextFieldPassword> createState() => _AppTextFieldPasswordState();
}

class _AppTextFieldPasswordState extends State<AppTextFieldPassword> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return AppTextField.password(
      onChanged: widget.onChange,
      obscureText: _obscureText,
      label: widget.showLabel ? 'Mot de passe' : null,
      onVisible: () {
        setState(() {
          _obscureText = !_obscureText;
        });
      },
    );
  }
}
