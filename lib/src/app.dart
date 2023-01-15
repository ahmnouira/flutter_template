import 'package:flutter/material.dart';

// The root widget of the app
class App extends StatelessWidget {
  /// Creates an [App] instance.
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // Hiding the debug banner,
      debugShowCheckedModeBanner: false,
      title: 'FlutterApp',
      theme: ThemeData.dark(),
    );
  }
}
