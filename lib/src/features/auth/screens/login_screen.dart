import 'package:flutter/material.dart';
import 'package:flutter_template/src/ui/widgets/app_form_widget.dart'
    show AppFormName, AppFormWidget;

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const AppFormWidget(
      name: AppFormName.login,
    );
  }
}
