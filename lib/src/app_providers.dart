import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'features/items/providers/item_provider.dart';
import 'providers/app_state_provider.dart';
import 'providers/download_provider.dart';

class AppProviders extends StatelessWidget {
  final Widget? child;
  const AppProviders({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      // ChangeNotifierProvider: creates an instance of TabProvider, which listens to tab index changes
      // and notifies its listeners.
      providers: [
        ChangeNotifierProvider(create: (context) => AppStateProvider()),
        ChangeNotifierProvider(create: (context) => ItemProvider()),
        ChangeNotifierProvider(
          create: (context) => DownloadProvider(),
          lazy: true,
        ),
      ],
      child: child,
    );
  }
}
