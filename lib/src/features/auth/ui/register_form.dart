import 'package:flutter/material.dart';
import 'package:flutter_template/src/app_navigator.dart';
import 'package:flutter_template/src/constants/app_data.dart';
import 'package:flutter_template/src/features/auth/services/auth_service.dart';
import 'package:flutter_template/src/features/auth/services/user_service.dart';
import 'package:flutter_template/src/features/auth/ui/auth_form_buttons.dart';
import 'package:flutter_template/src/features/auth/ui/terms_widget.dart';
import 'package:flutter_template/src/features/auth/ui/title_widget.dart';
import 'package:flutter_template/src/providers/auth_provider.dart';
import 'package:flutter_template/src/ui/snackbar/snackbar.dart';
import 'package:flutter_template/src/ui/widgets/app_text_field.dart';
import 'package:flutter_template/src/ui/widgets/app_text_field_password.dart';
import 'package:flutter_template/src/ui/widgets/app_v_space.dart';
import 'package:flutter_template/src/utils/check_fields.dart';
import 'package:flutter_template/src/utils/timer.dart';
import 'package:flutter_template/src/utils/validator.dart';

import '../../profile/models/app_user_model.dart';

class RegisterForm extends StatefulWidget {
  const RegisterForm({
    super.key,
  });

  @override
  State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  final _firstName = TextEditingController();
  final _lastName = TextEditingController();
  final _email = TextEditingController();
  final _password = TextEditingController();

  final authService = AuthService();
  final userService = UserService();

  bool _submitting = false;
  bool _terms = false;
  String _error = '';

  @override
  void initState() {
    super.initState();
    if (AppData.dev) {
      test();
    }
  }

  void test() {
    _firstName.text = 'test';
    _lastName.text = 'test';
    _email.text = 'test@${AppData.domain}';
    _password.text = 'password';
    _terms = false;
  }

  Future<void> handleLogin() async {
    final firebaseUser = await authService.login(_email.text, _password.text);
    if (firebaseUser == null) {
      return;
    }

    final user = await userService.get(firebaseUser.uid);
    if (user.hasAccessAdmin || user.hasAccessUser) {
      final provider = AppAuthProvider();
      await provider.login(user);
      delayMilliseconds(
        milliseconds: 0,
        callback: () async {
          AppNavigator.mainTab(context);
        },
      );
    } else {
      delayMilliseconds(
        milliseconds: 0,
        callback: () {
          AppNavigator.requestAccess(context, uid: firebaseUser.uid);
        },
      );
    }
  }

  Future<void> _onSubmit() async {
    setState(() {
      _submitting = true;
      _error = '';
    });

    final firstNameTxt = _firstName.text;
    final lastNameTxt = _lastName.text;
    final emailTxt = _email.text;
    final passwordTxt = _password.text;

    final data = {
      'Nom': lastNameTxt,
      'Prénom': firstNameTxt,
      'Email': emailTxt,
      'Mot de passe': passwordTxt,
    };

    for (final field in data.keys) {
      final error = checkField(field, data[field]);
      if (error.isNotEmpty) {
        setState(() {
          _error = error;
          _submitting = false;
        });

        return;
      }
    }

    final error = checkAuthFields(emailTxt, passwordTxt);
    if (error.isNotEmpty) {
      setState(() {
        _error = error;
        _submitting = false;
      });

      return;
    }

    if (!Validator.isValidEmail(emailTxt)) {
      setState(() {
        _error = '@${AppData.domain}';
        _submitting = false;
      });

      return;
    }

    if (!_terms) {
      setState(() {
        _error = 'Veuillez accepter les conditions';
        _submitting = false;
      });

      return;
    }

    // submit
    try {
      final firebaseUser = await authService.register(emailTxt, passwordTxt);
      if (firebaseUser == null) {
        setState(() {
          _error = 'Veuillez réessayer';
        });

        return;
      }
      /*
      final user = AppUser(
        id: firebaseUser.uid,
        name: firebaseUser.displayName ?? '$firstNameTxt $lastNameTxt',
        email: firebaseUser.email ?? emailTxt,
        firstName: firstNameTxt,
        phone: firebaseUser.phoneNumber ?? '',
        avatar: firebaseUser.photoURL ?? '',
        lastName: lastNameTxt,
      );
      */
      final user = AppUser.empty();
      await userService.add(user);
      wait(() {
        snackBar(context, content: 'Inscription réussite');
        delaySeconds(
          callback: () async {
            await handleLogin();
            _finish();
          },
        );
      });
      /*} on FirebaseAuthException catch (error) {
      setState(() {
        _error = authService.handleFirebaseAuthExceptions(error);
        _submitting = false;
      });
    */
    } catch (e) {
      setState(() {
        _error = authService.handleError(e);
        _submitting = false;
      });
    }
  }

  void _finish() {
    _email.clear();
    _password.clear();
    setState(() {
      _error = '';
      _submitting = false;
    });
  }

  /*
  Future<void> _google() async {
    final service = AuthGoogleService();
    final user = AppUser(
      id: '',
      name: '$_firstName $_lastName',
      email: _email.text,
      firstName: _firstName.text,
      lastName: _lastName.text,
    );
    service.auth(user);
    _finish();
  }
  */

  void _handleTerms({required bool value}) {
    setState(() {
      _terms = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const TitleWidget(
          text: 'Register',
        ),
        AppTextField(
          placeholder: 'Last Name',
          onChanged: (value) {
            _firstName.text = value;
          },
        ),
        AppTextField(
          placeholder: 'First Name',
          onChanged: (value) {
            _lastName.text = value;
          },
        ),
        AppTextField.email(
          label: '',
          onChanged: (value) {
            _email.text = value;
          },
        ),
        AppTextFieldPassword(
          showLabel: false,
          onChange: (value) {
            _password.text = value;
          },
        ),
        const AppVSpace(),
        TermsWidget(checked: _terms, onChanged: _handleTerms),
        const AppVSpace(),
        AuthFormButtons(
          error: _error,
          submitting: _submitting,
          onSubmit: _onSubmit,
        ),
      ],
    );
  }
}
