import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

/// 1. `ChangeNotifier` is extended by a class to
///  provide change notifications to its listeners.
///
/// 2. `ChangeNotifierProvider` listens for changes to a ChangeNotifier.
///  Widgets below it can access the state object and listen to state changes.
///
/// 3. `Consumer` wraps around part of widget tree.
/// It rebuilds part of a subtree when the state it listens to changes.
///
/// 4. `Provider.of` allows descendant widgets to access the state object.
///  If you only need access to the state object and don't need to listen for changes, use this!
class AppStateProvider extends ChangeNotifier {
  /// keeps track of which tab the user tapped.
  int selectedTab = 0;

  void goToTab(int index) {
    selectedTab = index;

    // To notify all widgets listening to this state.
    notifyListeners();
  }

  void goToHome() {
    selectedTab = 0;
    notifyListeners();
  }

  void goToProfile() {
    selectedTab = 1;
    notifyListeners();
  }

  static AppStateProvider of(BuildContext context, {bool listen = false}) {
    return Provider.of<AppStateProvider>(context, listen: listen);
  }
}
