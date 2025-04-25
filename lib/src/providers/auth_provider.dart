import 'package:flutter/material.dart';
import 'package:flutter_template/src/features/profile/models/app_user_model.dart';
import 'package:provider/provider.dart';

import '../services/cache_service.dart';

class AppAuthProvider extends ChangeNotifier {
  bool _isLoggedIn = false;
  late AppUser _user = AppUser.empty();

  /// Checks to see of the user has completed onboarding
  bool _isOnboardingComplete = false;

  final _cacheService = CacheService();

  /// Property getters.
  bool get isLoggedIn => _isLoggedIn;
  AppUser get user => _user;

  set user(AppUser user) {
    _user = user;
    notifyListeners();
  }

  bool get isOnboardingComplete => _isOnboardingComplete;

  /// Initializes the app
  Future<void> initializeApp() async {
    // Check if the user is logged in
    _isLoggedIn = await _cacheService.isLoggedIn();

    // Check if the user completed onboarding
    _isOnboardingComplete = await _cacheService.didCompleteOnboarding();
  }

  Future<void> login(AppUser user) async {
    _isLoggedIn = true;
    _user = user;
    await _cacheService.cacheUser();
    notifyListeners();
  }

  Future<void> logout() async {
    // Reset all properties once user logs out
    _isLoggedIn = false;
    _isOnboardingComplete = false;
    _user = AppUser.empty();

    // Reinitialize the app
    await _cacheService.invalidate();
    await initializeApp();
    notifyListeners();
  }

  static AppAuthProvider of(BuildContext context, {bool listen = false}) {
    return Provider.of<AppAuthProvider>(context, listen: listen);
  }
}
