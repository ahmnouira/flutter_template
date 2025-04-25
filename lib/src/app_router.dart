import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'features/auth/screens/login_screen.dart';
import 'features/auth/screens/register_screen.dart';
import 'features/onboarding/screens/splash_screen.dart';
import 'providers/auth_provider.dart';

class AppRouter {
  final AppAuthProvider authProvider;

  AppRouter({
    required this.authProvider,
  });

  late final router = GoRouter(
    debugLogDiagnostics: true,
    initialLocation: '/login',
    refreshListenable: authProvider,
    routes: [
      GoRoute(
        name: 'onboarding',
        path: '/onboarding',
        builder: (context, state) => const SplashScreen(),
      ),
      GoRoute(
        name: 'login',
        path: '/login',
        builder: (context, state) => const LoginScreen(),
      ),
      GoRoute(
        name: 'register',
        path: '/register',
        builder: (context, state) => const RegisterScreen(),
      ),
    ],
    errorPageBuilder: (context, state) {
      return MaterialPage(
        key: state.pageKey,
        child: Scaffold(
          body: Center(
            child: Text(state.error.toString()),
          ),
        ),
      );
    },
  );
}
