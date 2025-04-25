import 'package:flutter/material.dart';
import 'package:flutter_template/src/ui/widgets/app_form_widget.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const AppFormWidget(
      name: AppFormName.register,
    );
  }
}
