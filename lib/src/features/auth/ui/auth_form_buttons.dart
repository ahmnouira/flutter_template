import 'package:flutter/material.dart';
import 'package:flutter_template/src/ui/widgets/app_button.dart';
import 'package:flutter_template/src/ui/widgets/app_form_error.dart';

class AuthFormButtons extends StatelessWidget {
  final String error;
  final bool isLogin;
  final bool submitting;
  final String? label;
  final void Function() onSubmit;
  final void Function()? google;

  const AuthFormButtons({
    super.key,
    required this.error,
    required this.onSubmit,
    required this.submitting,
    this.isLogin = false,
    this.label,
    this.google,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (error.isNotEmpty) AppFormError(error: error),
        AppButton(
          text: label ?? (isLogin ? 'Login' : 'Register'),
          onPressed: submitting ? null : onSubmit,
          loading: submitting,
        ),
      ],
    );
  }
}
