import 'package:flutter/material.dart';
import 'package:flutter_template/src/app_navigator.dart';
import 'package:flutter_template/src/constants/app_data.dart';
import 'package:flutter_template/src/features/auth/services/user_service.dart';
import 'package:flutter_template/src/features/auth/ui/auth_form_buttons.dart';
import 'package:flutter_template/src/features/auth/ui/title_widget.dart';
import 'package:flutter_template/src/providers/auth_provider.dart';
import 'package:flutter_template/src/ui/widgets/app_checkbox.dart';
import 'package:flutter_template/src/ui/widgets/app_text_field.dart';
import 'package:flutter_template/src/ui/widgets/app_text_field_password.dart';
import 'package:flutter_template/src/ui/widgets/app_v_space.dart';
import 'package:flutter_template/src/utils/check_fields.dart';
import 'package:flutter_template/src/utils/logger.dart';
import 'package:flutter_template/src/utils/timer.dart';

import '../services/auth_service.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _email = TextEditingController();
  final _password = TextEditingController();

  bool _rememberMe = false;
  bool _submitting = false;
  String _error = '';

  @override
  void initState() {
    super.initState();
    if (AppData.dev) {
      test();
    }
  }

  void test() {
    _email.text = 'ahmnouira@gmail.com';
    _password.text = '123456';
  }

  void _finish() {
    _email.clear();
    _password.clear();
    setState(() {
      _error = '';
      _submitting = false;
    });
  }

  Future<void> _onSubmit() async {
    setState(() {
      _submitting = true;
      _error = '';
    });

    final String error = checkAuthFields(_email.text, _password.text);
    if (error.isNotEmpty) {
      setState(() {
        _error = error;
        _submitting = false;
      });

      return;
    }

    final authService = AuthService();
    final userService = UserService();
    try {
      final firebaseUser = await authService.login(_email.text, _password.text);
      if (firebaseUser == null) {
        return;
      }

      final user = await userService.get(firebaseUser.uid); // uid here
      if (user.hasAccessAdmin) {
        wait(() async {
          final provider = AppAuthProvider.of(context);
          await provider.login(user);
        });
        wait(
          () async {
            AppNavigator.mainTab(context);
          },
        );
      } else {
        wait(
          () {
            AppNavigator.requestAccess(context, uid: firebaseUser.uid);
          },
        );
      }
      _finish();
      /* } 
     on FirebaseAuthException catch (error) {
      setState(() {
        _error = authService.handleFirebaseAuthExceptions(error);
        _submitting = false;
      });
    */
    } catch (e) {
      Logger.error(e);
      setState(() {
        _error = authService.handleError(e);
        _submitting = false;
      });
    }
  }

  Future<void> _google() async {
    // final service = AuthGoogleService();
    // service.login();
    _finish();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const TitleWidget(
          text: 'Bienvenue',
        ),
        AppTextField.email(
          onChanged: (value) {
            _email.text = value;
          },
        ),
        AppTextFieldPassword(
          onChange: (value) {
            _password.text = value;
          },
        ),
        const AppVSpace(),
        AppCheckbox(
          text: 'Remember me',
          value: _rememberMe,
          onChanged: (value) {
            setState(() {
              _rememberMe = value;
            });
          },
        ),
        const AppVSpace(),
        AuthFormButtons(
          isLogin: true,
          error: _error,
          onSubmit: _onSubmit,
          google: _google,
          submitting: _submitting,
        ),
      ],
    );
  }
}
