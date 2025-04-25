import 'package:flutter/material.dart';
import 'package:flutter_template/src/features/auth/screens/request_access_screen.dart';

import 'features/auth/screens/login_screen.dart';
import 'features/auth/screens/register_screen.dart';
import 'features/onboarding/screens/splash_screen.dart';
import 'ui/layout/main_tab.dart';

class AppNavigator {
  final String? name;

  const AppNavigator({this.name});

  static void to(BuildContext context, Widget page) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (BuildContext context) => page,
      ),
    );
  }

  static void back(BuildContext context) {
    Navigator.pop(context);
  }

  static void replaceWith(BuildContext context, Widget page) {
    Navigator.of(context)
        .pushReplacement(MaterialPageRoute(builder: (context) => page));
  }

  static void protectedNavigateTo(
    BuildContext context,
    String? userId,
    Widget page, {
    bool? replace = false,
  }) {
    if (userId != null) {
      if (replace == true) {
        replaceWith(context, page);
      } else {
        to(context, page);
      }
    } else {
      login(context);
    }
  }

  static void mainTab(
    BuildContext context,
  ) {
    Navigator.popUntil(context, (route) => route.isFirst);
    protected(context, 'userId', const MainTab(), replace: true, protect: true);
  }

  static void logout(BuildContext context) {
    to(context, const SplashScreen());
  }

  static void login(BuildContext context) {
    to(context, const LoginScreen());
  }

  static void loginReplace(BuildContext context) {
    replaceWith(context, const LoginScreen());
  }

  static void register(BuildContext context) {
    to(context, const RegisterScreen());
  }

  static void requestAccess(BuildContext context, {required String uid}) {
    to(
      context,
      RequestAccessScreen(
        uid: uid,
      ),
    );
  }

  static void protected(
    BuildContext context,
    String? userId,
    Widget page, {
    bool? protect = false,
    bool? replace = false,
  }) {
    if (protect == true) {
      protectedNavigateTo(context, userId, page, replace: replace);
    } else {
      to(context, page);
    }
  }
}
