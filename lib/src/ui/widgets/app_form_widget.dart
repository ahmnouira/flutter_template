import 'package:flutter/material.dart';
import 'package:eco_pat/src/app_navigator.dart';
import 'package:eco_pat/src/features/auth/ui/auth_page_widget.dart';
import 'package:eco_pat/src/features/auth/ui/login_form.dart';
import 'package:eco_pat/src/features/auth/ui/register_form.dart';
import 'package:eco_pat/src/theme/app_colors.dart';
import 'package:eco_pat/src/ui/widgets/app_hero.dart';
import 'package:eco_pat/src/ui/widgets/app_link.dart';
import 'package:eco_pat/src/ui/widgets/app_v_space.dart';

class Form {
  final String title;
  final String subtitle;
  final Widget widget;
  final void Function() action;
  Form(
      {required this.title,
      required this.subtitle,
      required this.widget,
      required this.action});

  factory Form.empty() =>
      Form(title: '', subtitle: '', widget: Container(), action: () => {});
}

enum AppFormName { login, register, edit }

class AppFormWidget extends StatelessWidget {
  final AppFormName name;
  final void Function()? onSubmit;

  const AppFormWidget({
    super.key,
    required this.name,
    this.onSubmit,
  });

  Form renderData(BuildContext context) {
    late Form form;
    if (name == AppFormName.login) {
      form = Form(
          title: "Vous n'avez pas de compte?",
          subtitle: 'Inscrivez-vous maintenant',
          widget: const LoginForm(),
          action: () => AppNavigator.register(context));
    } else if (name == AppFormName.register) {
      form = Form(
          title: "Vous avez déjà un compte?",
          subtitle: "Connectez-vous maintenant",
          widget: const RegisterForm(),
          action: () => AppNavigator.login(context));
    } else if (name == AppFormName.edit) {
      // no need for this..
      form = Form.empty();
    }

    return form;
  }

  @override
  Widget build(BuildContext context) {
    final form = renderData(context);
    final authPage = name == AppFormName.login || name == AppFormName.register;

    return AuthPageWidget(children: [
      const AppHero(),
      form.widget,
      const AppVSpace(),
      if (authPage)
        AppLink(
          text: form.title,
          color: AppColors.black,
        ),
      if (authPage)
        AppLink(
          text: form.subtitle,
          fontWeight: FontWeight.w600,
          color: AppColors.primary,
          big: true,
          onPressed: form.action,
        ),
    ]);
  }
}