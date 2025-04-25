import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'app_providers.dart';
import 'features/onboarding/screens/splash_screen.dart';
import 'theme/app_theme.dart';

class App extends StatelessWidget {
  const App({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = AppTheme.light();

    return AppProviders(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Eco-Pat',
        theme: theme,
        home: const SplashScreen(),
        supportedLocales: const [
          Locale('fr', 'FR'),
        ],
        localizationsDelegates: const [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
      ),
    );
  }
}
