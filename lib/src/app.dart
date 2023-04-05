import 'package:flutter/material.dart';

import 'app_providers.dart';
import 'theme/app_theme.dart';
import 'ui/layout/main_tab.dart';

// The root widget of the app
class App extends StatelessWidget {
  /// Creates an [App] instance.
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = AppTheme.light();

    return AppProviders(
      child: MaterialApp(
        // Hiding the debug banner,
        debugShowCheckedModeBanner: false,
        title: 'FlutterApp',
        theme: theme,
        home: const MainTab(),
      ),
    );
  }
}
