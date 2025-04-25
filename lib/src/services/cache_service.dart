import 'preference_service.dart';

class CacheService {
  static const userKey = 'user';
  static const onboardingKey = 'onboarding';
  final _preferenceService = PreferenceService();

  Future<void> invalidate() async {
    final instance = await _preferenceService.getInstance();
    await instance.setBool(userKey, false);
    await instance.setBool(onboardingKey, false);
  }

  Future<void> cacheUser() async {
    await _preferenceService.addBool(userKey, value: true);
  }

  Future<void> completeOnboarding() async {
    await _preferenceService.addBool(userKey, value: true);
  }

  Future<bool> isLoggedIn() async {
    return _preferenceService.getBool(userKey);
  }

  Future<bool> didCompleteOnboarding() async {
    return _preferenceService.getBool(onboardingKey);
  }
}
